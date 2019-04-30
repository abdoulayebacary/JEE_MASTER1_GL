package model;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.Client;
import model.Vehicule;

@Generated(value="EclipseLink-2.6.1.v20150605-rNA", date="2019-04-30T20:47:20")
@StaticMetamodel(Location.class)
public class Location_ { 

    public static volatile SingularAttribute<Location, Date> date;
    public static volatile SingularAttribute<Location, Float> montant;
    public static volatile SingularAttribute<Location, Integer> id;
    public static volatile SingularAttribute<Location, Client> idclient;
    public static volatile SingularAttribute<Location, Integer> nbjour;
    public static volatile SingularAttribute<Location, String> remarque;
    public static volatile SingularAttribute<Location, Vehicule> idvehicule;

}