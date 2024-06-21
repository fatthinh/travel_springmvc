/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.lpthinh.formatters;

import com.lpthinh.pojo.TourDetail;
import java.text.ParseException;
import java.util.Locale;
import org.springframework.format.Formatter;

/**
 *
 * @author admin
 */
public class TourDetailFormatter implements Formatter<TourDetail> {

    @Override
    public String print(TourDetail tourDetail, Locale locale) {
        return String.valueOf(tourDetail.getId());
    }

    @Override
    public TourDetail parse(String id, Locale locale) throws ParseException {
        TourDetail tourDetail = new TourDetail();
        tourDetail.setId(Integer.parseInt(id));

        return tourDetail;
    }
}
