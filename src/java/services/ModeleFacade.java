/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import model.Modele;

/**
 *
 * @author magat
 */
@Stateless
public class ModeleFacade extends AbstractFacade<Modele> implements ModeleFacadeLocal {

    @PersistenceContext(unitName = "IntroJEEPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ModeleFacade() {
        super(Modele.class);
    }

    @Override
    public List<Modele> listerParMarque(int id) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        return em.createQuery("SELECT mo FROM Modele mo JOIN mo.idmarque ma WHERE ma.id =:id ")
                .setParameter("id", id).getResultList();
    }
    
}
