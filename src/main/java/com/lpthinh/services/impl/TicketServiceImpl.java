/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.lpthinh.services.impl;

import com.lpthinh.pojo.TicketType;
import com.lpthinh.repositories.TicketRepository;
import com.lpthinh.services.TicketService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author admin
 */
@Service
public class TicketServiceImpl implements TicketService {

    @Autowired
    private TicketRepository ticketRepo;

    @Override
    public List<TicketType> getAllTypes() {
        return this.ticketRepo.getAllTypes();
    }

}
