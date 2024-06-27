/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.lpthinh.repositories.impl;

import com.lpthinh.pojo.Booking;
import com.lpthinh.pojo.BookingDTO;
import com.lpthinh.pojo.Customer;
import com.lpthinh.pojo.Invoice;
import com.lpthinh.pojo.Ticket;
import com.lpthinh.pojo.TicketDTO;
import com.lpthinh.pojo.TicketType;
import com.lpthinh.pojo.Tour;
import com.lpthinh.repositories.BookingRepository;
import com.lpthinh.repositories.TourRepository;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author admin
 */
@Repository
@PropertySource("classpath:config.properties")
public class BookingRepositoryImpl implements BookingRepository {

    @Autowired
    private LocalSessionFactoryBean factory;

    @Autowired
    private Environment environment;

    @Autowired
    private TourRepository tourRepo;

    @Override
    public List<Booking> getBookings(Map<String, String> params) {
        Session session = this.factory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Booking> criteriaQuery = builder.createQuery(Booking.class);
        Root root = criteriaQuery.from(Booking.class);
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
    @Transactional(propagation = Propagation.REQUIRED)
    public Invoice addBooking(BookingDTO bookingInfo) {
        Session session = this.factory.getObject().getCurrentSession();

        try {
            Query cusQuery = session.createQuery("SELECT c FROM Customer c WHERE c.phone = :phone");
            cusQuery.setParameter("phone", bookingInfo.getPhone());
            
            Customer customer;
            List<Customer> result = cusQuery.getResultList();
            if (!cusQuery.getResultList().isEmpty()) {
                customer = (Customer) cusQuery.getSingleResult();
            } else {
                customer = new Customer(bookingInfo.getFirstName(), bookingInfo.getLastName(), bookingInfo.getPhone(), bookingInfo.getEmail(), bookingInfo.getAddress());
                session.save(customer);
            }

            Tour tour = this.tourRepo.getTourById(bookingInfo.getTourId());

            Booking booking = new Booking(bookingInfo.getNotes(), customer, tour);
            session.save(booking);

            double amount = 0;

            List<TicketDTO> tickets = bookingInfo.getTickets();
            for (TicketDTO item : tickets) {
                Ticket ticket = new Ticket();
                ticket.setBooking(booking);

                // Parse the date string to a Date object
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); // Adjust pattern as per your date format
                try {
                    Date dob = dateFormat.parse(item.getDob());
                    ticket.setDob(dob);

                } catch (ParseException e) {
                    // Handle parse exception as needed
                    e.printStackTrace();
                    // You might want to handle the error here or throw it up
                    // throw new IllegalArgumentException("Invalid date format", e);
                }

                Query typeQuery = session.createNamedQuery("TicketType.findById");
                typeQuery.setParameter("id", item.getTicketType());
                TicketType type = (TicketType) typeQuery.getSingleResult();
                ticket.setTicketType(type);
                ticket.setName(item.getName());
                session.save(ticket);

                // Assuming tour, tourDetail, discount, and deduction are accessible and correctly initialized
                amount += tour.getTourDetail().getPrice() * (1 - ticket.getTicketType().getDeduction());
            }

            Invoice invoice = new Invoice(booking, amount * (1 - tour.getDiscount()));
            session.save(invoice);
            return invoice;

        } catch (HibernateException ex) {
            return null;
        }
    }
}
