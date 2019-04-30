/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author magat
 */
@Entity
@Table(name = "location")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Location.findAll", query = "SELECT l FROM Location l")
    , @NamedQuery(name = "Location.findById", query = "SELECT l FROM Location l WHERE l.id = :id")
    , @NamedQuery(name = "Location.findByDate", query = "SELECT l FROM Location l WHERE l.date = :date")
    , @NamedQuery(name = "Location.findByNbjour", query = "SELECT l FROM Location l WHERE l.nbjour = :nbjour")
    , @NamedQuery(name = "Location.findByMontant", query = "SELECT l FROM Location l WHERE l.montant = :montant")
    , @NamedQuery(name = "Location.findByRemarque", query = "SELECT l FROM Location l WHERE l.remarque = :remarque")})
public class Location implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Column(name = "date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date date;
    @Basic(optional = false)
    @NotNull
    @Column(name = "nbjour")
    private int nbjour;
    @Basic(optional = false)
    @NotNull
    @Column(name = "montant")
    private float montant;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 1000)
    @Column(name = "remarque")
    private String remarque;
    @JoinColumn(name = "idclient", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Client idclient;
    @JoinColumn(name = "idvehicule", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Vehicule idvehicule;

    public Location() {
    }

    public Location(Integer id) {
        this.id = id;
    }

    public Location(Integer id, Date date, int nbjour, float montant, String remarque) {
        this.id = id;
        this.date = date;
        this.nbjour = nbjour;
        this.montant = montant;
        this.remarque = remarque;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getNbjour() {
        return nbjour;
    }

    public void setNbjour(int nbjour) {
        this.nbjour = nbjour;
    }

    public float getMontant() {
        return montant;
    }

    public void setMontant(float montant) {
        this.montant = montant;
    }

    public String getRemarque() {
        return remarque;
    }

    public void setRemarque(String remarque) {
        this.remarque = remarque;
    }

    public Client getIdclient() {
        return idclient;
    }

    public void setIdclient(Client idclient) {
        this.idclient = idclient;
    }

    public Vehicule getIdvehicule() {
        return idvehicule;
    }

    public void setIdvehicule(Vehicule idvehicule) {
        this.idvehicule = idvehicule;
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
        if (!(object instanceof Location)) {
            return false;
        }
        Location other = (Location) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Location[ id=" + id + " ]";
    }
    
}
