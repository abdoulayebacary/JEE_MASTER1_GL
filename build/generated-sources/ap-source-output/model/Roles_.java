package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.Utilisateur;

@Generated(value="EclipseLink-2.6.1.v20150605-rNA", date="2019-04-30T20:47:20")
@StaticMetamodel(Roles.class)
public class Roles_ { 

    public static volatile SingularAttribute<Roles, String> libelle;
    public static volatile SingularAttribute<Roles, Integer> id;
    public static volatile ListAttribute<Roles, Utilisateur> utilisateurList;

}