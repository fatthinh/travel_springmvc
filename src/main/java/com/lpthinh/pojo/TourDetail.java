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
import javax.persistence.ManyToOne;
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
@Table(name = "tour_detail")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TourDetail.findAll", query = "SELECT t FROM TourDetail t"),
    @NamedQuery(name = "TourDetail.findByTotalPrice", query = "SELECT t FROM TourDetail t WHERE t.totalPrice = :totalPrice"),
    @NamedQuery(name = "TourDetail.findByDescription", query = "SELECT t FROM TourDetail t WHERE t.description = :description"),
    @NamedQuery(name = "TourDetail.findById", query = "SELECT t FROM TourDetail t WHERE t.id = :id"),
    @NamedQuery(name = "TourDetail.findByName", query = "SELECT t FROM TourDetail t WHERE t.name = :name")})
public class TourDetail implements Serializable {

    private static final long serialVersionUID = 1L;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "total_price")
    private Double totalPrice;
    @Size(max = 255)
    @Column(name = "description")
    private String description;
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
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "tourDetail")
    private Set<TourActivity> tourActivitySet;
    @JoinColumn(name = "accommodation", referencedColumnName = "id")
    @ManyToOne
    private Accommodation accommodation;
    @JoinColumn(name = "image", referencedColumnName = "id")
    @ManyToOne
    private Image image;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "tourDetail")
    private Set<Tour> tourSet;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "tour")
    private Set<Review> reviewSet;

    public TourDetail() {
    }

    public TourDetail(Integer id) {
        this.id = id;
    }

    public TourDetail(Integer id, String name) {
        this.id = id;
        this.name = name;
    }

    public Double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
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
    public Set<TourActivity> getTourActivitySet() {
        return tourActivitySet;
    }

    public void setTourActivitySet(Set<TourActivity> tourActivitySet) {
        this.tourActivitySet = tourActivitySet;
    }

    public Accommodation getAccommodation() {
        return accommodation;
    }

    public void setAccommodation(Accommodation accommodation) {
        this.accommodation = accommodation;
    }

    public Image getImage() {
        return image;
    }

    public void setImage(Image image) {
        this.image = image;
    }

    @XmlTransient
    public Set<Tour> getTourSet() {
        return tourSet;
    }

    public void setTourSet(Set<Tour> tourSet) {
        this.tourSet = tourSet;
    }

    @XmlTransient
    public Set<Review> getReviewSet() {
        return reviewSet;
    }

    public void setReviewSet(Set<Review> reviewSet) {
        this.reviewSet = reviewSet;
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
        if (!(object instanceof TourDetail)) {
            return false;
        }
        TourDetail other = (TourDetail) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.lpthinh.pojo.TourDetail[ id=" + id + " ]";
    }
    
}
