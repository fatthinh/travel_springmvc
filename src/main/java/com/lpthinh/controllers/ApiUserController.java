/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.lpthinh.controllers;

import com.lpthinh.components.JwtService;
import com.lpthinh.pojo.User;
import com.lpthinh.pojo.UserDTO;
import com.lpthinh.services.UserService;
import java.security.Principal;
import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author admin
 */
@RestController
@RequestMapping("/api")
public class ApiUserController {
    
    @Autowired
    private UserService userService;
    
    @Autowired
    private JwtService jwtService;
    
    @GetMapping(path = "/users/{userId}/", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<User> retrieve(@PathVariable(value = "userId") int id) {
        User user = this.userService.getUserById(id);
        
        return new ResponseEntity<>(user, HttpStatus.OK);
    }
    
    @PostMapping(path = "/register")
    @ResponseStatus(HttpStatus.CREATED)
    public void register(@RequestBody UserDTO user) {
        user.setRole("CUSTOMER");
        this.userService.create(user);
    }
    
    @PostMapping(path = "/login")
    @CrossOrigin
    public ResponseEntity<String> login(@RequestBody UserDTO user) {
        if (this.userService.auth(user) == true) {
            String token = this.jwtService.generateTokenLogin(user.getEmail());
            
            return new ResponseEntity<>(token, HttpStatus.OK);
        }
        
        return new ResponseEntity<>("error", HttpStatus.BAD_REQUEST);
    }
    
    @GetMapping(path = "/current-user")
    @CrossOrigin
    public ResponseEntity<User> getCurrentUser(Principal principal) {
        if (principal == null) {
            return ResponseEntity.notFound().build();
        }
        
        User user = this.userService.getUserByEmail(principal.getName());
//        
//        Map<String, User> res = new HashMap<>();
//        res.put("data", user);
        
        return new ResponseEntity<>(user, HttpStatus.OK);
    }
}
