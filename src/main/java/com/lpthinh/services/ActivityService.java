/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.lpthinh.services;

import com.lpthinh.pojo.Activity;
import com.lpthinh.pojo.TourDetail;
import java.util.List;
import java.util.Map;

/**
 *
 * @author admin
 */
public interface ActivityService {

    List<Activity> getActivities(Map<String, String> params);

    Activity getActivityById(int id);

    void create(Activity activity);
}
