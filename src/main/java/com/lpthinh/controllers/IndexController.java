/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.lpthinh.controllers;

import java.util.Map;
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
public class IndexController {

    @ModelAttribute
    public void commonAttr(Model model) {
        model.addAttribute("addNewBtn", "#add-new-tour");
        model.addAttribute("headerTitle", "Tours");
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(Model model,
            @RequestParam Map<String, String> params) {

        return "index";
    }
}
