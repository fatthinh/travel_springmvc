/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.lpthinh.repositories.impl;

import com.lpthinh.pojo.Image;
import com.lpthinh.pojo.TourActivity;
import com.lpthinh.pojo.TourDetail;
import com.lpthinh.repositories.TourDetailRepository;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.JoinType;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author admin
 */
@Repository
@Transactional
@PropertySource("classpath:config.properties")
public class TourDetailRepositoryImpl implements TourDetailRepository {

    @Autowired
    private LocalSessionFactoryBean factory;

    @Autowired
    private Environment environment;

    @Override
    public List<TourDetail> getTours(Map<String, String> params) {
        Session session = this.factory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<TourDetail> criteriaQuery = builder.createQuery(TourDetail.class);
        Root root = criteriaQuery.from(TourDetail.class);
        criteriaQuery.select(root);

        List<Predicate> predicates = new ArrayList<>();

        String kw = params.get("kw");
        if (kw != null && !kw.trim().isEmpty()) {
            predicates.add(builder.like(root.get("name"), String.format("%%s%%", kw)));
        }

        criteriaQuery.where(predicates.toArray(Predicate[]::new));
        Query query = session.createQuery(criteriaQuery);

        String page = params.get("page");
        if (page != null && !page.isEmpty()) {
            int pageSize = Integer.parseInt(environment.getProperty("pageSize").toString());
            int start = (Integer.parseInt(page) - 1) * pageSize;
            query.setFirstResult(start);
            query.setMaxResults(pageSize);
        }

        return query.getResultList();
    }

    @Override
    public TourDetail getTourById(int id) {
        Session session = this.factory.getObject().getCurrentSession();
        return session.get(TourDetail.class, id);
    }

    @Override
    public List<TourActivity> getActivitiesByDetail(TourDetail detail) {

        Session session = this.factory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<TourActivity> criteriaQuery = builder.createQuery(TourActivity.class);
        Root<TourActivity> root = criteriaQuery.from(TourActivity.class);
        criteriaQuery.select(root).where(builder.equal(root.get("tourId"), detail.getId()));

        return session.createQuery(criteriaQuery).getResultList();
    }

    @Override
    public Collection<Image> getGallery(TourDetail detail) {
        Session session = this.factory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Image> criteriaQuery = builder.createQuery(Image.class);
        Root<Image> rootImage = criteriaQuery.from(Image.class);
        Join<Image, TourDetail> joinTourDetail = rootImage.join("tourDetailCollection", JoinType.INNER);
        criteriaQuery.select(rootImage).where(builder.equal(joinTourDetail.get("id"), detail.getId()));

        return session.createQuery(criteriaQuery).getResultList();
    }

    @Override
    public void create(TourDetail tourDetail) {
        Session session = this.factory.getObject().getCurrentSession();

        session.save(tourDetail);
    }

}
