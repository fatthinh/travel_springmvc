/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.lpthinh.repositories.impl;

import com.lpthinh.pojo.Image;
import com.lpthinh.repositories.ImageRepository;
import java.util.List;
import javax.persistence.Query;
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
public class ImageRepositoryImpl implements ImageRepository {

    @Autowired
    private LocalSessionFactoryBean factory;

    @Override
    public List<Image> getAll() {
        Session session = this.factory.getObject().getCurrentSession();
        Query query = session.createNamedQuery("Image.findAll");

        return query.getResultList();
    }

    @Override
    public Image getById(int id) {
        Session session = this.factory.getObject().getCurrentSession();
        return session.get(Image.class, id);
    }

}
