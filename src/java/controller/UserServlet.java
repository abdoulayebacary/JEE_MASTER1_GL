/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import model.Marque;
import model.Modele;
import model.Roles;
import model.Utilisateur;
import services.MarqueFacadeLocal;
import services.ModeleFacadeLocal;
import services.RolesFacadeLocal;
import services.UtilisateurFacadeLocal;
import utilitaire.Upload;

/**
 *
 * @author magat
 */
@WebServlet(name = "UserServlet", urlPatterns = {"/user"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, //2Mo pour un fichier 
        maxFileSize = 1024 * 1024 * 10, //10Mo l'ensemble des fichiers plusieurs en mm tps
        maxRequestSize = 1024 * 1024 * 50) //tous les fichiers téléchargés
public class UserServlet extends HttpServlet {

    @EJB
    private UtilisateurFacadeLocal userEJB;
    @EJB
    private RolesFacadeLocal roleEJB;
    @EJB
    private MarqueFacadeLocal marqueEJB;
    
    @EJB
    private ModeleFacadeLocal modeleEJB;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UserServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        //String action = (request.getParameter("action") != null ? request.getParameter("action") : "");
        String action = "";
        HttpSession session = request.getSession(true);
        if (request.getParameter("action") != null) {
            action = request.getParameter("action");
        } else if (request.getServletPath() != null) {
            action = request.getServletPath();
        }
        switch (action) {
            case "inscription":
                List<Roles> roles = roleEJB.findAll();
                request.setAttribute("roles", roles);
                getServletContext().getRequestDispatcher("/WEB-INF/inscription.jsp").
                        forward(request, response);
                break;
            case "delete":
                //System.out.println("trying to delete");
                int id = Integer.parseInt(request.getParameter("id"));
                Utilisateur userd = userEJB.find(id);
                userEJB.remove(userd);
                response.sendRedirect("user");
                break;
            case "lock":
                int idl = Integer.parseInt(request.getParameter("id"));
                //Utilisateur userl = userEJB.find(idl);
                
                break;
            case "logout":
                session = request.getSession(true);
                session.setAttribute("user", null);
                //getServletContext().getRequestDispatcher("/WEB-INF/index.jsp").
                  //      forward(request, response);
                response.sendRedirect("user");
                break;
                
            case "location":
                List<Marque> listem = marqueEJB.findAll();
                request.setAttribute("marques", listem);
                getServletContext().getRequestDispatcher("/WEB-INF/location.jsp").
                        forward(request, response);
                break;
                
            case "getmodele":
                int idm = Integer.parseInt(request.getParameter("idmarque"));
                String reponse = "";
                List<Modele> listemodels = modeleEJB.listerParMarque(idm);
                for (Modele marque : listemodels) {
                    reponse+="<option value='"+marque.getId()+"' >"+marque.getLibelle()+"</option>";
                }
                response.getWriter().println(reponse);
                
                break;
                
            default:
                //System.out.println("test");
                session = request.getSession(true);
                
                if(session.getAttribute("user")!=null){
                    Utilisateur u = (Utilisateur)session.getAttribute("user");
                    if(u.getRole().getLibelle().equals("admin"))
                        getServletContext().getRequestDispatcher("/WEB-INF/accueilAdmin.jsp").
                            forward(request, response);
                    else
                        getServletContext().getRequestDispatcher("/WEB-INF/accueil.jsp").
                            forward(request, response);
                }
                    
                else
                    getServletContext().getRequestDispatcher("/WEB-INF/index.jsp").
                        forward(request, response);
        }

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final String chemin = "F://javaDev/IntroJEE/web/images/";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = (request.getParameter("action") != null ? request.getParameter("action") : "");
        switch (action) {
            case "logon":
                String login = request.getParameter("login");
                String pass = request.getParameter("password");
                Utilisateur u = userEJB.getUser(login, pass);

                List<Roles> roles = roleEJB.findAll();

                if (u != null) {
                    HttpSession session = request.getSession(true);
                    session.setAttribute("user", u);
                    //System.out.println(u.getRole().getLibelle());
                    if (u.getRole().getLibelle().equals("admin")) {
                        List<Utilisateur> liste = userEJB.findAll();
                        session.setAttribute("roles", roles);
                        session.setAttribute("users", liste);
                        getServletContext().getRequestDispatcher("/WEB-INF/accueilAdmin.jsp").
                                forward(request, response);
                    } else {
                        List<Utilisateur> liste = new ArrayList<Utilisateur>();
                        liste.add(u);
                        session.setAttribute("roles", roles);
                        session.setAttribute("users", liste);
                        getServletContext().getRequestDispatcher("/WEB-INF/accueil.jsp").
                                forward(request, response);
                    }
                } else {
                    request.setAttribute("message", "Login et ou Password est incorrect");
                    getServletContext().getRequestDispatcher("/WEB-INF/index.jsp").
                            forward(request, response);
                }
                break;
            case "inscription":

                //user.setLogin(request.);
                String fileName = "";
                try {
                    Part p = null;
                    String filePath = "default.png";
                    if (request.getPart("photo") != null) {
                        p = request.getPart("photo");
                        filePath = chemin + p.getSubmittedFileName();
                        InputStream stream = p.getInputStream();
                        Upload.saveFile(stream, filePath);
                    }

                    Utilisateur user = new Utilisateur();
                    user.setChanged(false);
                    user.setNom(request.getParameter("nom"));
                    user.setPrenom(request.getParameter("prenom"));
                    Roles role = roleEJB.find(Integer.parseInt(request.getParameter("role")));
                    user.setRole(role);
                    user.setPassword("passer");
                    user.setPhoto(p.getSubmittedFileName());
                    int num = userEJB.getLastId() + 1;
                    user.setLogin(user.getPrenom().substring(0, 1) + user.getNom() + num);

                    userEJB.create(user);
                    request.setAttribute("message", "Utilisateur enrégistré");

                } catch (Exception e) {

                    request.setAttribute("message", e.getMessage());
                    e.printStackTrace();
                }

                getServletContext().getRequestDispatcher("/WEB-INF/inscription.jsp").
                        forward(request, response);
                break;
            case "update":
                //System.out.println("Updating");
                //System.out.println("mise a jour");
                Utilisateur userrr = userEJB.find(Integer.parseInt(request.getParameter("id")));
                //userrr.setId(Integer.parseInt(request.getParameter("nom")));
                //System.out.println(userrr.getLogin());
                userrr.setNom(request.getParameter("nom"));
                userrr.setPrenom(request.getParameter("prenom"));
                userrr.setLogin(request.getParameter("login"));
                userrr.setRole(roleEJB.find(Integer.parseInt(request.getParameter("role"))));
                //userEJB.remove(userEJB.find(userrr.getId()));
                userEJB.edit(userrr);
                response.sendRedirect("user");
                break;
            default:
                getServletContext().getRequestDispatcher("/WEB-INF/index.jsp").
                        forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
