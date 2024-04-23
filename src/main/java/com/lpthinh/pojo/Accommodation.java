/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.lpthinh.pojo;

import java.io.Serializable;
import java.util.Set;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author admin
 */
@Entity
@Table(name = "accommodation")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Accommodation.findAll", query = "SELECT a FROM Accommodation a"),
    @NamedQuery(name = "Accommodation.findById", query = "SELECT a FROM Accommodation a WHERE a.id = :id"),
    @NamedQuery(name = "Accommodation.findByType", query = "SELECT a FROM Accommodation a WHERE a.type = :type"),
    @NamedQuery(name = "Accommodation.findByRating", query = "SELECT a FROM Accommodation a WHERE a.rating = :rating"),
    @NamedQuery(name = "Accommodation.findByPrice", query = "SELECT a FROM Accommodation a WHERE a.price = :price")})
public class Accommodation implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Size(max = 8)
    @Column(name = "type")
    private String type;
    @Size(max = 9)
    @Column(name = "rating")
    private String rating;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "price")
    private Double price;
    @OneToMany(mappedBy = "accommodation")
    private Set<TourDetail> tourDetailSet;

    public Accommodation() {
    }

    public Accommodation(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getRating() {
        return rating;
    }

    public void setRating(String rating) {
        this.rating = rating;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    @XmlTransient
    public Set<TourDetail> getTourDetailSet() {
        return tourDetailSet;
    }

    public void setTourDetailSet(Set<TourDetail> tourDetailSet) {
        this.tourDetailSet = tourDetailSet;
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
        if (!(object instanceof Accommodation)) {
            return false;
        }
        Accommodation other = (Accommodation) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.lpthinh.pojo.Accommodation[ id=" + id + " ]";
    }
    
}
