== README

# Le projet

#Pré-requis

`sudo apt-get install imagemagick libmagickwand-dev`

# Déploiement : sur Gandi

A tester sur :

# Installation

Cloner le projet :

`git clone https://github.com/simplonco/phoenix.git`

Installer les gems :

`bundle install`

## Paramétrez la base de donnée Postgresql :

Création d'un utilisateur pour la BDD

`sudo su postgres`

`psql`

`create role phoenix with createdb login password 'the_phoenix';`

Pour afficher la liste des utilisateurs `\dgh`

`Crtl + D` deux fois pour sortir.

- Renommer le fichier `.envsample` en fichier `.env`


## Initialisation de la base de données :

`bundle exec rake db:create`

`bundle exec rake db:migrate`

`rake db:seed` pour remplir la base de données (optionnel)


## Lancement du serveur :

`rails s`

## Pour lancer les tests :

bundle exec rake test
