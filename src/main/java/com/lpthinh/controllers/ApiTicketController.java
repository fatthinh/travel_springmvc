/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.lpthinh.controllers;

import com.lpthinh.pojo.TicketType;
import com.lpthinh.services.TicketService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author admin
 */
@RestController
@RequestMapping("/api")
public class ApiTicketController {

    @Autowired
    private TicketService service;

    @GetMapping("/ticket-types")
    @CrossOrigin
    public ResponseEntity<List<TicketType>> getAllTypes() {
        return ResponseEntity.ok(this.service.getAllTypes());
    }
}
