/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.lpthinh.services.impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.lpthinh.pojo.Destination;
import com.lpthinh.repositories.DestinationRepository;
import com.lpthinh.services.DestinationService;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DestinationServiceImpl implements DestinationService {

    @Autowired
    private DestinationRepository destinationRepo;

    @Autowired
    private Cloudinary cloudinary;

    @Override
    public List<Destination> getDestinations(Map<String, String> params) {
        return this.destinationRepo.getDestinations(params);
    }

    @Override
    public void addOrUpdate(Destination destination) {
        if (!destination.getFile().isEmpty()) {
            try {
                Map response = this.cloudinary.uploader().upload(destination.getFile().getBytes(), ObjectUtils.asMap("resource_type", "auto"));
                destination.setThumbnail(response.get("secure_url").toString());
                System.out.print(response.get("secure_url").toString());
            } catch (IOException ex) {
                Logger.getLogger(DestinationServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        this.destinationRepo.addOrUpdate(destination);
    }

    @Override
    public Destination getById(int id) {
        return this.destinationRepo.getById(id);
    }

}
