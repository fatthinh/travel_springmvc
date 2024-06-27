/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.lpthinh.controllers;

import com.lpthinh.pojo.Destination;
import com.lpthinh.services.DestinationService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author admin
 */
@RestController
@RequestMapping("/api")
public class ApiDestinationController {

    @Autowired
    private DestinationService service;

    @GetMapping("/destinations")
    @CrossOrigin
    public ResponseEntity<List<Destination>> list(@RequestParam Map<String, String> params) {
        return new ResponseEntity<>(this.service.getDestinations(params), HttpStatus.OK);
    }
}
