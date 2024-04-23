/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.lpthinh.pojo;

import java.io.Serializable;
import java.util.Set;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author admin
 */
@Entity
@Table(name = "activity")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Activity.findAll", query = "SELECT a FROM Activity a"),
    @NamedQuery(name = "Activity.findByPrice", query = "SELECT a FROM Activity a WHERE a.price = :price"),
    @NamedQuery(name = "Activity.findByDescription", query = "SELECT a FROM Activity a WHERE a.description = :description"),
    @NamedQuery(name = "Activity.findByDuration", query = "SELECT a FROM Activity a WHERE a.duration = :duration"),
    @NamedQuery(name = "Activity.findByTransport", query = "SELECT a FROM Activity a WHERE a.transport = :transport"),
    @NamedQuery(name = "Activity.findByDepartureFrom", query = "SELECT a FROM Activity a WHERE a.departureFrom = :departureFrom"),
    @NamedQuery(name = "Activity.findByDepartureTo", query = "SELECT a FROM Activity a WHERE a.departureTo = :departureTo"),
    @NamedQuery(name = "Activity.findById", query = "SELECT a FROM Activity a WHERE a.id = :id"),
    @NamedQuery(name = "Activity.findByName", query = "SELECT a FROM Activity a WHERE a.name = :name")})
public class Activity implements Serializable {

    private static final long serialVersionUID = 1L;
    @Basic(optional = false)
    @NotNull
    @Column(name = "price")
    private double price;
    @Size(max = 255)
    @Column(name = "description")
    private String description;
    @Column(name = "duration")
    private Integer duration;
    @Size(max = 9)
    @Column(name = "transport")
    private String transport;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 30)
    @Column(name = "departure_from")
    private String departureFrom;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 30)
    @Column(name = "departure_to")
    private String departureTo;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "name")
    private String name;
    @JoinTable(name = "activity_image", joinColumns = {
        @JoinColumn(name = "activity_id", referencedColumnName = "id")}, inverseJoinColumns = {
        @JoinColumn(name = "image_id", referencedColumnName = "id")})
    @ManyToMany
    private Set<Image> imageSet;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "activity")
    private Set<TourActivity> tourActivitySet;

    public Activity() {
    }

    public Activity(Integer id) {
        this.id = id;
    }

    public Activity(Integer id, double price, String departureFrom, String departureTo, String name) {
        this.id = id;
        this.price = price;
        this.departureFrom = departureFrom;
        this.departureTo = departureTo;
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getDuration() {
        return duration;
    }

    public void setDuration(Integer duration) {
        this.duration = duration;
    }

    public String getTransport() {
        return transport;
    }

    public void setTransport(String transport) {
        this.transport = transport;
    }

    public String getDepartureFrom() {
        return departureFrom;
    }

    public void setDepartureFrom(String departureFrom) {
        this.departureFrom = departureFrom;
    }

    public String getDepartureTo() {
        return departureTo;
    }

    public void setDepartureTo(String departureTo) {
        this.departureTo = departureTo;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @XmlTransient
    public Set<Image> getImageSet() {
        return imageSet;
    }

    public void setImageSet(Set<Image> imageSet) {
        this.imageSet = imageSet;
    }

    @XmlTransient
    public Set<TourActivity> getTourActivitySet() {
        return tourActivitySet;
    }

    public void setTourActivitySet(Set<TourActivity> tourActivitySet) {
        this.tourActivitySet = tourActivitySet;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Activity)) {
            return false;
        }
        Activity other = (Activity) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.lpthinh.pojo.Activity[ id=" + id + " ]";
    }
    
}
