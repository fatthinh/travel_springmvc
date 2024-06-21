package com.lpthinh.controllers;

import com.lpthinh.pojo.Activity;
import com.lpthinh.pojo.Category;
import com.lpthinh.pojo.Image;
import com.lpthinh.pojo.TourDetail;
import com.lpthinh.services.ActivityService;
import com.lpthinh.services.CategoryService;
import com.lpthinh.services.DestinationService;
import com.lpthinh.services.ImageService;
import com.lpthinh.services.TourDetailService;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
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
public class TourDetailController {

    @Autowired
    private TourDetailService tourService;

    @Autowired
    private ActivityService activityService;

    @Autowired
    private ImageService imageService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private DestinationService destinationService;

    @ModelAttribute
    public void commonAttr(Model model) {
        model.addAttribute("addNewBtn", "#add-new-tourdetail");
        model.addAttribute("headerTitle", "Tours");
        model.addAttribute("activities", this.activityService.getActivities(new HashMap<>()));
        model.addAttribute("gallery", this.imageService.getAll());
        model.addAttribute("categories", this.categoryService.getAll());
        model.addAttribute("destinations", this.destinationService.getDestinations(new HashMap<>()));
        model.addAttribute("tourDetailObj", new TourDetail());
    }

    @RequestMapping(value = "/tours", method = RequestMethod.GET)
    public String index(Model model,
            @RequestParam Map<String, String> params) {
        model.addAttribute("tours", this.tourService.getTours(params));

        return "tours-detail";
    }

    @RequestMapping(value = "/tours", method = RequestMethod.POST)
    public String create(@ModelAttribute("tourDetailObj") @Valid TourDetail tourDetailObj, BindingResult bindingResult, HttpSession session) {

        if (!bindingResult.hasErrors()) {
            try {
                this.tourService.create(tourDetailObj, (Map<Object, List<Category>>) session.getAttribute("tour-category"), (Map<Object, List<Activity>>) session.getAttribute("tour-activity"), (Map<Object, List<Image>>) session.getAttribute("tour-gallery"));
                return "redirect:/";
            } catch (Exception e) {
                System.err.println(e.getMessage());
            }
        }

        return "activities";
    }
}
