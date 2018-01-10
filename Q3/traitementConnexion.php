<?php

//dsn
  $dsn = 'mysql:host=127.0.0.1;dbname=tp';
	$user = 'root';
	$password = '';
//connexion bdd
  try{
    $bdd = new PDO($dsn,$user,$password);

//requete SELECT
	 $queryStatement = $bdd->prepare('SELECT * FROM client WHERE  login=:login and mdp=:mdp');
	 $queryStatement->execute(
                  array(
                    		'login' =>$_POST['login'],
                        'mdp' => $_POST['mdp']
            		        )
          );

// si le client existe en BDD
		if(($queryStatement->fetch())){
       header('Location: operationsClient.php');
		}
    else{
      echo "ne marche pas";
    }

    $reponse->closeCursor();
  }
  catch(Exception $e)
  {
  die('Erreur de connexion : '.$e->getMessage());
  }

?>
