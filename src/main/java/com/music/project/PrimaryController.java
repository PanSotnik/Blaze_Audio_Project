package com.music.project;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;
import java.util.List;

@Controller
public class PrimaryController {


    @Autowired
    private UserService userService;

    private HashMap<String, Object> models = new HashMap<>();

    //Method fills in map above. Map is shared between all models.
    private void userData(){

        User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername();

        AppUser dbAppUser = userService.getUserByLogin(login);

        models.put("login", login);
        models.put("roles", user.getAuthorities());
        models.put("email", dbAppUser.getEmail());
        models.put("gender", dbAppUser.getGender());
        models.put("name", dbAppUser.getName());
        models.put("age", dbAppUser.getAge());
        models.put("music", dbAppUser.getFavoriteMusic());
    }


    @RequestMapping("/")
    public String cabinet(Model model){

        userData();
        model.addAllAttributes(models);

        return "cabinet";
    }

    @RequestMapping("/upload")
    public String upload(Model model){

        model.addAllAttributes(models);

        return "upload";
    }

    @RequestMapping("/help")
    public String help(Model model){

           model.addAllAttributes(models);

        return "help";
    }

    @RequestMapping("/signup")
    public String register(){ return "newuser";}


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

    @RequestMapping("/edit")
    public String edit(Model model){

        model.addAllAttributes(models);

        return "edit";
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


    @RequestMapping("/logout_control")
    public String logoutControl(){
        models.clear();
        return "redirect:/logout";
    }







}
