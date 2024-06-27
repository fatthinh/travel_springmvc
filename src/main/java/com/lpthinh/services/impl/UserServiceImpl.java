/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.lpthinh.services.impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.lpthinh.pojo.User;
import com.lpthinh.pojo.UserDTO;
import com.lpthinh.repositories.UserRepository;
import com.lpthinh.services.UserService;
import java.io.IOException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author admin
 */
@Service("userDetailsService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepo;

    @Autowired
    private Cloudinary cloudinary;

    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    @Override
    public List<User> getUsers(Map<String, String> params) {
        return this.userRepo.getUsers(params);
    }

    @Override
    public User getUserById(int id) {
        return this.userRepo.getUserById(id);
    }

    @Override
    public int getTotalPage() {
        return this.userRepo.getTotalPage();
    }

    @Override
    public int create(UserDTO user) {
        if (user.getPassword() != user.getConfirmPassword()) {
            return 0;
        }

        String password = user.getPassword();
        user.setPassword(this.passwordEncoder.encode(password));

        return this.userRepo.create(user);
    }

    @Override
    public boolean auth(UserDTO user) {
        return this.userRepo.auth(user);
    }

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        Map<String, String> params = new HashMap<>();
        params.put("email", email);
        List<User> users = this.getUsers(params);

        if (users.isEmpty()) {
            throw new UsernameNotFoundException("User doesn't exist!");
        }

        User user = users.get(0);

        Set<GrantedAuthority> authorities = new HashSet<>();
        authorities.add(new SimpleGrantedAuthority(user.getRole()));

        return new org.springframework.security.core.userdetails.User(user.getEmail(), user.getPassword(), authorities);
    }

    @Override
    public User getUserByEmail(String email) {
        return this.userRepo.getUserByEmail(email);
    }

    @Override
    public void updateAvatar(User user, MultipartFile file) {
        if (file != null) {
            try {
                Map response = this.cloudinary.uploader().upload(file.getBytes(), ObjectUtils.asMap("resource_type", "auto"));
                user.setAvatar(response.get("secure_url").toString());
            } catch (IOException ex) {
                Logger.getLogger(UserServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        this.userRepo.updateAvatar(user);
    }
}
