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
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author admin
 */
@Entity
@Table(name = "ticket_type")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TicketType.findAll", query = "SELECT t FROM TicketType t"),
    @NamedQuery(name = "TicketType.findById", query = "SELECT t FROM TicketType t WHERE t.id = :id"),
    @NamedQuery(name = "TicketType.findByName", query = "SELECT t FROM TicketType t WHERE t.name = :name"),
    @NamedQuery(name = "TicketType.findByDescription", query = "SELECT t FROM TicketType t WHERE t.description = :description"),
    @NamedQuery(name = "TicketType.findByDeduction", query = "SELECT t FROM TicketType t WHERE t.deduction = :deduction")})
public class TicketType implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "name")
    private String name;
    @Size(max = 255)
    @Column(name = "description")
    private String description;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "deduction")
    private Float deduction;
    @OneToMany(mappedBy = "ticketType")
    private Set<Ticket> ticketSet;

    public TicketType() {
    }

    public TicketType(Integer id) {
        this.id = id;
    }

    public TicketType(Integer id, String name) {
        this.id = id;
        this.name = name;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Float getDeduction() {
        return deduction;
    }

    public void setDeduction(Float deduction) {
        this.deduction = deduction;
    }

    @XmlTransient
    public Set<Ticket> getTicketSet() {
        return ticketSet;
    }

    public void setTicketSet(Set<Ticket> ticketSet) {
        this.ticketSet = ticketSet;
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
        if (!(object instanceof TicketType)) {
            return false;
        }
        TicketType other = (TicketType) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.lpthinh.pojo.TicketType[ id=" + id + " ]";
    }
    
}
