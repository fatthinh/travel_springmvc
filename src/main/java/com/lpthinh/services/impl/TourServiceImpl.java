/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.lpthinh.services.impl;

import com.lpthinh.pojo.Tour;
import com.lpthinh.pojo.TourDetail;
import com.lpthinh.repositories.TourRepository;
import com.lpthinh.services.TourService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author admin
 */
@Service
public class TourServiceImpl implements TourService {

    @Autowired
    private TourRepository tourRepo;
    
    @Override
    public List<Tour> getTours(Map<String, String> params) {
        return this.tourRepo.getTours(params);
    }
    
    @Override
    public List<Tour> getToursByDetail(TourDetail detail) {
        return this.tourRepo.getToursByDetail(detail);
    }
    
    @Override
    public void create(Tour tour) {
        this.tourRepo.create(tour);
    }
}
