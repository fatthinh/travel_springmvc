package com.lpthinh.controllers;

import com.lpthinh.pojo.Tour;
import com.lpthinh.services.TourDetailService;
import com.lpthinh.services.TourService;
import java.util.Map;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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
public class TourController {

    @Autowired
    private TourService tourService;

    @Autowired
    private TourDetailService tourDetailService;

    @ModelAttribute
    public void commonAttr(Model model) {
        model.addAttribute("addNewBtn", "#add-new-tour");
        model.addAttribute("headerTitle", "Tours");
        model.addAttribute("tourObj", new Tour());
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(Model model,
            @RequestParam Map<String, String> params) {

        model.addAttribute("tours", this.tourService.getTours(params));
        model.addAttribute("details", this.tourDetailService.getTours(params));

        return "tours";
    }

    @RequestMapping(value = "/", method = RequestMethod.POST)
    public String create(@ModelAttribute("tourObj") @Valid Tour tourObj, BindingResult bindingResult) {
        if (!bindingResult.hasErrors()) {
            try {
                this.tourService.create(tourObj);
                return "redirect:/";
            } catch (Exception e) {
                System.err.println(e.getMessage());
            }
        }
        return "tours";
    }
}
