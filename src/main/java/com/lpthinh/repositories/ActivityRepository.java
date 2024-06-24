/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.lpthinh.repositories;

import com.lpthinh.pojo.Activity;
import com.lpthinh.pojo.TourActivity;
import com.lpthinh.pojo.TourDetail;
import java.util.List;
import java.util.Map;

/**
 *
 * @author admin
 */
public interface ActivityRepository {

    List<Activity> getActivities(Map<String, String> params);

    Activity getActivityById(int id);

    void create(Activity activity);

    void createTourActivity(Activity activity, TourDetail tourDetail, int day);

    void removeTourActivity(Activity act, TourDetail tour);

}
