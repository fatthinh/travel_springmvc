/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.lpthinh.controllers;

import com.lpthinh.pojo.User;
import com.lpthinh.services.UserService;
import jakarta.validation.Valid;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author admin
 */
@Controller
@ControllerAdvice
public class UserController {

    @Autowired
    private UserService userService;

    @ModelAttribute
    public void commonAttr(Model model) {
        model.addAttribute("addNewBtn", "#add-new-user");
        model.addAttribute("headerTitle", "Users");
        model.addAttribute("actionName", "users");
    }

    @RequestMapping(path = "/users", method = RequestMethod.GET)
    public String users(Model model,
            @RequestParam Map<String, String> params) {

        if (!params.containsKey("page")) {
            params.put("page", "1");
        }

        model.addAttribute("users", this.userService.getUsers(params));
        model.addAttribute("total", this.userService.getTotalPage());

        return "users";
    }

    @RequestMapping(path = "/users", method = RequestMethod.POST)
    public String users(Model model, @RequestParam Map<String, String> params, @ModelAttribute(value = "user") @Valid User user) {
        
        model.addAttribute("users", this.userService.getUsers(params));
        if (!params.containsKey("page")) {
            params.put("page", "1");
        }

        return "users";
    }
}
