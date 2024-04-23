/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.lpthinh.repositories;

import com.lpthinh.pojo.User;
import java.util.List;
import java.util.Map;

/**
 *
 * @author admin
 */
public interface UserRepository {

    List<User> getUsers(Map<String, String> params);

    User getUserById(int id);

    int getTotalPage();
}
