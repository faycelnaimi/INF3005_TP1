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
<% int nombPage = 1; %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
<%@include file="header.jsp"  %>

		
    </head>
	
    <body>
        
	
	
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
            <h3>Fomulaire Modification profil :</h3>     
            <div class="clear"></div>            
                                          
              <p>

			  <form id="form1" name="form1" method="post" action="ModifierProfil">
              <input type="HIDDEN" name="idUser" value="<%= personne.getId() %>"> 
				<address class="address-1">
		        <span>Nom :</span> <input name="nom" type="text" id="nom" value="<%= personne.getNom() %>"/><br>
                <span>Prenom :</span><input name="prenom" type="text" id="prenom"  value="<%= personne.getPrenom() %>"/><br>
                <span> Age :</span><input name="age" type="text" id="age" value="<%= personne.getAge() %>"/><br>
				<span> Adresse :</span><input name="adresse" type="text" id="adresse" value="<%= personne.getAdresse() %>" /><br>
				<span> Ville :</span><input name="ville" type="text" id="ville" value="<%= personne.getVille() %>"/><br>
				<span> Login :</span><input name="login" type="text" id="login" value="<%= personne.getLogin() %>" /><br>
				<span> Mot de passe :</span><input name="motdepasse" type="text" id="motdepasse" value="<%= personne.getMotdepasse() %>" /><br>
                </address>
				<input type="submit" name="Submit" class="btn-1" value="Modifier" />
				</form>
	
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
