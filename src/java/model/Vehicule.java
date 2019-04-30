/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.util.List;
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
 * @author magat
 */
@Entity
@Table(name = "vehicule")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Vehicule.findAll", query = "SELECT v FROM Vehicule v")
    , @NamedQuery(name = "Vehicule.findById", query = "SELECT v FROM Vehicule v WHERE v.id = :id")
    , @NamedQuery(name = "Vehicule.findByMatricule", query = "SELECT v FROM Vehicule v WHERE v.matricule = :matricule")
    , @NamedQuery(name = "Vehicule.findByCouleur", query = "SELECT v FROM Vehicule v WHERE v.couleur = :couleur")
    , @NamedQuery(name = "Vehicule.findByPrixjour", query = "SELECT v FROM Vehicule v WHERE v.prixjour = :prixjour")})
public class Vehicule implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "matricule")
    private String matricule;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 30)
    @Column(name = "couleur")
    private String couleur;
    @Basic(optional = false)
    @NotNull
    @Column(name = "prixjour")
    private float prixjour;
    @JoinColumn(name = "idmodele", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Modele idmodele;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idvehicule")
    private List<Location> locationList;

    public Vehicule() {
    }

    public Vehicule(Integer id) {
        this.id = id;
    }

    public Vehicule(Integer id, String matricule, String couleur, float prixjour) {
        this.id = id;
        this.matricule = matricule;
        this.couleur = couleur;
        this.prixjour = prixjour;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMatricule() {
        return matricule;
    }

    public void setMatricule(String matricule) {
        this.matricule = matricule;
    }

    public String getCouleur() {
        return couleur;
    }

    public void setCouleur(String couleur) {
        this.couleur = couleur;
    }

    public float getPrixjour() {
        return prixjour;
    }

    public void setPrixjour(float prixjour) {
        this.prixjour = prixjour;
    }

    public Modele getIdmodele() {
        return idmodele;
    }

    public void setIdmodele(Modele idmodele) {
        this.idmodele = idmodele;
    }

    @XmlTransient
    public List<Location> getLocationList() {
        return locationList;
    }

    public void setLocationList(List<Location> locationList) {
        this.locationList = locationList;
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
        if (!(object instanceof Vehicule)) {
            return false;
        }
        Vehicule other = (Vehicule) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Vehicule[ id=" + id + " ]";
    }
    
}
