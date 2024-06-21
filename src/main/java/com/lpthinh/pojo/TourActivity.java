/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.lpthinh.pojo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author admin
 */
@Entity
@Table(name = "tour_activity")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TourActivity.findAll", query = "SELECT t FROM TourActivity t"),
    @NamedQuery(name = "TourActivity.findById", query = "SELECT t FROM TourActivity t WHERE t.id = :id"),
    @NamedQuery(name = "TourActivity.findByDay", query = "SELECT t FROM TourActivity t WHERE t.day = :day"),
    @NamedQuery(name = "TourActivity.findByRole", query = "SELECT t FROM TourActivity t WHERE t.role = :role")})
public class TourActivity implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Column(name = "day")
    private int day;
    @Size(max = 255)
    @Column(name = "role")
    private String role;
    @JoinColumn(name = "activity_id", referencedColumnName = "id")
    @ManyToOne
    private Activity activityId;
    @JoinColumn(name = "tour_id", referencedColumnName = "id")
    @ManyToOne
    @JsonIgnore
    private TourDetail tourId;

    public TourActivity() {
    }

    public TourActivity(Integer id) {
        this.id = id;
    }

    public TourActivity(Integer id, int day) {
        this.id = id;
        this.day = day;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public int getDay() {
        return day;
    }

    public void setDay(int day) {
        this.day = day;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public Activity getActivityId() {
        return activityId;
    }

    public void setActivityId(Activity activityId) {
        this.activityId = activityId;
    }

    public TourDetail getTourId() {
        return tourId;
    }

    public void setTourId(TourDetail tourId) {
        this.tourId = tourId;
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
        if (!(object instanceof TourActivity)) {
            return false;
        }
        TourActivity other = (TourActivity) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.lpthinh.pojo.TourActivity[ id=" + id + " ]";
    }

}
