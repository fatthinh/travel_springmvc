/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.lpthinh.services;

import com.lpthinh.pojo.Activity;
import com.lpthinh.pojo.Category;
import com.lpthinh.pojo.Image;
import com.lpthinh.pojo.TourActivity;
import com.lpthinh.pojo.TourDetail;
import java.util.Collection;
import java.util.List;
import java.util.Map;

/**
 *
 * @author admin
 */
public interface TourDetailService {

    List<TourDetail> getTours(Map<String, String> params);

    TourDetail getTourById(int id);

    List<TourActivity> getActivitiesByDetail(TourDetail detail);

    Collection<Image> getGallery(TourDetail detail);

    void create(TourDetail tourDetail, Map<Object, List<Category>> categories, Map<Object, List<Activity>> activities, Map<Object, List<Image>> gallery);

    void put(TourDetail tourDetail, Map<Object, List<Category>> categories, Map<Object, List<Activity>> activities, Map<Object, List<Image>> gallery);
}
