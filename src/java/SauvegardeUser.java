import User.ActionUser;
import static User.connect.connectdb;
import User.user;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author faycel
 */
public class SauvegardeUser extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
       
        PrintWriter out = response.getWriter();
        String url;
        boolean verf = false;
        
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String age = request.getParameter("age");
        String adresse = request.getParameter("adresse");
        String ville = request.getParameter("ville");
        String login = request.getParameter("login");
        String motdepasse = request.getParameter("motdepasse");
        String photo = request.getParameter("photo");
       // int tel = Integer.parseInt(tels);       
        if((nom != "") && (login != "") && (motdepasse != "")){
            
        user personne = new user();
        personne.setNom(nom);
        personne.setPrenom(prenom);
        personne.setAge(age);
        personne.setAdresse(adresse);
        personne.setVille(ville);
        personne.setLogin(login);
        personne.setMotdepasse(motdepasse);
        personne.setPhoto(photo);

        //Verification login trouvable
        String sqlVerf =  "select * from user where login = '"+login+"'   " ;
        Connection cont = connectdb();
        Statement smt = cont.createStatement() ;
        ResultSet rsVerf = smt.executeQuery(sqlVerf) ;
        while(rsVerf.next()){
         //out.println( "dfsfsdfsdfsdfsdf + :"+rsVerf.getString("login"));
         if((rsVerf.getString("login").equals(login))){
           verf = true;  
        }
        }
        if(verf == false){
        
         //Ajouter  un user  a la base de donnée
         //ActionUser.AjouterUser(personne);
            
              
         Statement stmt = cont.createStatement();
         String queryString = "INSERT INTO user (nom, prenom, age, adresse, ville, login, motdepasse, photo) values ('"+personne.getNom()+"','"+personne.getPrenom()+"','"+personne.getAge()+"','"+personne.getAdresse()+"','"+personne.getVille()+"','"+personne.getLogin()+"','"+personne.getMotdepasse()+"', '"+personne.getPhoto() +"')";
         stmt.executeUpdate(queryString);
         stmt.close(); 
            
            
           
        
            HttpSession session = request.getSession();
            session.setAttribute("personne", personne);      
            url = "/liste_categorie.jsp";

            RequestDispatcher dispatcher =
                    getServletContext().getRequestDispatcher(url);
            dispatcher.forward(request, response);
        
        
        }else{
         url = "/sauvegarde.jsp?mg=erreurLogin";
         RequestDispatcher dispatcher =
                getServletContext().getRequestDispatcher(url);
         dispatcher.forward(request, response);
        
        }
       
        }else{
        url = "/sauvegarde.jsp?mg=erreur";
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
            Logger.getLogger(SauvegardeUser.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(SauvegardeUser.class.getName()).log(Level.SEVERE, null, ex);
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
