/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.lpthinh.controllers;

import com.lpthinh.pojo.Activity;
import com.lpthinh.services.ActivityService;
import com.lpthinh.services.DestinationService;
import java.util.HashMap;
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
public class ActivityController {

    @Autowired
    private ActivityService activityService;

    @Autowired
    private DestinationService destinationService;

    @ModelAttribute
    public void commonAttr(Model model) {
        model.addAttribute("addNewBtn", "#add-new-activity");
        model.addAttribute("headerTitle", "Activities");
    }

    @RequestMapping(value = "/activities", method = RequestMethod.GET)
    public String index(Model model, @RequestParam Map<String, String> params) {

        model.addAttribute("activities", this.activityService.getActivities(params));
        model.addAttribute("destinations", this.destinationService.getDestinations(new HashMap<>()));

        model.addAttribute("activityObj", new Activity());

        return "activities";
    }

    @RequestMapping(value = "/activities", method = RequestMethod.POST)
    public String create(@ModelAttribute("activityObj") @Valid Activity activityObj, BindingResult bindingResult) {

        if (!bindingResult.hasErrors()) {
            try {
                this.activityService.create(activityObj);
                return "redirect:/";
            } catch (Exception e) {
                System.err.println(e.getMessage());
            }
        }

        return "activities";
    }
}
