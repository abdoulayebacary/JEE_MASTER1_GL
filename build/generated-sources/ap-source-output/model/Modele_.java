package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.Marque;
import model.Vehicule;

@Generated(value="EclipseLink-2.6.1.v20150605-rNA", date="2019-04-30T20:47:20")
@StaticMetamodel(Modele.class)
public class Modele_ { 

    public static volatile SingularAttribute<Modele, String> libelle;
    public static volatile ListAttribute<Modele, Vehicule> vehiculeList;
    public static volatile SingularAttribute<Modele, Marque> idmarque;
    public static volatile SingularAttribute<Modele, Integer> id;

}