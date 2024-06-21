/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.lpthinh.services;

import com.lpthinh.pojo.Tour;
import com.lpthinh.pojo.TourDetail;
import java.util.List;
import java.util.Map;

/**
 *
 * @author admin
 */
public interface TourService {

    List<Tour> getTours(Map<String, String> params);

    List<Tour> getToursByDetail(TourDetail detail);

    void create(Tour tour);

}
