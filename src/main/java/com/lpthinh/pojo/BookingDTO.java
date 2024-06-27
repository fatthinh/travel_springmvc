/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.lpthinh.pojo;

import java.util.List;

/**
 *
 * @author admin
 */
@lombok.Getter
@lombok.Setter
public class BookingDTO {

    private String firstName;
    private String lastName;
    private String phone;
    private String email;
    private String address;
    private String notes;
    private int tourId;
    private List<TicketDTO> tickets;

    public BookingDTO() {
    }

}
