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
<% int nombPage = 3; %>
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
            <h3>Ajouter Mots Clés :</h3>     
            <div class="clear"></div>            
                                          
              <p>

			 <form id="form1" name="form1" method="post" action="SauvegarderMotsCles"> 
             <input type='hidden' name='idUser' value='<%= idUser %>'>
			 <input type='hidden' name='cas' value='motsCle'>
		  <%
		  //Requete de selection du categorie 
				String reqCategorie =  "select * from categorie " ;
			   // Connection cont = connect.connectdb();
				Statement smt = cont.createStatement() ;
				ResultSet rs = smt.executeQuery(reqCategorie) ;
				while (rs.next()) {   
		  %>
  
  
         <div  class="btn-info"><strong>
			     <% out.println(rs.getString("categorie")); %> 
		  </strong></div>
		  

		<%
		//Requete liste mots clés
		String reqMotsCle =  "select * from mots_cles where parent_categorie = "+rs.getString("id")+" " ;
		Statement smtMots = cont.createStatement() ;
		ResultSet rsMots = smtMots.executeQuery(reqMotsCle) ;
		while (rsMots.next()) {
		%>
    
       <input type="checkbox" name="check" value="<%out.println(rsMots.getString("mot"));%>"  />
       <%  out.println(rsMots.getString("mot"));%><br><br>


       
    
			<% } %>
		  <br>
		   <% } %>
  

   <input type="submit" name="Submit" class="btn-1" value="Ajouter" />
			 </form>
	
			  </p>
            </li>
			

          </ul>
          
		  
		 
      


              <%
		//Vérification de Categorie
                boolean verfiCategorie = false;
                int parent_catg = 0;
                
		String reqCatg =  "select * from categorie where idUser = "+idUser+" " ;
		Statement smtcat = cont.createStatement() ;
		ResultSet rsCat= smtcat.executeQuery(reqCatg) ;
		while (rsCat.next()) {
                // out.println("------"+rsCat.getString("categorie"));
                 verfiCategorie = true;
                 parent_catg = rsCat.getInt("id");
                }
                
                
                
                //--------------------------------------------------------------
                //nombre de mots cles
                int nbMotsCle = 0;
                String reqCatg_mot =  "select * from categorie, mots_cles where categorie.id = mots_cles.parent_categorie and categorie.idUser = "+idUser+" " ;
		Statement smtCatg_mot = cont.createStatement() ;
		ResultSet rsCatg_mot= smtCatg_mot.executeQuery(reqCatg_mot) ;
		while (rsCatg_mot.next()) {
                 //out.println("------"+rsCatg_mot.getString("mots_cles.mot"));
                // verfiCategorie = true;
                // parent_catg = rsCat.getInt("id");
                 nbMotsCle++;
                }
                
                
               	
                if(!verfiCategorie){
              %>
    
         <div class="inner-1">   

             <ul class="list-blog">
            <li>  
            <h3>Ajouter une autre Catégorie :</h3>     
            <div class="clear"></div>            
                                          
              <p>

	     <form id="motCle" name="motCle" method="post" action="SauvegarderMotsCles"> 
             <input type='hidden' name='idUser' value='<%= idUser %>'>
	     <input type='hidden' name='cas' value='autreCategorie'>
	     <span>Catégorie :</span> <input name="categorie" type="text" id="categorie" /><br>
			  
		 

            <input type="submit" name="Submit" class="btn-1" value="Ajouter" />
			 </form>
	
			  </p>
            </li>
			

          </ul>
             
            <% } %> 
             
             
             <% if(verfiCategorie && (nbMotsCle < 5)){ %>
             
             <%  out.println("Nombre de mots clés : "+nbMotsCle+"/5");%>
             
          <ul class="list-blog">
            <li>  
            <h3>Ajouter une autre mots clés :</h3>     
            <div class="clear"></div>            
                                          
              <p>

	     <form id="motCle" name="motCle" method="post" action="SauvegarderMotsCles"> 
             <input type='hidden' name='idUser' value='<%= idUser %>'>
             <input type='hidden' name='parent_categorie' value='<%= parent_catg %>'>
	     <input type='hidden' name='cas' value='autreMots'>
	     <span>Autre Mot Clé :</span> <input name="mot" type="text" id="mot" /><br>
			  
		 

            <input type="submit" name="Submit" class="btn-1" value="Ajouter" />
			 </form>
	
			  </p>
            </li>
			

          </ul>
          
	<% } %>	  
		 
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
