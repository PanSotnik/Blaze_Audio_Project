package com.music.project.config_misc;


import com.music.project.entities.AppUser;
import com.music.project.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Component;

import java.util.HashMap;

@Component
public class ModelGenerator {

    @Autowired
    private UserService userService;

    private HashMap<String, Object> models = new HashMap<>();

    //This method is called only once when a user enters their cabinet
    public HashMap<String, Object> populateModel(){

        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername();

        AppUser dbAppUser = userService.getUserByLogin(login);

        models.put("login", login);
        models.put("roles", user.getAuthorities());
        models.put("email", dbAppUser.getEmail());
        models.put("gender", dbAppUser.getGender());
        models.put("name", dbAppUser.getName());
        models.put("age", dbAppUser.getAge());
        models.put("music", dbAppUser.getFavoriteMusic());

        return models;
    }

    //This method is for when all other times user data is accessed
    public HashMap<String, Object> returnMap(){
        return models;
    }

    public void clearMap(){
        models.clear();
    }




}
