/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.lpthinh.pojo;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
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
    @NamedQuery(name = "TourActivity.findByTourId", query = "SELECT t FROM TourActivity t WHERE t.tourActivityPK.tourId = :tourId"),
    @NamedQuery(name = "TourActivity.findByActivityId", query = "SELECT t FROM TourActivity t WHERE t.tourActivityPK.activityId = :activityId"),
    @NamedQuery(name = "TourActivity.findBySpecificDay", query = "SELECT t FROM TourActivity t WHERE t.specificDay = :specificDay")})
public class TourActivity implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected TourActivityPK tourActivityPK;
    @Column(name = "specific_day")
    private Integer specificDay;
    @JoinColumn(name = "activity_id", referencedColumnName = "id", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Activity activity;
    @JoinColumn(name = "tour_id", referencedColumnName = "id", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private TourDetail tourDetail;

    public TourActivity() {
    }

    public TourActivity(TourActivityPK tourActivityPK) {
        this.tourActivityPK = tourActivityPK;
    }

    public TourActivity(int tourId, int activityId) {
        this.tourActivityPK = new TourActivityPK(tourId, activityId);
    }

    public TourActivityPK getTourActivityPK() {
        return tourActivityPK;
    }

    public void setTourActivityPK(TourActivityPK tourActivityPK) {
        this.tourActivityPK = tourActivityPK;
    }

    public Integer getSpecificDay() {
        return specificDay;
    }

    public void setSpecificDay(Integer specificDay) {
        this.specificDay = specificDay;
    }

    public Activity getActivity() {
        return activity;
    }

    public void setActivity(Activity activity) {
        this.activity = activity;
    }

    public TourDetail getTourDetail() {
        return tourDetail;
    }

    public void setTourDetail(TourDetail tourDetail) {
        this.tourDetail = tourDetail;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (tourActivityPK != null ? tourActivityPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof TourActivity)) {
            return false;
        }
        TourActivity other = (TourActivity) object;
        if ((this.tourActivityPK == null && other.tourActivityPK != null) || (this.tourActivityPK != null && !this.tourActivityPK.equals(other.tourActivityPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.lpthinh.pojo.TourActivity[ tourActivityPK=" + tourActivityPK + " ]";
    }
    
}
