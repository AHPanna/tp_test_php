<?php
session_start();

?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="style.css"/>
	<title>produits de beauté</title>
</head>
<body>
  
  <div id="div_operations_client">
  <label><?php echo  $_SESSION['prenom'].' '.$_SESSION['nom'];?> </label>
  				<label>Opération(s):</label>
  				<select name="list_operations_client" id="listes_operation_client">
            <option></option>
  					<option>consulter</option>
  					<option>commander</option>
  				</select>
  </div>



  

  <script>
  
  // Objet de la liste déroulante
    var operation = document.getElementById('listes_operation_client');

  // Ajout  évenement change à l'élèment list déroulante
    operation.addEventListener('change', function() {
  // redirection en fonction de l'operation client
   switch(operation.options[operation.selectedIndex].innerHTML){
       		case 'consulter'			:
                                document.location.href="./historique.php";
                               
       													break;
          case 'commander'			:
                                document.location.href="./commande.php";
                                
        	 											break;
        }

    }, true);
  </script>
</body>
<?php

?>
</html>
