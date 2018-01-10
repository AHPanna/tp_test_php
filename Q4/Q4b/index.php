<?php 
	session_start(); 
	
?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="style.css"/>
	<title>Hygiène et Beauté</title>
</head>
<body>
 <div id="bloc_page">
 	<h1>Produits de Beauté et d'Entretient</h1>

	<?php
	//partie session
		if(isset($_SESSION['nom']) ){
			
				
				echo "<img id='imageBpDeconnexion' src='images\deconnexionSession.jpeg' onclick='destroySession();'";
		}
		// acceuil par défaut
		else{
					echo"
					<img id='imageProduits' src='images/produits.jpeg' alt='image produits'/>
					<form action='traitementConnexion.php' method='post'>
							<table>
								<tr>
									<td><label for='login'>login</label></td> <td><input class=coinsArrondis type='text' name='login' id='login' /><br/></td>
								</tr>
								<tr>
									<td><label for='mdp'>passe</label></td> <td><input class=coinsArrondis type='password' name='mdp'  id='mdp'/><br/></td>
								</tr>
								<tr>
									<td></td> <td><input type='button' value='envoyer' onclick='VerifierLogin(this.form)'/></br></td>
								</tr>
							</table>
						</form>
						";
		}
		?>
</div>

<script>
function VerifierLogin(formulaire){
  if (formulaire.login.value=="" || formulaire.mdp.value==""){
    alert ("Veuillez renseigner le login et le mdp !");
  }
	else{
    formulaire.submit();
  }
}

function destroySession(){
	var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
            location.href='index.php';
            }
        };
        xmlhttp.open("GET", "destroySession.php?", true);
        xmlhttp.send();
}
</script>
</body>
</html>
