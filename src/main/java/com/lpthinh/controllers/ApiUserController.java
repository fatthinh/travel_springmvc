/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.lpthinh.controllers;

import com.lpthinh.pojo.User;
import com.lpthinh.services.UserService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author admin
 */
@RestController
public class ApiUserController {

    @Autowired
    private UserService userService;

    @GetMapping(path = "/api/users/{userId}/", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<User> retrieve(@PathVariable(value = "userId") int id) {
        User user = this.userService.getUserById(id);

        return new ResponseEntity<>(user, HttpStatus.OK);
    }
}
