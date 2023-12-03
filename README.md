# Gestion d'Hôtels et de Villes 

## Objectif

Ce projet vise à développer une application web de gestion d'hôtels et de villes en utilisant Enterprise JavaBeans (EJB). L'objectif principal est de démontrer l'efficacité de l'utilisation d'EJB pour la gestion des transactions et la logique métier dans le contexte d'une application d'entreprise.

## Technologies Utilisées

- **Java EE** : Plateforme d'exécution pour les applications Java entreprise.
- **Enterprise JavaBeans (EJB)** : Composants d'entreprise pour la gestion des transactions et la logique métier.
- **Java Persistence API (JPA)** : Spécification Java pour la gestion de la persistance des données.
- **Servlets** : Composants Java pour le développement côté serveur.
- **Base de données MySQL** : Système de gestion de base de données relationnelle.
- **HTML, CSS, JavaScript** : Technologies web standard.
- **WildFly** : Serveur d'application Java EE.

## Fonctionnalités

L'application offre les fonctionnalités suivantes :

- **Ajout d'un Hôtel** : Formulaire permettant d'ajouter un nouvel hôtel en saisissant le nom, l'adresse, le numéro de téléphone, et en sélectionnant une ville.
- **Liste des Hôtels** : Affichage d'une table présentant les détails de chaque hôtel, y compris l'identifiant, le nom, l'adresse, le numéro de téléphone, et la ville associée. Les fonctionnalités de suppression et de modification sont disponibles pour chaque hôtel.
- **Filtrage des Hôtels par Ville** : Possibilité de filtrer la liste des hôtels par ville.
- **Ajout d'une Ville** : Formulaire permettant d'ajouter une nouvelle ville en saisissant son nom.
- **Liste des Villes** : Affichage d'une table présentant les détails de chaque ville, y compris l'identifiant et le nom. Les fonctionnalités de suppression et de modification sont disponibles pour chaque ville.

## Structure du Projet EJB

Le projet EJB sera organisé comme suit :
Le projet est structuré de la manière suivante :

- 📁**`src/main/java`** : Contient les classes Java du projet.
- 📄**`src/main/resources`** : Ressources nécessaires au projet, comme les fichiers de configuration.
- 🌐**`src/main/WEB-INF`** : Contient les pages JSP, les fichiers CSS, JavaScript et les ressources web et les bibliothèques JAR nécessaires.
- 🧪**`src/test`** : Répertoire pour les tests unitaires.
## Illustrations 
# Conception
<img width="331" alt="image" src="https://github.com/killer-beep07/Gestion-EJB/assets/130712993/50d50df8-4aac-48c7-b891-a709e18f0d0f">

# Ville
<img width="960" alt="image" src="https://github.com/killer-beep07/Gestion-EJB/assets/130712993/665f5620-acf0-4856-9591-4803350a3d41">

# Ajout
<img width="960" alt="image" src="https://github.com/killer-beep07/Gestion-EJB/assets/130712993/076a8667-d8fb-474f-87fa-746a6a3cdf63">
<img width="947" alt="image" src="https://github.com/killer-beep07/Gestion-EJB/assets/130712993/0e9c3195-d2ab-4573-959b-a4abe5316a15">

# Suppression
<img width="945" alt="image" src="https://github.com/killer-beep07/Gestion-EJB/assets/130712993/af1a77c3-bdbe-40c8-b07f-4058d8c180e7">
<img width="957" alt="image" src="https://github.com/killer-beep07/Gestion-EJB/assets/130712993/ec1ee927-85bf-4750-9fa9-67ebe2a0385f">

# Modification
<img width="959" alt="image" src="https://github.com/killer-beep07/Gestion-EJB/assets/130712993/348830ea-cc39-4610-9a19-294f1609dcfa">
<img width="950" alt="image" src="https://github.com/killer-beep07/Gestion-EJB/assets/130712993/813a73f4-5a97-4ba9-a824-e6d383580079">
<img width="960" alt="image" src="https://github.com/killer-beep07/Gestion-EJB/assets/130712993/700413ca-71ef-4f8e-b0bd-9070847e25bb">


# Hotel

<img width="948" alt="image" src="https://github.com/killer-beep07/Gestion-EJB/assets/130712993/71b7595f-482b-4a83-8db3-ad5938dba5dc">


# Ajout
<img width="960" alt="image" src="https://github.com/killer-beep07/Gestion-EJB/assets/130712993/f5a564ec-2eaf-45a4-9705-7847736015ba">
<img width="945" alt="image" src="https://github.com/killer-beep07/Gestion-EJB/assets/130712993/455c7cbc-66a3-43b8-b0da-ad20b8cd2ba0">

# Suppression
<img width="948" alt="image" src="https://github.com/killer-beep07/Gestion-EJB/assets/130712993/18616266-b2f5-4fc1-bf01-8416378d5344">
<img width="960" alt="image" src="https://github.com/killer-beep07/Gestion-EJB/assets/130712993/ba67877a-28fe-405b-a4d7-a9f3f2482129">


# Modification
<img width="947" alt="image" src="https://github.com/killer-beep07/Gestion-EJB/assets/130712993/bea709a2-1795-448a-96c1-c6eee7bbf824">
<img width="960" alt="image" src="https://github.com/killer-beep07/Gestion-EJB/assets/130712993/f990cc4a-1b21-41ce-b6bd-a71a2fae338c">
<img width="958" alt="image" src="https://github.com/killer-beep07/Gestion-EJB/assets/130712993/e0151fd3-433e-4a6d-af3b-10603a30fb7b">
<img width="950" alt="image" src="https://github.com/killer-beep07/Gestion-EJB/assets/130712993/3c588177-1744-4065-a347-7cbac96ce9da">

# Filtrage
<img width="952" alt="image" src="https://github.com/killer-beep07/Gestion-EJB/assets/130712993/46afece0-ecf6-4985-a6a9-9297371de525">
<img width="947" alt="image" src="https://github.com/killer-beep07/Gestion-EJB/assets/130712993/ef778361-3560-49bb-b809-21f077ecf89a">



