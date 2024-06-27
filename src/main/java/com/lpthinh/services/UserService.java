/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.lpthinh.services;

import com.lpthinh.pojo.User;
import com.lpthinh.pojo.UserDTO;
import java.io.File;
import java.util.List;
import java.util.Map;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author admin
 */
public interface UserService extends UserDetailsService {

    List<User> getUsers(Map<String, String> params);

    User getUserById(int id);

    User getUserByEmail(String email);

    int getTotalPage();

    int create(UserDTO user);

    boolean auth(UserDTO user);
    
    void updateAvatar(User user, MultipartFile file);
}
