/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.lpthinh.pojo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import java.io.Serializable;
import java.lang.reflect.Array;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author admin
 */
@Entity
@Table(name = "tour_detail")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TourDetail.findAll", query = "SELECT t FROM TourDetail t"),
    @NamedQuery(name = "TourDetail.findByPrice", query = "SELECT t FROM TourDetail t WHERE t.price = :price"),
    @NamedQuery(name = "TourDetail.findByCapacity", query = "SELECT t FROM TourDetail t WHERE t.capacity = :capacity"),
    @NamedQuery(name = "TourDetail.findByThumbnail", query = "SELECT t FROM TourDetail t WHERE t.thumbnail = :thumbnail"),
    @NamedQuery(name = "TourDetail.findById", query = "SELECT t FROM TourDetail t WHERE t.id = :id"),
    @NamedQuery(name = "TourDetail.findByName", query = "SELECT t FROM TourDetail t WHERE t.name = :name")})
public class TourDetail implements Serializable {

    private static final long serialVersionUID = 1L;
    @Lob
    @Size(max = 65535)
    @Column(name = "description")
    private String description;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "price")
    private Double price;
    @Column(name = "capacity")
    private Integer capacity;
    @Size(max = 255)
    @Column(name = "thumbnail")
    private String thumbnail;
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
    @JoinTable(name = "tour_category", joinColumns = {
        @JoinColumn(name = "tour_detail_id", referencedColumnName = "id")}, inverseJoinColumns = {
        @JoinColumn(name = "category_id", referencedColumnName = "id")})
    @ManyToMany
    @JsonIgnore
    @LazyCollection(LazyCollectionOption.FALSE)
    private Collection<Category> categoryCollection;
    @JoinTable(name = "tour_image", joinColumns = {
        @JoinColumn(name = "tour_detail_id", referencedColumnName = "id")}, inverseJoinColumns = {
        @JoinColumn(name = "image_id", referencedColumnName = "id")})
    @ManyToMany
    @JsonIgnore
    @LazyCollection(LazyCollectionOption.FALSE)
    private Collection<Image> imageCollection;
    @OneToMany(mappedBy = "tourId", fetch = FetchType.EAGER)
    @JsonIgnore
    private Collection<TourActivity> tourActivityCollection;
    @JoinColumn(name = "destination", referencedColumnName = "id")
    @ManyToOne(fetch = FetchType.EAGER)
    private Destination destination;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "tourDetail")
    @JsonIgnore
    private Collection<Tour> tourCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "tour")
    @JsonIgnore
    private Collection<Review> reviewCollection;

    @Transient
    private MultipartFile file;

    public TourDetail() {
    }

    public TourDetail(Integer id) {
        this.id = id;
    }

    public TourDetail(Integer id, String name) {
        this.id = id;
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Double getPrice() {
        return this.getTourActivityCollection().stream()
                .mapToDouble(item -> item.getActivityId().getPrice())
                .sum();
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Integer getCapacity() {
        return capacity;
    }

    public void setCapacity(Integer capacity) {
        this.capacity = capacity;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
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
    public Collection<Category> getCategoryCollection() {
        return categoryCollection;
    }

    public void setCategoryCollection(Collection<Category> categoryCollection) {
        this.categoryCollection = categoryCollection;
    }

    @XmlTransient
    public Collection<Image> getImageCollection() {
        return imageCollection;
    }

    public void setImageCollection(Collection<Image> imageCollection) {
        this.imageCollection = imageCollection;
    }

    @XmlTransient
    public Collection<TourActivity> getTourActivityCollection() {
        return tourActivityCollection;
    }

    public void setTourActivityCollection(Collection<TourActivity> tourActivityCollection) {
        this.tourActivityCollection = tourActivityCollection;
    }

    public Destination getDestination() {
        return destination;
    }

    public void setDestination(Destination destination) {
        this.destination = destination;
    }

    @XmlTransient
    public Collection<Tour> getTourCollection() {
        return tourCollection;
    }

    public void setTourCollection(Collection<Tour> tourCollection) {
        this.tourCollection = tourCollection;
    }

    @XmlTransient
    public Collection<Review> getReviewCollection() {
        return reviewCollection;
    }

    public void setReviewCollection(Collection<Review> reviewCollection) {
        this.reviewCollection = reviewCollection;
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

    /**
     * @return the file
     */
    public MultipartFile getFile() {
        return file;
    }

    /**
     * @param file the file to set
     */
    public void setFile(MultipartFile file) {
        this.file = file;
    }

}
