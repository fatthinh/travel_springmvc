/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.lpthinh.repositories.impl;

import com.lpthinh.pojo.User;
import com.lpthinh.pojo.UserDTO;
import com.lpthinh.repositories.UserRepository;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.apache.commons.collections.map.HashedMap;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author admin
 */
@Repository
@Transactional
@PropertySource("classpath:config.properties")
public class UserRepositoryImpl implements UserRepository {

    @Autowired
    private LocalSessionFactoryBean factory;

    @Autowired
    private Environment environment;

    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    @Override
    public List<User> getUsers(Map<String, String> params) {
        Session session = this.factory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<User> criteriaQuery = builder.createQuery(User.class);
        Root root = criteriaQuery.from(User.class);
        criteriaQuery.select(root);

        List<Predicate> predicates = new ArrayList<>();

        String kw = params.get("kw");
        if (kw != null && !kw.trim().isEmpty()) {
            predicates.add((builder.like(builder.concat(root.get("firstName"), root.get("lastName")), String.format("%%%s%%", kw))));
        }

        String email = params.get("email");
        if (email != null && !email.trim().isEmpty()) {
            predicates.add(builder.equal(root.get("email"), email));
        }

        String role = params.get("role");
        if (role != null && !role.isEmpty() && !role.equals("all")) {
            predicates.add(builder.equal(root.get("role"), role.toUpperCase()));
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
    public User getUserById(int id) {
        Session session = this.factory.getObject().getCurrentSession();

        return session.get(User.class, id);
    }

    @Override
    public int getTotalPage() {
        Map<String, String> params = new HashMap<>();
        List<User> users = this.getUsers(params);
        return (int) Math.ceil(users.size() / Double.parseDouble(environment.getProperty("pageSize".toString())));
    }

    @Override
    public int create(UserDTO user) {
        Session session = this.factory.getObject().getCurrentSession();
        User newUser = new User(user.getPassword(), user.getRole(), user.getLastName(), user.getPhone(), user.getEmail(), user.getFirstName());
        session.save(newUser);

        return newUser.getId();
    }

    @Override
    public boolean auth(UserDTO user) {
        User u = this.getUserByEmail(user.getEmail());

        return this.passwordEncoder.matches(user.getPassword(), u.getPassword());
    }

    @Override
    public User getUserByEmail(String email) {
        Session session = this.factory.getObject().getCurrentSession();
        Query query = session.createNamedQuery("User.findByEmail");
        query.setParameter("email", email);
        return (User) query.getSingleResult();
    }

    @Override
    public void updateAvatar(User user) {
        Session session = this.factory.getObject().getCurrentSession();
        session.update(user);
    }
}
