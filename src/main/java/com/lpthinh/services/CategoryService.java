package com.lpthinh.services;

import com.lpthinh.pojo.Category;
import java.util.List;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author admin
 */
public interface CategoryService {

    List<Category> getAll();

    Category getById(int id);
}
