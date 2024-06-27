/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.lpthinh.services.impl;

import com.lpthinh.pojo.Booking;
import com.lpthinh.pojo.BookingDTO;
import com.lpthinh.pojo.Invoice;
import com.lpthinh.repositories.BookingRepository;
import com.lpthinh.services.BookingService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author admin
 */
@Service
public class BookingServiceImpl implements BookingService {

    @Autowired
    private BookingRepository bookingRepo;

    @Override
    public List<Booking> getBookings(Map<String, String> params) {
        return this.bookingRepo.getBookings(params);
    }

    @Override
    public Invoice addBooking(BookingDTO bookingInfo) {
        return this.bookingRepo.addBooking(bookingInfo);
    }

}
