/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.lpthinh.repositories.impl;

import com.lpthinh.pojo.TicketType;
import com.lpthinh.repositories.TicketRepository;
import java.util.List;
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
public class TicketRepositoryImpl implements TicketRepository {

    @Autowired
    private LocalSessionFactoryBean factory;

    @Override
    public List<TicketType> getAllTypes() {
        Session session = this.factory.getObject().getCurrentSession();
        return session.createNamedQuery("TicketType.findAll").getResultList();
    }
}
