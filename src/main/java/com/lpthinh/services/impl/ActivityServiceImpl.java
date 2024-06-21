/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.lpthinh.services.impl;

import com.lpthinh.pojo.Activity;
import com.lpthinh.repositories.ActivityRepository;
import com.lpthinh.services.ActivityService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author admin
 */
@Service
public class ActivityServiceImpl implements ActivityService {
    
    @Autowired
    private ActivityRepository activityRepository;

    
    @Override
    public List<Activity> getActivities(Map<String, String> params) {
        return this.activityRepository.getActivities(params);
    }
    
    @Override
    public Activity getActivityById(int id) {
        return this.activityRepository.getActivityById(id);
    }
    
    @Override
    public void create(Activity activity) {
        this.activityRepository.create(activity);
    }
    
}
