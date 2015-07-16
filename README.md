== README

# Le projet

Le pack Phoenix est notre solution express pour vous fournir efficacement une présence sur le web. Reprenant un design simple et épuré de type "One page", il vous permet d'assembler trois à six visuels grand format de votre choix pour créer instantanément un site visuellement attractif et qui présente votre message.

Nous avons conçu ce système de manière totalement administrable pour que vous puissiez seul et à tout moment modifier les images et les textes qui composent votre site.

#Pré-requis

`sudo apt-get install imagemagick libmagickwand-dev`

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

- Renommer le fichier `.envsample` en fichier `.env` et insérer vos données.


## Initialisation de la base de données :

`bundle exec rake db:create`

`bundle exec rake db:migrate`

`rake db:seed` pour remplir la base de données (optionnel)


## Lancement du serveur :

`rails s`

## Pour lancer les tests :

bundle exec rake test

## Pour accéder au système d'administration :

Ajoutez `/admin` à l'url présente de la page web 
