/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.lpthinh.repositories;

import com.lpthinh.pojo.Category;
import java.util.List;

/**
 *
 * @author admin
 */
public interface CategoryRepository {

    List<Category> getAll();

    Category getById(int id);

}
