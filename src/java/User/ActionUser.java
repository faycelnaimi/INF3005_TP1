package User;

import static User.connect.*;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author faycel
 */
public class ActionUser {
    
    
    
     /**
     * 
     * @param personne
     * @throws SQLException 
     */
    public  void AjouterUser(user personne) throws SQLException{
         Connection cont = connectdb();
         Statement stmt = cont.createStatement();
         String queryString = "INSERT INTO user (nom, prenom, age, adresse, ville, login, motdepasse, photo) values ('"+personne.getNom()+"','"+personne.getPrenom()+"','"+personne.getAge()+"','"+personne.getAdresse()+"','"+personne.getVille()+"','"+personne.getLogin()+"','"+personne.getMotdepasse()+"', '"+personne.getPhoto() +"')";
         stmt.executeUpdate(queryString);
         stmt.close();    
    }
    
 
    
    
    public  void AjouterMotsCles( String[] motsCles, String idUser) throws SQLException{
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
    }
    
    
    
    public  void AjouterAutreMots( String mot, String idUser , String parent_categorie) throws SQLException{
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
    }
    
    
    
    public  void AjouterAutreCategorie( String categorie, String idUser) throws SQLException{
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
    }
    
    
    
    
    
    
}
