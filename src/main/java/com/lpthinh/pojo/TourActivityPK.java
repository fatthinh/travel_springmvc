/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.lpthinh.pojo;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.validation.constraints.NotNull;

/**
 *
 * @author admin
 */
@Embeddable
public class TourActivityPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "tour_id")
    private int tourId;
    @Basic(optional = false)
    @NotNull
    @Column(name = "activity_id")
    private int activityId;

    public TourActivityPK() {
    }

    public TourActivityPK(int tourId, int activityId) {
        this.tourId = tourId;
        this.activityId = activityId;
    }

    public int getTourId() {
        return tourId;
    }

    public void setTourId(int tourId) {
        this.tourId = tourId;
    }

    public int getActivityId() {
        return activityId;
    }

    public void setActivityId(int activityId) {
        this.activityId = activityId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) tourId;
        hash += (int) activityId;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof TourActivityPK)) {
            return false;
        }
        TourActivityPK other = (TourActivityPK) object;
        if (this.tourId != other.tourId) {
            return false;
        }
        if (this.activityId != other.activityId) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.lpthinh.pojo.TourActivityPK[ tourId=" + tourId + ", activityId=" + activityId + " ]";
    }
    
}
