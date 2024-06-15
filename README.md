# SAÉ 4.01

Pour cette partie de la saé 4.01, vous allez devoir implémenter certaines fonctionnalités que vous avez proposé dans votre rapport d'audit.

## Rappel de ce que nous avions proposé :

Fonctionnalité d'Historique de Position des Outils sur le Site de Localisation pour Ateliers

## Voici comment nous avons fonctionné :

Pour stocker l'historique des positions des objets, nous avons ajouté une nouvelle table position_history avec les colonnes suivantes :

id : Identifiant unique, clé primaire
object_id : Identifiant de l'objet suivi, clé étrangère référencée à la table objects
x : Coordonnée x de la position
y : Coordonnée y de la position
plan : Chemin du fichier plan de l'image
timestamp : Date et heure de l'enregistrement

Ensuite nous avons construit les pages :
  - record_position.php : pour enregistrer les changements des positions des outils
  - position_history.php : pour créer la classe qui va intéragir avec notre nouvelle table
  - get_position_history : pour récupérer les historiques des positions

Nous avons aussi modifier plan.js pour y ajouter la fonction recordPositionChange.

Afin de pouvoir afficher les positions sur notre site nous avons créer la page position_history.html et en parallèle son script dans position_history.js

## Conclusion

Nous avons essayer de compléter notre nouvelle table manuellement mais nous n'arrivons pas a afficher le plan avec les différentes positions sur notre page html.
