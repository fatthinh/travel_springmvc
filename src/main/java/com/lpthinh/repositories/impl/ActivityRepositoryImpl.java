/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.lpthinh.repositories.impl;

import com.lpthinh.pojo.Activity;
import com.lpthinh.pojo.TourActivity;
import com.lpthinh.pojo.TourDetail;
import com.lpthinh.repositories.ActivityRepository;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
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
public class ActivityRepositoryImpl implements ActivityRepository {

    @Autowired
    private LocalSessionFactoryBean factory;

    private Environment environment;

    @Override
    public List<Activity> getActivities(Map<String, String> params) {
        Session session = this.factory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Activity> criteriaQuery = builder.createQuery(Activity.class);
        Root root = criteriaQuery.from(Activity.class);
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
    public Activity getActivityById(int id) {
        Session session = this.factory.getObject().getCurrentSession();

        return session.get(Activity.class, id);
    }

    @Override
    public void create(Activity activity) {
        Session session = this.factory.getObject().getCurrentSession();
        session.save(activity);
    }

    @Override
    public void createTourActivity(Activity activity, TourDetail tourDetail, int day) {
        Session session = this.factory.getObject().getCurrentSession();
        TourActivity tourActivity = new TourActivity();
        tourActivity.setActivityId(activity);
        tourActivity.setTourId(tourDetail);
        tourActivity.setDay(day);
        session.save(tourActivity);
    }

    @Override
    public void removeTourActivity(Activity act, TourDetail tour) {
        Session session = this.factory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<TourActivity> criteriaQuery = builder.createQuery(TourActivity.class);
        Root root = criteriaQuery.from(TourActivity.class);
        criteriaQuery.select(root);
        List<Predicate> predicates = new ArrayList<>();

        if (act != null && tour != null) {
            predicates.add(builder.and(builder.equal(root.get("activityId"), act), builder.equal(root.get("tourId"), tour)));
        }

        criteriaQuery.where(predicates.toArray(Predicate[]::new));
        Query query = session.createQuery(criteriaQuery);

        TourActivity removeItem = (TourActivity) query.getSingleResult();

        session.remove(removeItem);
    }
}
