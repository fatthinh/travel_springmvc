package com.lpthinh.repositories;

import com.lpthinh.pojo.Invoice;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author admin
 */
public interface InvoiceRepository {

    Invoice getById(int id);
}
