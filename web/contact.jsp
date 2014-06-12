<%-- 
    Document   : contact
    Created on : 2014-03-06, 22:05:56
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

		
    </head>
    <body>
       
    
        
	
	
 <div class="spinner"></div> 



<%@include file="menu_haut.jsp"  %>

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
            <h3>Echange Corredonnée : </h3>     
            <div class="clear"></div>            
                                          
              <p>
		<% 
  
        
        
        String idCoresp = request.getParameter("idCoresp");
       int idcop = Integer.parseInt(idCoresp);
        

        
        
		String op =" ";
		 op = request.getParameter("op");
		

                 
                 if(op != null){
                 
                    String message = request.getParameter("message");

                     Statement stmt = cont.createStatement();
                     String queryString = "INSERT INTO echange (parent_user, id_corresp, message) values ('"+idUser+"', '"+idcop+"' , '"+message+"')";
                     stmt.executeUpdate(queryString);
                     stmt.close();
                response.sendRedirect("affinites.jsp");
                }
		
		
		
        %>
			   
              <form id="form1" name="form1" method="post" action="contact.jsp?op=envoyer&idCoresp=<%= idCoresp %>">
             
				<address class="address-1">
		        <span> Message :</span> <textarea name="message" cols="" rows=""></textarea> <br>
              
                </address>
				<input type="submit" name="Submit" class="btn-1" value="Envoyer" />
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

