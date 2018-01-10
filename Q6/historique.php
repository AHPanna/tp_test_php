<?php
//session

session_start();



//dsn
  $dsn = 'mysql:host=127.0.0.1;dbname=tp';
	$user = 'root';
	$password = '';
//connexion bdd
  try{
    $bdd = new PDO($dsn, $user, $password);

 //requete SELECT
 	  $queryStatement1 = $bdd->prepare('SELECT article.nom,article.prix,comporter.quantite,commande.dateCommande from client 
                        INNER JOIN commande ON numeroClient=client_numeroClient
                        INNER join comporter ON numeroCommande=commande_numeroCommande
                        inner join article on numeroArticle=article_numeroArticle
                        where login=:login;'
                                  );

 	 $queryStatement1->execute(array('login' => $_POST['login']));



// affichage de l'historique des achats d'un client
echo "<!DOCTYPE html>";
echo "<html>";
echo "<head>";
echo "<meta charset='UTF-8'>";
echo "<link rel='stylesheet' href='style.css'/>";
echo "<title>Hygiène et Beauté</title>";
echo "</head>";
echo "<body>";
echo "<table id='historique'>";
// affichage personnalisé à compléter
echo "<h1>............. </h1>";
echo "<tr>
        <th>nom article</th>
        <th> prix</th>
        <th> quantité</th>
        <th> date</th>
      </tr>";
      echo "before getting data!!";
		while($row = $queryStatement1->fetch()){
      if($row){
        echo "<tr>";
        // affichage commande à compléter
        
    $row['article.nom'];
		$row['article.prix'];
    $row['comporter.quantite'];
    $row['commande.dateCommande'];
        echo "</tr>";
      }
      else{
        echo "vous n'avez aucune commande.";
      }
		}
echo "</table>";
echo "</body>";

$queryStatement1->closeCursor();
  }
  catch(Exception $e)
  {
  die('Erreur de connexion : '.$e->getMessage());
  }

?>
