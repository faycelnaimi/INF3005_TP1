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
          <ul class="list-blog">
            <li>  
            <h3>Gestion Users : </h3>     
            <div class="clear"></div>                                       
              <p>
 <%                 
//Supprimer le user  base de donnée
        String idUser = request.getParameter("idUser");
        String option = request.getParameter("option");
        
        if((idUser != null) || (option == "supprimer")){
       
         Connection cont = connect.connectdb();
         Statement stmt = cont.createStatement();
         String queryString = " DELETE FROM user where id = '"+idUser+"'  ";
         stmt.executeUpdate(queryString);
         stmt.close();                  
       
        }         
//-- Affiche User --

   //Requete de selection tout les  user 
   String reqListeMotsCles =  "select * from user " ;
   Connection cont = connect.connectdb();
   Statement smtUser = cont.createStatement() ;
   ResultSet rsUser = smtUser.executeQuery(reqListeMotsCles) ;  
%>			 
	
	
<table width="100%" border="0" cellpadding="0" cellspacing="0" align="left" bordercolor="#FFFFFF">
    <tr>
        <td width="82" align="left" valign="top" bgcolor="#FFFFFF" > <h5>Nom</h5></td>
        <td width="84" align="left" valign="top" bgcolor="#FFFFFF" > <h5>Prenom</h5></td>
         <td width="84" align="left" valign="top" bgcolor="#FFFFFF" > </td>
		  <td width="84" align="left" valign="top" bgcolor="#FFFFFF" > </td>
    </tr>
    <% while (rsUser.next()) { %>    
     <tr>
        <td align="left" valign="top" bgcolor="#333333"> <% out.println(rsUser.getString("nom"));%></td>
        <td align="left" valign="top" bgcolor="#333333"> <% out.println(rsUser.getString("prenom"));%></td>

        <td align="left" valign="top" bgcolor="#333333">  
		<a href="admin_voir_user.jsp?idUser=<% out.println(rsUser.getInt("id")); %>" class="btn btn-1"> Voir  </a>
		</td>
        <td align="left" valign="top" bgcolor="#333333"> 
        <form name="Supprimer" method="post" action="administateur.jsp">
        <input type='hidden' name='option' value='supprimer'>
        <input type='hidden' name='idUser' value='<% out.println(rsUser.getInt("id")); %>'>
        <input type="submit" name="Submit" value="Supprimer" class="btn-1" onclick="return confirm('Êtes-vous sûr de supprimer Cette Personne !');">
		
        </form> 
        </td>
    </tr>
   <% } %>
</table> 
			 
			 
			 
	
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
