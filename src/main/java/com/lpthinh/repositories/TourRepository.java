package com.lpthinh.repositories;

import com.lpthinh.pojo.Tour;
import com.lpthinh.pojo.TourDetail;
import java.util.List;
import java.util.Map;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
/**
 *
 * @author admin
 */
public interface TourRepository {

    List<Tour> getTours(Map<String, String> params);

    List<Tour> getToursByDetail(TourDetail detail);

    Tour getTourById(int id);

    void create(Tour tour);

}
