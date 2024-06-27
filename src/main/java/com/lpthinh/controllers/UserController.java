/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.lpthinh.controllers;

import com.lpthinh.pojo.User;
import com.lpthinh.pojo.UserDTO;
import com.lpthinh.services.UserService;
import jakarta.validation.Valid;
import java.io.File;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author admin
 */
@Controller
@ControllerAdvice
public class UserController {

    @Autowired
    private UserService userService;

    public boolean isAuthenticated() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication == null || AnonymousAuthenticationToken.class.
                isAssignableFrom(authentication.getClass())) {
            return false;
        }
        return authentication.isAuthenticated();
    }

    @ModelAttribute
    public void commonAttr(Model model) {
        model.addAttribute("addNewBtn", "#add-new-user");
        model.addAttribute("headerTitle", "Users");
        model.addAttribute("actionName", "users");
        model.addAttribute("userObj", new UserDTO());
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
    public String create(@ModelAttribute(value = "user") @Valid UserDTO user, BindingResult bindingResult) {
        if (!bindingResult.hasErrors()) {
            try {
                int result = this.userService.create(user);
                if (result == 0) {
                    return "redirect:/";

                }
                return String.format("redirect:/%s", result);
            } catch (Exception e) {
                System.err.print(e.getMessage());
            }
        }

        return "users";
    }

    @RequestMapping(path = "/users/{userId}", method = RequestMethod.GET)
    public String retrieve(Model model, @PathVariable("userId") int id) {
        User user = this.userService.getUserById(id);
        model.addAttribute("addNewBtn", "#edit");
        model.addAttribute("headerTitle", String.format("%s %s", user.getFirstName(), user.getLastName()));
        model.addAttribute("user", user);

        return "userDetail";
    }

    @RequestMapping(path = "/users/{userId}/update-avt", method = RequestMethod.POST, consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public String updateAvatar(Model model, @PathVariable("userId") int id, @RequestParam("file") MultipartFile file) {
        User user = this.userService.getUserById(id);
        model.addAttribute("addNewBtn", "#edit");
        model.addAttribute("headerTitle", String.format("%s %s", user.getFirstName(), user.getLastName()));
        model.addAttribute("user", user);
        this.userService.updateAvatar(user, file);
        return "userDetail";
    }

    @RequestMapping(path = "/login", method = RequestMethod.GET)
    public String loginView() {
        if (isAuthenticated()) {
            return "redirect:/";
        }
        return "loginPage";
    }
}
