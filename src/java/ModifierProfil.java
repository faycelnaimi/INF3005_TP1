/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
import User.connect;
import static User.connect.connectdb;
import User.user;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author faycel
 */
public class ModifierProfil extends HttpServlet {

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
      
        String idUser = request.getParameter("idUser");
        int id = Integer.parseInt(idUser);
        
      // out.println(id);
       
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String age = request.getParameter("age");
        String adresse = request.getParameter("adresse");
        String ville = request.getParameter("ville");
        String login = request.getParameter("login");
        String motdepasse = request.getParameter("motdepasse");
        String photo = request.getParameter("photo");
        
        
        //Modifier le profil 
         Connection cont = connect.connectdb();
         Statement stmt = cont.createStatement();
         String queryString = "UPDATE user SET nom = '"+nom+"' , prenom ='"+prenom+"', age = '"+age+"', adresse = '"+adresse+"' , ville = '"+ville+"' , login = '"+login+"' , motdepasse = '"+motdepasse+"'    where id = '"+id+"' ";
         stmt.executeUpdate(queryString);
         stmt.close();
       
       
        // Rcuperation Personne de session
         HttpSession session = request.getSession();
         user personne = (user) (session.getAttribute("personne"));
         personne.setNom(nom);
         personne.setPrenom(prenom);
         personne.setAge(age);
         personne.setAdresse(adresse);
         personne.setVille(ville);
         personne.setLogin(login);
         personne.setMotdepasse(motdepasse);
         
         session.setAttribute("personne", personne);      
         String url = "/liste_categorie.jsp";
        
        RequestDispatcher dispatcher =
                getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
        
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
            Logger.getLogger(ModifierProfil.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ModifierProfil.class.getName()).log(Level.SEVERE, null, ex);
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
