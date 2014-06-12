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
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ADMINISTRATEUR</title>
<%@include file="header.jsp"  %>
    </head>
	
    <body>
        
	
	
 <div class="spinner"></div> 


<%@include file="menu_admin.html"  %>



 
<div class="bg-content">
  <div class="container"></div>
      
      <!--============================== content =================================-->
      
      <div id="content" class="content-extra"><div class="ic"></div>

    <div class="container">
      <div class="row">



 
        

<article class="span8">
         <div class="inner-1">         
          <ul class="list-blog">
            <li>  
            <h3>Gestion Users : </h3>     
            <div class="clear"></div>
			                                          
              <p>
<!-- Affiche User -->
<%
       String id = request.getParameter("idUser");
       int idUser= Integer.parseInt(id);
   //Requete de selection tout les  user 
   String reqListeMotsCles =  "select * from user where id = "+idUser+"" ;
   Connection cont = connect.connectdb();
   Statement smtUser = cont.createStatement() ;
   ResultSet rsUser = smtUser.executeQuery(reqListeMotsCles) ;  
%>			 
	
	<img src="temp/img/image_profil.jpg" alt="" width="300">

    <% while (rsUser.next()) { %>    
			  <address class="address-1">
        
          
		   <span>Nom :</span><% out.println(rsUser.getString("nom"));%><br>
                <span>Prenom :</span><% out.println(rsUser.getString("prenom"));%><br>
                <span> Age :</span><% out.println(rsUser.getString("age"));%><br>
				<span> Adresse :</span><% out.println(rsUser.getString("adresse"));%><br>
				<span> Ville : </span><% out.println(rsUser.getString("ville"));%><br>
               
               
          </address>
   <% } %>
   <a href="administateur.jsp" class="btn btn-1"> Retour  </a>
			 
			 
			 
	
			  </p>
            </li>
			

          </ul>
          
		  
		 
        </article>
		
		
		
   











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
