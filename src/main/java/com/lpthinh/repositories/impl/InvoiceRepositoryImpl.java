/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.lpthinh.repositories.impl;

import com.lpthinh.pojo.Invoice;
import com.lpthinh.repositories.InvoiceRepository;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author admin
 */
@Repository
@Transactional
public class InvoiceRepositoryImpl implements InvoiceRepository{
    
    @Autowired
    private LocalSessionFactoryBean factory;

    @Override
    public Invoice getById(int id) {
        Session session = this.factory.getObject().getCurrentSession();
        
        return session.get(Invoice.class, id);
    }
    
}
