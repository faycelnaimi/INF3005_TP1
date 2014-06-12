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
		 String categorie = null;
		 op = request.getParameter("op");
                 int NbMotsCles = 0;
                 String mgerror = "";
         // Ajouter mots clés      
                 if(op != null){
                     
                     categorie = request.getParameter("categorie");
		      // int idctg = Integer.parseInt(categorie);		 
		     String mots = request.getParameter("mots");
                     
                     //Verification nombre de mots clés
                     Connection cont = connect.connectdb();
                     String queryNbMot = "select * from mots_cles where parent_categorie = "+categorie+" " ;
                     Statement smtNbMot = cont.createStatement() ;
		     ResultSet rsNbMot = smtNbMot.executeQuery(queryNbMot) ;
		     while (rsNbMot.next()) {
                     NbMotsCles++;
                     }
                     
					  
                     if(NbMotsCles < 10){
                     Statement stmt = cont.createStatement();
                     String queryString = "INSERT INTO mots_cles  (parent_categorie, mot ) values ('"+categorie+"', '"+mots+"')";
                     stmt.executeUpdate(queryString);
                     stmt.close();
                     }else{ %>
                      <SCRIPT LANGUAGE="JavaScript">
                    alert('Le nombre de mots clés a depassé la limite de 10 !');
                     </SCRIPT>
                     <%
                     }
                     
                }
		
		//Supprimer mots clés  
		String option =" ";
		 option = request.getParameter("option");
		

		 
		 if(option != null) {
		     
                     String[] idMotsCles = request.getParameterValues("check");  
                     
                     Connection cont = connect.connectdb();
					 
		   	 
		    for (int i = 0; i < idMotsCles.length ; i++) {
					 
                     Statement stmt = cont.createStatement();
                     String queryString = "DELETE FROM `mots_cles` WHERE `id` = "+idMotsCles[i]+" ";                   
                     stmt.executeUpdate(queryString);
		     stmt.close();
					 
	           
                    }
                   
					 
                     
                }
		
        %>
  
  
  
         
           
            <h3>Gestion Mots Clés : </h3>     
            <div class="clear"></div>                                       
              <p>


 <form id="form1" name="form1" method="post" action="gestionMotsCles.jsp"> 
            
		  <%
		  //Requete de selection du categorie 
				String reqCategorie =  "select * from categorie " ;
			    Connection cont = connect.connectdb();
				Statement smt = cont.createStatement() ;
				ResultSet rs = smt.executeQuery(reqCategorie) ;
				while (rs.next()) {   
		  %>
  
  
         <div  class="btn-info"><strong>
			    * <% out.println(rs.getString("categorie")); %> 
		  </strong></div>
		  

		<%
		//Requete liste mots clés
		String reqMotsCle =  "select * from mots_cles where parent_categorie = "+rs.getString("id")+" " ;
		Statement smtMots = cont.createStatement() ;
		ResultSet rsMots = smtMots.executeQuery(reqMotsCle) ;
		while (rsMots.next()) {
		%>
    
       <input type="checkbox" name="check" value=" <%  out.println(rsMots.getString("id"));%>"  />
       <%  out.println(rsMots.getString("mot"));%><br><br>


    
			<% } %>
		  <br>
		   <% } %>
		   
   <input type='hidden' name='option' value='supprimer'>
   <input type="submit" name="Submit" class="btn-1" value="Supprimer" onClick="return confirm('Êtes-vous sûr de supprimer Ces mots Clés !');"  />
			 </form>




 <h3>Ajouter Mots Clés :</h3>	
 

			 
	 <form id="form2" name="form2" method="post" action="gestionMotsCles.jsp?op=Enregister">
	<span>Liste catégorie :</span>
		  <select name="categorie" > 
		  <%
		  //Requete de selection du categorie 
				String reqCategorie2 =  "select * from categorie " ;
			    //Connection cont = connect.connectdb();
				Statement smt2 = cont.createStatement() ;
				ResultSet rs2 = smt2.executeQuery(reqCategorie2) ;
				while (rs2.next()) {   
		  %>
    <option value="<% out.println(rs2.getString("id")); %>"><% out.println(rs2.getString("categorie")); %> </option>
	 <% } %>
	 </select>	<br>
 
	 <span>Mots Clés : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span> <input name="mots" type="text" id="mots" /><br>
	 
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
