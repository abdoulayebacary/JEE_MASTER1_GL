package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.Location;
import model.Modele;

@Generated(value="EclipseLink-2.6.1.v20150605-rNA", date="2019-04-30T20:47:20")
@StaticMetamodel(Vehicule.class)
public class Vehicule_ { 

    public static volatile SingularAttribute<Vehicule, Float> prixjour;
    public static volatile ListAttribute<Vehicule, Location> locationList;
    public static volatile SingularAttribute<Vehicule, Modele> idmodele;
    public static volatile SingularAttribute<Vehicule, String> matricule;
    public static volatile SingularAttribute<Vehicule, String> couleur;
    public static volatile SingularAttribute<Vehicule, Integer> id;

}