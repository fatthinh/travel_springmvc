/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.lpthinh.services.impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.lpthinh.pojo.Activity;
import com.lpthinh.pojo.Category;
import com.lpthinh.pojo.Image;
import com.lpthinh.pojo.TourActivity;
import com.lpthinh.pojo.TourDetail;
import com.lpthinh.repositories.ActivityRepository;
import com.lpthinh.repositories.CategoryRepository;
import com.lpthinh.repositories.TourDetailRepository;
import com.lpthinh.services.TourDetailService;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author admin
 */
@Service
public class TourDetailServiceImpl implements TourDetailService {

    @Autowired
    private TourDetailRepository tourRepo;

    @Autowired
    private CategoryRepository categoryRepo;

    @Autowired
    private ActivityRepository activityRepo;

    @Autowired
    private Cloudinary cloudinary;

    @Override
    public List<TourDetail> getTours(Map<String, String> params) {
        return this.tourRepo.getTours(params);
    }

    @Override
    public TourDetail getTourById(int id) {
        return this.tourRepo.getTourById(id);
    }

    @Override
    public List<TourActivity> getActivitiesByDetail(TourDetail detail) {
        return this.tourRepo.getActivitiesByDetail(detail);
    }

    @Override
    public Collection<Image> getGallery(TourDetail detail) {
        return this.tourRepo.getGallery(detail);
    }

    @Override
    public void create(TourDetail tourDetail, Map<Object, List<Category>> categories, Map<Object, List<Activity>> activities, Map<Object, List<Image>> gallery) {
        if (!tourDetail.getFile().isEmpty()) {
            try {
                Map response = this.cloudinary.uploader().upload(tourDetail.getFile().getBytes(), ObjectUtils.asMap("resource_type", "auto"));
                tourDetail.setThumbnail(response.get("secure_url").toString());
                System.out.print(response.get("secure_url").toString());
            } catch (IOException ex) {
                Logger.getLogger(DestinationServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        tourDetail.setCategoryCollection(categories.get("newTour"));
        tourDetail.setImageCollection(gallery.get("newTour"));
        this.tourRepo.create(tourDetail);

        int count = 1;
        for (Activity act : activities.get("newTour")) {
            this.activityRepo.createTourActivity(act, tourDetail, count++);
        }

    }

}
