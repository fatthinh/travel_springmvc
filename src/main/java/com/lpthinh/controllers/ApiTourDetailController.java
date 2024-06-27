/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.lpthinh.controllers;

import com.lpthinh.pojo.Image;
import com.lpthinh.pojo.Tour;
import com.lpthinh.pojo.TourActivity;
import com.lpthinh.pojo.TourDetail;
import com.lpthinh.services.TourDetailService;
import com.lpthinh.services.TourService;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author admin
 */
@RestController
@RequestMapping("/api")
@CrossOrigin
public class ApiTourDetailController {

    @Autowired
    private TourDetailService tourDetailService;

    @Autowired
    private TourService tourService;

    @GetMapping("/tour-detail")
    public ResponseEntity<List<TourDetail>> list(@RequestParam Map<String, String> params) {

        return new ResponseEntity<>(this.tourDetailService.getTours(params), HttpStatus.OK);
    }

    @GetMapping(path = "/tour-detail/{tourId}/", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<TourDetail> retrieve(@PathVariable(value = "tourId") int id) {
        TourDetail tour = this.tourDetailService.getTourById(id);
        
        return new ResponseEntity<>(tour, HttpStatus.OK);
    }

    @GetMapping(path = "/tour-detail/{tourId}/available")
    public ResponseEntity<List<Tour>> getAvailableTours(@PathVariable(value = "tourId") int id) {
        TourDetail tour = this.tourDetailService.getTourById(id);
        List<Tour> availableTours = this.tourService.getToursByDetail(tour);
        return new ResponseEntity<>(availableTours, HttpStatus.OK);
    }

    @GetMapping(path = "/tour-detail/{tourId}/activities")
    public ResponseEntity<List<TourActivity>> getActivities(@PathVariable(value = "tourId") int id) {
        TourDetail tour = this.tourDetailService.getTourById(id);
        List<TourActivity> activities = this.tourDetailService.getActivitiesByDetail(tour);
        return new ResponseEntity<>(activities, HttpStatus.OK);
    }

    @GetMapping(path = "/tour-detail/{tourId}/gallery", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Collection<Image>> getGallery(@PathVariable(value = "tourId") int id) {
        TourDetail tour = this.tourDetailService.getTourById(id);
        Collection<Image> gallery = this.tourDetailService.getGallery(tour);

        return new ResponseEntity<>(gallery, HttpStatus.OK);
    }
}
