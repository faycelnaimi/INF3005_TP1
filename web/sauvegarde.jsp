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
        <title>JSP Page</title>
<%@include file="header.jsp"  %>

		
    </head>
	
    <body>
        
	
	
 <div class="spinner"></div> 



<header>
      <div class="container clearfix">
    <div class="row">
          <div class="span12">
        <div class="navbar navbar_">
              <div class="container">
            <h1 class="brand brand_"><a href="index.jsp"><img alt="" src="temp/img/logo.gif"> </a></h1>
            <a class="btn btn-navbar btn-navbar_" data-toggle="collapse" data-target=".nav-collapse_">Menu <span class="icon-bar"></span> </a>
            
			
			<div class="nav-collapse nav-collapse_  collapse">
              

			    </div>
			
				
          </div>
            </div>
      </div>
        </div>
  </div>
    </header>


 
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
            <h3>Fomulaire d'inscription : </h3>     
            <div class="clear"></div>            
                                          
              <p>
			 
               <% 
                String mg = null;    
                mg = request.getParameter("mg");     
              if( mg != null && mg.equals("erreur") ){ %>
               <div ><span class="text-error"><b>Message d'erreur :</b><br>
               Remplierz les Champs de text "Nom , Login , Mot de passe "<br>
               MERCI   </span></div>
               <% } %>
               
               
               <%  
              if(mg != null && mg.equals("erreurLogin")){ %>
               <div ><span class="text-error"><b>Message d'erreur :</b><br>
                Login déja existe ! "<br>
               MERCI   </span></div>
               <% } %>
               
                
			   
		 <form id="form1" name="form1" method="post" action="SauvegardeUser" >
             
				<address class="address-1">
		        <span>Nom :</span> <input name="nom" type="text" id="nom" /><br>
                <span>Prenom :</span><input name="prenom" type="text" id="prenom"  /><br>
                <span> Age :</span><input name="age" type="text" id="age" /><br>
				<span> Adresse :</span><input name="adresse" type="text" id="adresse"  /><br>
				<span> Ville :</span><input name="ville" type="text" id="ville" /><br>
				<span> Login :</span><input name="login" type="text" id="login" /><br>
				<span> Mot de passe :</span><input name="motdepasse" type="text" id="motdepasse"  /><br>
				<span> Photo :</span><input id="photo" name="photo" class="input-file" type="file"><br>
                </address>
				<input type="submit" name="Submit" class="btn-1" value="Enregister" />
				</form>
	
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
