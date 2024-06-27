/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.lpthinh.repositories;

import com.lpthinh.pojo.Booking;
import com.lpthinh.pojo.BookingDTO;
import com.lpthinh.pojo.Invoice;
import java.util.List;
import java.util.Map;

/**
 *
 * @author admin
 */
public interface BookingRepository {

    List<Booking> getBookings(Map<String, String> params);
    Invoice addBooking(BookingDTO bookingInfo);
}
