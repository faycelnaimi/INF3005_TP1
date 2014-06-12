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
/**
 *
 * @author faycel
 */
public class SauvegarderMotsCles extends HttpServlet {

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
        
        String cas = request.getParameter("cas");
        
        //Ajouter  un motCles pour le User
        if(cas.equals("motsCle")){
            //Recuperation liste mots clés
            String[] motsCles = request.getParameterValues("check");

            String idUser = request.getParameter("idUser");
            out.print("---- ID :"+idUser+"<br>");

            //Ajouter  un motCles pour le User
             //connect.AjouterMotsCles(motsCles, idUser);
            
            boolean verif = false;
            Connection cont = connectdb();
            Statement stmt = cont.createStatement();
            for (int i = 0; i < motsCles.length ; i++) {
           //Vérification de la repétation de meme mot clé       
           //Requete de selection du user_mots_cles 
           String reqUserMotsCles =  "select * from user_mots_cles where parent_user = '"+idUser+"' " ;
           ResultSet rsUMC = stmt.executeQuery(reqUserMotsCles) ;
           while (rsUMC.next()) {
               if(rsUMC.getString("parent_mots_cles").equals(motsCles[i].trim())){
               verif = true;
               } 
           }
             if(verif == false){   
            String queryString = "INSERT INTO user_mots_cles (parent_user, parent_mots_cles) values ('"+idUser+"', '"+motsCles[i].trim()+"')";
            stmt.executeUpdate(queryString);
             }
             verif = false;
            }
            stmt.close();
            
            
            
            
            
            
            
            

            String url = "/liste_categorie.jsp";
            RequestDispatcher dispatcher =
                    getServletContext().getRequestDispatcher(url);
            dispatcher.forward(request, response);
        }
        
        
         //Ajouter  une autre Catégorie
        if(cas.equals("autreCategorie")){
            String idUser = request.getParameter("idUser");
            String categorie = request.getParameter("categorie");
           

            //Ajouter  une autre Categorie
            //connect.AjouterAutreCategorie(categorie, idUser);
             boolean verif = false;
            Connection cont = connectdb();
            Statement stmt = cont.createStatement();
           //Vérification de la repétation de meme mot clé       
           //Requete de selection du user_mots_cles 
           String reqCatg =  "select * from categorie "; //where idUser = '"+idUser+"' " ;
           ResultSet rs = stmt.executeQuery(reqCatg) ;
           while (rs.next()) {
               if(rs.getString("categorie").equals(categorie.trim())){
               verif = true;
               } 
           }
             if(verif == false){   
            String queryString = "INSERT INTO categorie (idUser , categorie) values ('"+idUser+"' , '"+categorie.trim()+"')";
            stmt.executeUpdate(queryString);
             }
             verif = false;
            stmt.close();
            
            
            
            

            
            String url = "/AjouterMotsCles.jsp";
               RequestDispatcher dispatcher =
                       getServletContext().getRequestDispatcher(url);
               dispatcher.forward(request, response);
             
        }
        
        
        
         //Ajouter  une autre mots clés
        if(cas.equals("autreMots")){
            String idUser = request.getParameter("idUser");
            String mot = request.getParameter("mot");
            String parent_categorie = request.getParameter("parent_categorie");

            
             out.println("idUser : "+idUser);
             out.println("mot : "+mot);
             out.println("parent_categorie : "+parent_categorie);
            
            //Ajouter  une autre mot Cle
            //connect.AjouterAutreMots(mot, idUser, parent_categorie);
             boolean verifMotCle = false;
            Connection cont = connectdb();
            Statement stmt = cont.createStatement();
           //Vérification de la repétation de meme mot clé       
           //Requete de selection du user_mots_cles 
           String reqUserMotsCles =  "select * from user_mots_cles where parent_user = '"+idUser+"' " ;
           ResultSet rsUMC = stmt.executeQuery(reqUserMotsCles) ;
           while (rsUMC.next()) {
               if(rsUMC.getString("parent_mots_cles").equals(mot.trim())){
               verifMotCle = true;
               } 
           } 
             if(verifMotCle == false){    
            String queryString = "INSERT INTO user_mots_cles (parent_user, parent_mots_cles) values ('"+idUser+"', '"+mot.trim()+"')";
            stmt.executeUpdate(queryString);
            //Ajouter le autre mots sous le catégorie
            String queryCateg = "INSERT INTO mots_cles  (parent_categorie, mot) values ('"+parent_categorie+"', '"+mot.trim()+"')";
            stmt.executeUpdate(queryCateg);
             }
             verifMotCle = false;
            stmt.close();
             
             
             
             
             
             

            
            String url = "/AjouterMotsCles.jsp";
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
            Logger.getLogger(SauvegarderMotsCles.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(SauvegarderMotsCles.class.getName()).log(Level.SEVERE, null, ex);
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
