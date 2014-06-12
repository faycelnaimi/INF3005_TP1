<%-- 
    Document   : index
    Created on : 2014-03-05, 00:08:23
    Author     : faycel
--%>

<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<% String mg = request.getParameter("mg");%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Document sans titre</title>

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
      
    
    <div class="row-1">
          <div class="container">
              

                
                
                
                
                
                
                
                           
<form id="form1" name="form1" method="post" action="ConnectionUser">
    <br><br><br><br><br>
<table width="400" border="0" cellpadding="2" cellspacing="2" align="center">
    
    
    <% if(mg != null){%>
    <tr>
    <td colspan="2" align="left" valign="top" > 
        <div align="center"><span class="text-error"><b>Message d'erreur :</b><br>
          Login ou le mot de passe saisi est incorrect.    </span></div></td>
    </tr>
    <% } %>
    
  <tr>
    <td width="120" align="left" valign="top" class="policeblanche">Login </td>
    <td  align="left" valign="top">
      <input name="login" type="text" class="alert-info" id="login" />    </td>
  </tr>
  <tr>
    <td align="left" valign="top" class="policeblanche" >Mot de passe </td>
    <td align="left" valign="top"><input name="motdepasse" type="password" id="motdepasse" class="alert-info" /></td>
  </tr>
  <tr>
    <td colspan="2" align="left" valign="top"><label>
      
        <div align="center">
          <input name="Submit" type="submit" class="btn-1" value="Envoyer" />
        </div>
        </label></td>
    </tr>
  
  <tr>
    <td colspan="2" align="left" valign="top">- <a href="sauvegarde.jsp">Inscription (nouveau membre) </a></td>
    </tr>
   
</table>

</form>
            
    
    
    
    
    
    
    


      </div>
        </div>
    <div class="container">
      <div class="row">
RÉALISER PAR : 
<lu>
    <li>Faycel Naimi - NAIF18018409</li>
     <li> Soufiane Khene - KHES13098701 </li>
    <li>Aymen Ben Jemia - BENA13098816 </li>
</lu>
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

