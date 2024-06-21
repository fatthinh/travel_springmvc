/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.lpthinh.services.impl;

import com.lpthinh.pojo.Image;
import com.lpthinh.repositories.ImageRepository;
import com.lpthinh.services.ImageService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author admin
 */
@Service
public class ImageServiceImpl implements ImageService {

    @Autowired
    private ImageRepository imageRepository;

    @Override
    public List<Image> getAll() {
        return this.imageRepository.getAll();
    }

    @Override
    public Image getById(int id) {
        return this.imageRepository.getById(id);
    }

}
