
package User;
import java.io.Serializable;
/**
 *
 * @author faycel
 */
public class user implements Serializable{
  public   int id;
  public   String nom;
  public   String prenom;
  public   String age;
  public   String adresse;
  public   String ville;
  public   String login;
  public   String motdepasse;
  public   String photo;

    


    public user() {
       
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


    public String getVille() {
        return ville;
    }

    public String getNom() {
        return nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public String getAge() {
        return age;
    }

    public String getAdresse() {
        return adresse;
    }

    public String getLogin() {
        return login;
    }

    public String getMotdepasse() {
        return motdepasse;
    }

    public String getPhoto() {
        return photo;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public void setAdresse(String adresse) {
        this.adresse = adresse;
    }
   
    public void setVille(String ville) {
        this.ville = ville;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public void setMotdepasse(String motdepasse) {
        this.motdepasse = motdepasse;
    }
  public void setPhoto(String Photo) {
        this.photo = Photo;
    }
  
  
  
    
}
