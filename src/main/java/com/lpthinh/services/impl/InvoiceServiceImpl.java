/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.lpthinh.services.impl;

import com.lpthinh.pojo.Invoice;
import com.lpthinh.repositories.InvoiceRepository;
import com.lpthinh.services.InvoiceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author admin
 */
@Service
public class InvoiceServiceImpl implements InvoiceService{
    
    @Autowired
    private InvoiceRepository invoiceRepo;

    @Override
    public Invoice getById(int id) {
        return this.invoiceRepo.getById(id);
    }
    
}
