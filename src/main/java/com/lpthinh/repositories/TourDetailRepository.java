/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.lpthinh.repositories;

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
public interface TourDetailRepository {

    List<TourDetail> getTours(Map<String, String> params);

    List<TourActivity> getActivitiesByDetail(TourDetail detail);

    Collection<Image> getGallery(TourDetail detail);

    TourDetail getTourById(int id);

    void create(TourDetail tourDetail);
}
