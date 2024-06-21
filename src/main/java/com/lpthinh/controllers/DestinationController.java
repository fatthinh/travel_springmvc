/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.lpthinh.controllers;

import com.lpthinh.pojo.Destination;
import com.lpthinh.services.DestinationService;
import java.util.Map;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author admin
 */
@Controller
public class DestinationController {

    @Autowired
    private DestinationService destinationService;

    @ModelAttribute
    public void commonAttr(Model model) {
        model.addAttribute("addNewBtn", "#add-new-destination");
        model.addAttribute("headerTitle", "Destinations");
    }

    @RequestMapping(value = "/destinations", method = RequestMethod.GET)
    public String index(Model model, @RequestParam Map<String, String> params) {

        model.addAttribute("destinations", this.destinationService.getDestinations(params));
        model.addAttribute("destinationObj", new Destination());

        return "destinations";
    }

    @RequestMapping(value = "/destinations", method = RequestMethod.POST)
    public String create(@ModelAttribute("destinationObj") @Valid Destination destinationObj, BindingResult bindingResult) {
        if (!bindingResult.hasErrors()) {
            try {
                this.destinationService.addOrUpdate(destinationObj);
                return "redirect:/";
            } catch (Exception ex) {
                System.err.println(ex.getMessage());
            }
        }
        return "destinations";
    }
}
