/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.lpthinh.services;

import com.lpthinh.pojo.Image;
import java.util.List;

/**
 *
 * @author admin
 */
public interface ImageService {

    List<Image> getAll();

    Image getById(int id);

}
