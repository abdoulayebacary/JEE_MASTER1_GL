/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import model.Utilisateur;

/**
 *
 * @author magat
 */
@Stateless
public class UtilisateurFacade extends AbstractFacade<Utilisateur> implements UtilisateurFacadeLocal {

    @PersistenceContext(unitName = "IntroJEEPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public UtilisateurFacade() {
        super(Utilisateur.class);
    }

    @Override
    public Utilisateur getUser(String login, String password) {
        try {
            return em.createQuery("SELECT u FROM Utilisateur u WHERE u.login=:log AND u.password=:pwd", Utilisateur.class)
                    .setParameter("log", login)
                    .setParameter("pwd", password)
                    .getSingleResult();
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public int getLastId() {
        try {
            return em.createQuery("SELECT MAX(u.id) FROM Utilisateur u", Integer.class).
                    getSingleResult();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    
    
}
