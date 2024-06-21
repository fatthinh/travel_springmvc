/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.lpthinh.controllers;

import com.lpthinh.pojo.GalleryItem;
import com.lpthinh.services.ActivityService;
import com.lpthinh.services.ImageService;
import com.lpthinh.services.TourDetailService;
import com.lpthinh.services.CategoryService;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author admin
 */
@RestController
@RequestMapping("/api")
public class ApiGalleryItemController {

    @Autowired
    private ImageService imageService;

    @Autowired
    private TourDetailService tourDetailService;

    @Autowired
    private ActivityService activityService;

    @Autowired
    private CategoryService categoryService;

    @PostMapping(value = "/tour-gallery")
    public ResponseEntity<Map<String, List<Object>>> addToTourGallery(@RequestBody GalleryItem galleryItem, HttpSession session) {
        Map<String, List<Object>> tourGallery = this.add(galleryItem, session, "tour-gallery");

        return ResponseEntity.ok(tourGallery);
    }

    @PostMapping(value = "/tour-activity")
    public ResponseEntity<Map<String, List<Object>>> addToTourActivityCollection(@RequestBody GalleryItem galleryItem, HttpSession session) {
        Map<String, List<Object>> tourActivities = this.add(galleryItem, session, "tour-activity");

        return ResponseEntity.ok(tourActivities);
    }

    @PostMapping(value = "/tour-category")
    public ResponseEntity<Map<String, List<Object>>> addToTourCategory(@RequestBody GalleryItem galleryItem, HttpSession session) {
        Map<String, List<Object>> tourCategories = this.add(galleryItem, session, "tour-category");

        return ResponseEntity.ok(tourCategories);
    }

    private Map<String, List<Object>> add(@RequestBody GalleryItem galleryItem, HttpSession session, String attribute) {
        Map<String, List<Object>> tourObjects = (Map<String, List<Object>>) session.getAttribute(attribute);

        if (tourObjects == null) {
            tourObjects = new HashMap<>();
        }

        int objectId = Integer.parseInt((String) galleryItem.getSecond_obj());
        Object object;
        switch (attribute) {
            case "tour-category":
                object = categoryService.getById(objectId);
                break;
            case "tour-activity":
                object = activityService.getActivityById(objectId);
                break;
            case "tour-gallery":
                object = imageService.getById(objectId);
                break;
            default:
                throw new AssertionError();
        }

        String tourId = (galleryItem.getFirst_obj() == null) ? "newTour" : (String) galleryItem.getFirst_obj();

        tourObjects.computeIfAbsent(tourId, k -> new ArrayList<>());

        List<Object> gallery = tourObjects.get(tourId);

        if (gallery.contains(object)) {
            gallery.remove(object);
        } else {
            gallery.add(object);
        }

        session.setAttribute(attribute, tourObjects);
        return tourObjects;
    }
}
