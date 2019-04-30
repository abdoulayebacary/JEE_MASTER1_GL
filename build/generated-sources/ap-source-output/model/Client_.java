package model;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.Location;

@Generated(value="EclipseLink-2.6.1.v20150605-rNA", date="2019-04-30T20:47:20")
@StaticMetamodel(Client.class)
public class Client_ { 

    public static volatile ListAttribute<Client, Location> locationList;
    public static volatile SingularAttribute<Client, String> tel;
    public static volatile SingularAttribute<Client, Integer> id;
    public static volatile SingularAttribute<Client, String> nom;
    public static volatile SingularAttribute<Client, String> prenom;
    public static volatile SingularAttribute<Client, Date> datenaiss;
    public static volatile SingularAttribute<Client, String> numpiece;
    public static volatile SingularAttribute<Client, String> email;

}