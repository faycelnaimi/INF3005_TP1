
<header>
      <div class="container clearfix">
    <div class="row">
          <div class="span12">
        <div class="navbar navbar_">
              <div class="container">
            <h1 class="brand brand_"><a href="#"><img alt="" src="temp/img/logo.gif"> </a></h1>
            <a class="btn btn-navbar btn-navbar_" data-toggle="collapse" data-target=".nav-collapse_">Menu <span class="icon-bar"></span> </a>
            
			
			<div class="nav-collapse nav-collapse_  collapse">
			   <ul class="nav sf-menu">
                <li <% if(nombPage == 1) { %>class="active"<% } %>><a href="liste_categorie.jsp">Profil</a></li>
                <li><a href="liste_categorie.jsp#localisation">Maps</a></li>
                <li <% if(nombPage == 3) { %>class="active"<% } %>><a href="AjouterMotsCles.jsp">Mots</a></li>
		<li <% if(nombPage == 4) { %>class="active"<% } %>><a href="affinites.jsp">Affinités</a></li>
                <li><a href="index.jsp">Exit</a></li>
              </ul>
			    </div>
			
				
          </div>
            </div>
      </div>
        </div>
  </div>
    </header>