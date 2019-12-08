package com.EgorProject.VSportZale.controller;

import com.EgorProject.VSportZale.domain.Role;
import com.EgorProject.VSportZale.domain.User;
import com.EgorProject.VSportZale.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.Collections;
import java.util.Map;

@Controller
public class SignController {
    @Autowired
    private UserRepo userRepo;
    @GetMapping("/sign")
    public String sign() {
        return "sign";
    }
    @PostMapping("/sign")
    public String addUser(User user, Map<String, Object> model) {
        User userfromDb = userRepo.findByUsername(user.getUsername());

        if(userfromDb != null) {

            model.put("message", "Пользователь уже зарегистрирован!");
            return "sign";

        }
        user.setActivity(true);
        user.setRoles(Collections.singleton(Role.USER));
        userRepo.save(user);

        return "redirect:/login";
    }
}
