/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.lpthinh.controllers;

import com.lpthinh.services.BookingService;
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
public class BookingController {

    @Autowired
    private BookingService bookingService;

    @ModelAttribute
    public void commonAttr(Model model) {
        model.addAttribute("addNewBtn", "#add-new-booking");
        model.addAttribute("headerTitle", "Bookings");
    }

    @RequestMapping(path = "/bookings", method = RequestMethod.GET)
    public String bookings(Model model,
            @RequestParam Map<String, String> params) {

        model.addAttribute("bookings", this.bookingService.getBookings(params));
        return "bookings";
    }

//    @RequestMapping(path = "/bookings", method = RequestMethod.POST)
//    public String createBooking(@ModelAttribute(value = "booking") @Valid Booking booking, BindingResult bindingResult) {
//        if (!bindingResult.hasErrors())
//            try {
//            this.bookingService.addBooking(booking);
//            return "redirect:/";
//        } catch (Exception e) {
//            System.err.println(e.getMessage());
//        }
//        return "bookings";
//    }
}
