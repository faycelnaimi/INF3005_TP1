<article class="span4">
         
          <h3> Votre Liste Mots Clés : </h3>
          <ul class="list extra extra1">  
		  
		  
		  
		  
		  
		  
			
		  <% 

                         //Supprimer mot Clé
			String id =" ";
			 id = request.getParameter("id"); 
			// out.print(id);
		     if(id != null){
 
                    // Connection cont = connect.connectdb();
                     Statement stmt = cont.createStatement();
                     String queryString = "DELETE FROM `user_mots_cles` WHERE `id` = "+id+" ";                   
                     stmt.executeUpdate(queryString);
                     stmt.close();
                }
		  		
			//Affiche les mots 
			//Requete de selection du user_mots_cles 
			String reqListeMotsCles =  "select * from user_mots_cles where parent_user = '"+idUser+"' " ;
			//Connection cont = connect.connectdb();
			Statement smtLMC = cont.createStatement() ;
			ResultSet rsLMC = smtLMC.executeQuery(reqListeMotsCles) ; 
			

				while (rsLMC.next()) {     
				out.println("<li>"+rsLMC.getString("parent_mots_cles")+"   <a href=\"AjouterMotsCles.jsp?id="+rsLMC.getString("id")+"\" onClick=\"return confirm('Êtes-vous sûr de supprimer Cette Mot Clé !');\"> <img src=\"temp/img/delete02.png\" title=\"Supprimer\" border=\"0\"></a></li>");
                               
				}
		%>  
                   
      </ul>
                  
          <a href="AjouterMotsCles.jsp" class="btn btn-1"> Ajouter Mots Clés   </a>
          <h3> Commentaire : </h3>
           <h3> Recus : </h3>
          <ul class="list extra extra1"> 
           <%     
		//Requete 
		//String reqEchange =  "select * from user, echange where user.id = echange.id_corresp and echange.parent_user = '"+idUser+"' " ;
                String reqEchange =  "select * from user, echange where user.id = echange.parent_user and echange.id_corresp  = '"+idUser+"' " ;
		Statement smtEch = cont.createStatement() ;
		ResultSet rsEch = smtEch.executeQuery(reqEchange) ;  
                while (rsEch.next()) {     
		 
                    out.println(" <li> "+rsEch.getString("nom")+"  "+rsEch.getString("prenom")+" : <div id = \"cadre_recus\">"+rsEch.getString("message")+"</div></li>");
                               
		}
	 %>
         </ul>
         
         
         
          <h3> Envoyer : </h3>
          <ul class="list extra extra1"> 
           <%     
		//Requete 
		String reqEchangeENV =  "select * from user, echange where user.id = echange.id_corresp and echange.parent_user = '"+idUser+"' " ;
                //String reqEchangeENV =  "select * from user, echange where user.id = echange.parent_user and echange.id_corresp  = '"+idUser+"' " ;
		Statement smtEchENV = cont.createStatement() ;
		ResultSet rsEchENV = smtEchENV.executeQuery(reqEchangeENV) ;  
                while (rsEchENV.next()) {     
		 
                    out.println(" <li> "+rsEchENV.getString("nom")+" "+rsEchENV.getString("prenom")+" :  <div id = \"cadre_envoy\"> "+rsEchENV.getString("message")+"</div></li>");
                               
		}
	 %>
         </ul>
         
         
         
        </article>
