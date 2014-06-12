/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package User;

/**
 *
 * @author faycel
 */
public class Photo {
    byte[] contenu;
    String contentType;

    public Photo(byte[] contenu, String contentType) {
        this.contenu = contenu;
        this.contentType = contentType;
    }

    public Photo(long copyLarge, String contentType) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public byte[] getContenu() {
        return contenu;
    }

    public void setContenu(byte[] contenu) {
        this.contenu = contenu;
    }

    public String getContentType() {
        return contentType;
    }

    public void setContentType(String contentType) {
        this.contentType = contentType;
    }
    
}
