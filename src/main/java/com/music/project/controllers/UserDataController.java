package com.music.project.controllers;

import com.music.project.entities.AppUser;
import com.music.project.enumerations.UserGender;
import com.music.project.enumerations.UserRole;
import com.music.project.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UserDataController {


    @Autowired
    private UserService userService;


    @RequestMapping(value = "/newuser", method = RequestMethod.POST)
    public String newUser(@RequestParam String login,
                          @RequestParam String password,
                          @RequestParam String email,
                          @RequestParam(required = false) String favoriteMusic,
                          @RequestParam(required = false) int age,
                          @RequestParam(required = false) UserGender gender,
                          @RequestParam(required = false) String name,
                          Model model) {

        if (userService.existsByLogin(login) || userService.existsByEmail(email)) {
            model.addAttribute("exists", true);
            return "newuser";
        }


        ShaPasswordEncoder encoder = new ShaPasswordEncoder();
        String passHash = encoder.encodePassword(password, null);


        AppUser dbAppUser = new AppUser(login, passHash, email, UserRole.USER, gender, name, age, favoriteMusic);
        userService.addUser(dbAppUser);
        model.addAttribute("success", true);

        return "login";
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(@RequestParam(required = false) String genre,
                         @RequestParam(required = false) int age,
                         @RequestParam(required = false) UserGender gender,
                         @RequestParam(required = false) String name,
                         @RequestParam(required = false) String email) {

        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername();

        AppUser dbAppUser = userService.getUserByLogin(login);
        dbAppUser.setFavoriteMusic(genre);
        dbAppUser.setAge(age);
        dbAppUser.setGender(gender);
        dbAppUser.setName(name);
        dbAppUser.setEmail(email);

        userService.updateUser(dbAppUser);

        return "redirect:/";
    }

}
