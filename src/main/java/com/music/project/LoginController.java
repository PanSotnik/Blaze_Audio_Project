package com.music.project;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.RequestMapping;

@org.springframework.stereotype.Controller
@RequestMapping("/login")
public class LoginController {
    @RequestMapping
    public String loginPage() {
        return "login";
    }
}
