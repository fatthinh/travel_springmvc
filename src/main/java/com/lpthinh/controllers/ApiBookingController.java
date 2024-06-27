/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.lpthinh.controllers;

import com.lpthinh.pojo.BookingDTO;
import com.lpthinh.pojo.Invoice;
import com.lpthinh.services.BookingService;
import com.lpthinh.services.InvoiceService;
import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author admin
 */
@RestController
@RequestMapping("/api")
public class ApiBookingController {

    @Autowired
    private BookingService bookingService;

    @Autowired
    private InvoiceService invoiceService;

    @PostMapping("/book")
    @CrossOrigin
    public ResponseEntity<Map<String, Invoice>> book(@RequestBody BookingDTO booking) {
        Map<String, Invoice> data = new HashMap<>();
        data.put("data", this.bookingService.addBooking(booking));

        return ResponseEntity.ok(data);
    }
}
