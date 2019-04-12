package com.example.demo.controller;

import com.example.demo.domain.TempUser;
import com.example.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class RegistrationController {
    private final UserService userService;

    @Autowired
    public RegistrationController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/registration")
    public String registration() {
        return "registration";
    }

    @GetMapping("/activate/{code}")
    public String activate(Model model, @PathVariable String code) {
        boolean isActivated = userService.activateUser(code);

        if(isActivated){
            model.addAttribute("message","User successfully activated");
        }else{
            model.addAttribute("message","User has already been activated previously");
        }

        return "login";
    }

    @PostMapping("/registration")
    public String addUser(TempUser tempUser, Model model) {

        if (!userService.addUser(tempUser)) {
            model.addAttribute("message", "User already exists");
            return "registration";
        }


        return "redirect:/login";
    }
}
