package com.EgorProject.VSportZale.controller;

import com.EgorProject.VSportZale.domain.User;
import com.EgorProject.VSportZale.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.Map;

@Controller
public class SignController {
    @Autowired
    private UserService userService;
    @GetMapping("/sign")
    public String registration(Model model)
    {
        model.addAttribute("message", "");
        return ("/sign");
    }
    @PostMapping("/sign")
    public String addUser(User user, Map<String, Object> model) {


        if(!userService.addUser(user)) {

            model.put("message", "Пользователь уже зарегистрирован!");
            return "sign";

        }


        return "redirect:/login";
    }
    @GetMapping("/activate/{code}")
    public String activate(Model model, @PathVariable String code) {
        boolean isActivated = userService.activateUser(code);

        if (isActivated) {
            model.addAttribute("message", "Учетная запись успешно активирована!");
        } else {
            model.addAttribute("message", "Ошибка активации!");
        }

        return "login";
    }
}
