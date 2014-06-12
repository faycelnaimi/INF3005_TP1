<%-- 
    Document   : liste_categorie
    Created on : 2014-03-05, 00:43:42
    Author     : faycel
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%@page import="User.connect"%>

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
  
  
  
  <% 

		String op =" ";
		 op = request.getParameter("op");
		
               //  Ajouter  un categorie
                 if(op != null){
                 
                     String categorie = request.getParameter("categorie");
                     Connection cont = connect.connectdb();
                     Statement stmt = cont.createStatement();
                     String queryString = "INSERT INTO categorie  (idUser, categorie ) values (0, '"+categorie+"')";
                     stmt.executeUpdate(queryString);
                     stmt.close();
                }
		
		//Supprimer categorie
		String id =" ";
		 id = request.getParameter("id");
		 if(id != null){
                     Connection cont = connect.connectdb();
                     Statement stmt = cont.createStatement();
                     String queryString = "DELETE FROM `categorie` WHERE `id` = "+id+" ";                   
                     stmt.executeUpdate(queryString);
                     stmt.close();
                }
		
        %>
  
  
  
         
           
            <h3>Gestion Catégories : </h3>     
            <div class="clear"></div>                                       
              <p>
<!-- Affiche categorie -->
<%
   //Requete de selection tout les  categorie 
   String reqCategorie =  "select * from categorie " ;
   Connection cont = connect.connectdb();
   Statement smtCat = cont.createStatement() ;
   ResultSet rsCat = smtCat.executeQuery(reqCategorie) ;  
%>			 
	
	

	
	<table width="100%" border="0" cellpadding="0" cellspacing="0" align="left" >
    <tr>
        <td width="82" align="left" valign="top"  > <h5>Nom</h5></td>
        <td width="84" align="left" valign="top"> <h5>Supprimer</h5></td>
  <% while (rsCat.next()) { %>
    </tr>
	    <tr>
        <td width="82" align="left" valign="top"> <% out.println("<li>"+rsCat.getString("categorie")+" "); %></td>
        <td width="84" align="left" valign="top"  > <a href="gestionCategorie.jsp?id=<%= rsCat.getString("id")%>" onclick="return confirm('Êtes-vous sûr de supprimer Cette Catégorie !');"> <img src="temp/img/trash.png" border="0">  </a></td>
    </tr>
	<% } %>
	
	</table>
	<br>
<br>


 <h3>Ajouter Catégorie :</h3>	 
			 
	 <form id="form1" name="form1" method="post" action="gestionCategorie.jsp?op=envoyer">
	<span>Nom de catégorie :</span> <input name="categorie" type="text" id="categorie" /><br>	 
	<input type="submit" name="Submit" class="btn-1" value="Enregister" />
	 </form>
 
 </p>
           
          
		  
		 
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
