/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import User.connect;
import static User.connect.connectdb;
import User.user;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

/**
 *
 * @author faycel
 */
public class ConnectionUser extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        //Recuperation login et motdepasee
        String url;
        String login = request.getParameter("login");
        String motdepasse = request.getParameter("motdepasse");
        
        //Interface Adminstrateur
        if((login.equals("admin")) && (motdepasse.equals("admin"))){
            
            url = "/administateur.jsp"; 
            RequestDispatcher dispatcher =
                    getServletContext().getRequestDispatcher(url);
            dispatcher.forward(request, response);
        }else{
        
        
        
        
        user personne = new user();
        //Requete de selection et recherche 
        String sql =  "select * from user where login = '"+login+"' and  motdepasse = '"+motdepasse+"' " ;
        Connection cont = connectdb();
        Statement smt = cont.createStatement() ;
        ResultSet rs = smt.executeQuery(sql) ;
        
       
            while (rs.next()) {
            personne.setId(rs.getInt("id"));
            personne.setNom(rs.getString("nom"));
            personne.setPrenom(rs.getString("prenom"));
            personne.setAge(rs.getString("age"));
            personne.setAdresse(rs.getString("adresse"));
            personne.setVille(rs.getString("ville"));
            personne.setLogin(rs.getString("login"));
            personne.setMotdepasse(rs.getString("motdepasse"));
            personne.setPhoto(rs.getString("photo"));
            }
           /*
            out.println("<br> 2 -----------------<br>");
            out.println(personne.getNom());
            out.println(personne.getPrenom());
            */
           
            if(personne.getNom() != null){
            HttpSession session = request.getSession();
            session.setAttribute("personne", personne);      
             url = "/liste_categorie.jsp";
            }else{
             url = "/index.jsp?mg=erreur";
            }
       
            RequestDispatcher dispatcher =
                    getServletContext().getRequestDispatcher(url);
            dispatcher.forward(request, response);
        
        
        
        
        
        
    }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ConnectionUser.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ConnectionUser.class.getName()).log(Level.SEVERE, null, ex);
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
