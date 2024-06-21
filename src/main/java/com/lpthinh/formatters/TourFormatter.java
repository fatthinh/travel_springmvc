/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.lpthinh.formatters;

import com.lpthinh.pojo.Tour;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import org.springframework.format.Formatter;

/**
 *
 * @author admin
 */
public class TourFormatter implements Formatter<Tour> {

    @Override
    public String print(Tour tour, Locale locale) {
        return String.valueOf(tour.getId());
    }

    @Override
    public Tour parse(String stringDate, Locale locale) throws ParseException {
        Tour tour = new Tour();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

        Date date = formatter.parse(stringDate);
        
        tour.setDepartureDate(date);

        return tour;
    }
}
