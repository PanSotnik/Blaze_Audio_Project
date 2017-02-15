package com.music.project;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.UUID;

@Controller
public class RestorePasswordController {

    @Autowired
    private UserService userService;

    @SuppressWarnings("SpringJavaAutowiringInspection")
    @Autowired
    private JavaMailSender mailSender;

    private String setResetPasswordToken;


    @RequestMapping("/restore")
    public String restorePage(){ return "restore"; }

    @RequestMapping(value = "/resetpassword", method = RequestMethod.POST)
    public String resetPasswordSender(@RequestParam String email, Model model) throws IOException, MessagingException {

        AppUser foundUser = userService.findUserByEmail(email);

        if (foundUser != null) {
            String secureToken = UUID.randomUUID().toString();
            foundUser.setResetPasswordToken(secureToken);

            Date currentDate = new Date();
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(currentDate);
            calendar.add(Calendar.HOUR_OF_DAY, 3);

            Date expirationDate = calendar.getTime();
            foundUser.setResetPasswordExpires(expirationDate);
            userService.updateUser(foundUser);

            String greeting = foundUser.getLogin();
            String text = "Hello, " + greeting + ".\n\n" + "Thank you for being a part of BlazeAudio."
                    + " Please use the below link to set a new account password (valid for 3 hours):\n\n"
                    + ServletUriComponentsBuilder.fromCurrentContextPath().path("/finalizerestore").queryParam("_key", secureToken).build().toUriString()
                    + "\n\n Looking forward to more of your shared music!";

            sendResetPasswordLink(foundUser.getEmail(), text);

            model.addAttribute("success", true);
            return "restore";

        }
        model.addAttribute("success", false);
        return "restore";
    }

        private void sendResetPasswordLink(String email, String text) throws MessagingException, IOException{

            MimeMessage message = mailSender.createMimeMessage();

        MimeMessageHelper helper = new MimeMessageHelper(message, true);
        helper.setTo(email);
        helper.setText(text, true);
        helper.setSubject("Password reset request");
        mailSender.send(message);
    }


    @RequestMapping(value = "/finalizerestore", method = RequestMethod.GET)
    public String resetView(@RequestParam(value = "_key") String resetPasswordToken, Model model){

        AppUser foundUser = userService.findByResetPasswordToken(resetPasswordToken);
        Date expirationDate;
        setResetPasswordToken = resetPasswordToken;

        if (foundUser != null){
            expirationDate = foundUser.getResetPasswordExpires();

            if (expirationDate.after(new Date())) {
                return "reset";
            }
        }
        model.addAttribute("success", false);
        return "login";
    }


    @RequestMapping(value = "/finalizerestore", method = RequestMethod.POST)
    public String resetMechanism(@RequestParam String newPassword,
                                 Model model){

        AppUser userToUpdate = userService.findByResetPasswordToken(setResetPasswordToken);

        ShaPasswordEncoder encoder = new ShaPasswordEncoder();
        String passHash = encoder.encodePassword(newPassword, null);

        userToUpdate.setPassword(passHash);
        userToUpdate.setResetPasswordToken(null);
        userToUpdate.setResetPasswordExpires(null);

        userService.updateUser(userToUpdate);

        model.addAttribute("success", true);
        return "login";
    }




}

