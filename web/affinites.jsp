<%-- 
    Document   : liste_categorie
    Created on : 2014-03-05, 00:43:42
    Author     : faycel
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="User.user"%>
<%@page import="User.connect"%>
<jsp:useBean id="personne" class="User.user" scope="session"/> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% int nombPage = 4; %>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
<%@include file="header.jsp"  %>
<!--- code de localisation Google Maps -->
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false&language=fr">
</script>
<script type="text/javascript">
var geocoder;
var map;
// initialisation de la carte Google Map de départ
function initialiserCarte() {
  geocoder = new google.maps.Geocoder();
  // Ici j'ai mis la latitude et longitude du vieux Port de Marseille pour centrer la carte de départ
  var latlng = new google.maps.LatLng(43.295309,5.374457);
  var mapOptions = {
    zoom      : 12,
    center    : latlng,
    mapTypeId : google.maps.MapTypeId.ROADMAP
  }
  // map-canvas est le conteneur HTML de la carte Google Map
  map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
}
 
function TrouverAdresse() {
  // Récupération de l'adresse tapée dans le formulaire
  var adresse = "<%= personne.getAdresse() %>";
  geocoder.geocode( { 'address': adresse}, function(results, status) {
    if (status == google.maps.GeocoderStatus.OK) {
      map.setCenter(results[0].geometry.location);
      // Récupération des coordonnées GPS du lieu tapé dans le formulaire
      var strposition = results[0].geometry.location+"";
      strposition=strposition.replace('(', '');
      strposition=strposition.replace(')', '');
      // Affichage des coordonnées dans le <span>
      document.getElementById('text_latlng').innerHTML='Coordonnées : '+strposition;
      // Création du marqueur du lieu (épingle)
      var marker = new google.maps.Marker({
          map: map,
          position: results[0].geometry.location
      });
    } else {
      alert('Adresse introuvable: ' + status);
    }
  });
}
// Lancement de la construction de la carte google map
google.maps.event.addDomListener(window, 'load', initialiserCarte);
</script>

		
    </head>
	
    <body onLoad="TrouverAdresse();">
        
	
	
 <div class="spinner"></div> 



<%@include file="menu_haut.jsp"  %>


 
<div class="bg-content">
  <div class="container"></div>
      
      <!--============================== content =================================-->
      
      <div id="content" class="content-extra"><div class="ic"></div>

    <div class="container">
      <div class="row">




 <%
 //Requete de selection et recherche 
         int idUser = 0;
        String sql =  "select * from user where login = '"+personne.getLogin()+"' and  motdepasse = '"+personne.getMotdepasse()+"' " ;
        Connection cont = connect.connectdb();
        Statement smtID = cont.createStatement() ;
        ResultSet rsID = smtID.executeQuery(sql) ;
        while (rsID.next()) {
             idUser = rsID.getInt("id");  
         }
   %>  
        

<article class="span8">
         <div class="inner-1">         
          <ul class="list-blog">
            <li>  
              
            <div class="clear"></div>            
                                         
              <p>
              
              <address class="address-1">
        
          
		   <span>Nom :</span><%= personne.getNom() %> 
                    <span>Prenom :</span><%= personne.getPrenom() %>
                
              		 <br>
		  <h3>les personnes des affinités : </h3>  
		 <br>
               
		  <%    double commun = 1.0 ;
                         int nombId[]= new int[100] ;
                          int i = 0; 
			//Requete de selection du user_mots_cles 
			String ListeMotsCles =  "select * from user_mots_cles where parent_user = '"+idUser+"' " ;
			//Connection cont = connect.connectdb();
			Statement smtLM = cont.createStatement() ;
			ResultSet rsLM = smtLM.executeQuery(ListeMotsCles) ; 
                        while (rsLM.next()) { 
		  %>
                          
                           <% 
                              int nbrCAT = 0;
			//Requete de selection du user_mots_cles 
			String nbrMotsCles =  "select * from user_mots_cles where parent_user = '"+idUser+"' " ;
			//Connection cont = connect.connectdb();
			Statement smtNBR = cont.createStatement() ;
			ResultSet rsNBR = smtNBR.executeQuery(nbrMotsCles) ;  
		  
				while (rsNBR.next()) {     
				//out.println("<li><a href=\"#\">"+rsLMC.getString("parent_mots_cles")+"</a></li>");
                               nbrCAT++;
				}
		%>  
                          
                          
			   <%    
				 String motsProche = ("Select distinct nom, prenom, user.id from user, user_mots_cles where "
                                         + " user_mots_cles.parent_user = user.id " 
                                         + " and parent_mots_cles = '"+rsLM.getString("parent_mots_cles")+"' "
                                         + "and user.login != '"+ personne.getLogin()+"'"
                                         + "and user.ville = '"+personne.getVille()+"'" );
                                 
				// Connection cont = connect.connectdb();
				 Statement motsp = cont.createStatement() ;
				 ResultSet motsclesproche = motsp.executeQuery(motsProche) ;
				 while (motsclesproche.next()) {
			
                         
                              
                          // enlever les doublons
                          boolean trouve = false;
                          for(int j=0 ; j < i ; j++){
                            if( nombId[j] == motsclesproche.getInt("id" )){
                              trouve = true ;
                              commun ++ ;
                            }
                          }
                          if(!trouve){
                              nombId[i] = motsclesproche.getInt("id");
                              
                              out.println("<div id =\"cadre_infos\">"+motsclesproche.getString("nom")+" "+motsclesproche.getString("prenom")
                                      +" : &nbsp;&nbsp; "+(int)((commun / nbrCAT)*100  )+"%  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
                                      +" <a href=\"contact.jsp?idCoresp="+motsclesproche.getInt("id") +"\" class=\"btn btn-1\">Contact</a>"
                                      +" </div> <br>");
                              }
                          i++;
                         
                            }   
                           }  
                           
                           
                       
			  %>
               
          </address>
				
			
			  </p>
            </li>
			
			
			 <li>  
            <h3>Affinité Geographique : </h3>     
           <a name="localisation"></a>
            <div class="clear"></div>            
                              
              <p>
			  <span id="text_latlng"></span>
			  <div id="map-canvas" style="float:left;height:220px;width:100%"></div>
			  <br>
                         
                          
                          
                          
                          
                          
                          
		       

			  </p>
                     
            </li> 
			
			
			
			
          </ul>
          
		  
		 
        </article>


       <%@include file="menu_gauche.jsp"  %>









      </div>
        </div>
  </div>
    </div>

<!--============================== footer =================================-->
<footer>
  <div class="container clearfix">
    <ul class="list-social pull-right">
          <li><a class="icon-1" href="#"></a></li>
          <li><a class="icon-2" href="#"></a></li>
          <li><a class="icon-3" href="#"></a></li>
          <li><a class="icon-4" href="#"></a></li>
    </ul>
  </div>
</footer>
<script type="text/javascript" src="temp/js/bootstrap.js"></script>
	
	
		
		
		
    </body>
</html>
