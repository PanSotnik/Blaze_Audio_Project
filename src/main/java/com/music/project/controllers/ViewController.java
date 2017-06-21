package com.music.project.controllers;

import com.music.project.config_misc.ModelGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ViewController {

    @Autowired
    private ModelGenerator generator;

    @RequestMapping("/signup")
    public String register(){ return "newuser";}

    @RequestMapping("/")
    public String cabinet(Model model){

        model.addAllAttributes(generator.populateModel());

        return "cabinet";
    }

    @RequestMapping("/help")
    public String help(Model model){

        model.addAllAttributes(generator.returnMap());

        return "help";
    }

    @RequestMapping("/edit")
    public String edit(Model model){

        model.addAllAttributes(generator.returnMap());

        return "edit";
    }

    @RequestMapping("/upload")
    public String upload(Model model){

        model.addAllAttributes(generator.returnMap());

        return "upload";
    }

    @RequestMapping("/logout_control")
    public String logoutControl(){
        generator.clearMap();
        return "redirect:/logout";
    }


}
