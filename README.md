# Mini-Application de Gestion d'Événements

## Table des Matières
- [À propos du projet](#à-propos-du-projet)
- [Fonctionnalités](#fonctionnalités)
- [Pile Technologique](#pile-technologique)
- [Architecture](#architecture)
- [Schéma de Base de Données](#schéma-de-base-de-données)
- [Approche de Développement](#approche-de-développement)
- [Installation et Configuration](#installation-et-configuration)
- [Utilisation](#utilisation)
- [Documentation de l'API](#documentation-de-lapi)
- [Tests](#tests)
- [Déploiement](#déploiement)
- [Défis et Solutions](#défis-et-solutions)
- [Améliorations Futures](#améliorations-futures)
- [Contribuer](#contribuer)

---

## À propos du projet
Cette mini-application Ruby on Rails permet de gérer des événements.

---

## Fonctionnalités
- **CRUD des événements** : Création, lecture, mise à jour et suppression des événements.
- **Authentification utilisateur** avec Devise.
- **Accès sécurisé** : Seuls les utilisateurs authentifiés peuvent gérer leurs propres événements.
- **Visibilité des événements** : Tous les événements sont publics en lecture seule.
- **Pagination** : Affichage des événements par lot de 10.
- **API REST** :
  - `GET /api/events` : Liste des événements paginée.
  - `POST /api/events` : Création d’un événement (authentifié).
  - `PUT /api/events/:id` : Modification d’un événement (authentifié et propriétaire).
  - `DELETE /api/events/:id` : Suppression d’un événement (authentifié et propriétaire).
- **Authentification par token (JWT)** pour l'API.
- **Optimisation des requêtes** avec Bullet pour détecter les N+1 queries.
- **Indexation des clés étrangères** pour améliorer les performances.

---

## Pile Technologique
- **Framework** : Ruby on Rails
- **Base de données** : PostgreSQL
- **Authentification** : Devise et JWT (via `jwt` gem)
- **Front-end** : ERB avec Tailwind CSS pour le style
- **API** : RESTful
- **Outils d'optimisation** : Bullet pour la détection des N+1 queries
- **Pagination** : Utilisation de `kaminari`
- **Tests** : RSpec pour les tests unitaires et d'intégration

---

## Architecture
L'application suit l'architecture MVC classique de Ruby on Rails :
- **Modèles** : User, Event
- **Vues** : ERB pour l'interface utilisateur
- **Contrôleurs** : Gestion des actions CRUD et des endpoints API

---

## Schéma de Base de Données

---

## Approche de Développement

---

## Installation et Configuration

### Prérequis
Assurez-vous d'avoir les éléments suivants installés sur votre machine :
- **Ruby** version 3.x
- **Rails** version 7.x
- **PostgreSQL** version 14.x
- **Node.js** et **Yarn** pour la gestion des assets

### Étapes d'installation

1. **Clonez le dépôt**
   ```bash
   git clone <URL_DU_REPO>
   cd <NOM_DU_REPO>
   ```

2. **Installez les dépendances**
   ```bash
   bundle install
   yarn install
   ```

3. **Configuration de la base de données**
   - Créez un fichier `config/database.yml` en vous basant sur le fichier `config/database.example.yml`.
   - Mettez à jour les informations de connexion à PostgreSQL (nom d'utilisateur, mot de passe, nom de la base).

4. **Initialisez la base de données**
   ```bash
   rails db:create
   rails db:migrate
   rails db:seed
   ```

5. **Configuration des variables d'environnement**
   - Créez un fichier `.env` à la racine du projet.
   - Ajoutez les clés suivantes :
     ```env
     DATABASE_USERNAME=<votre_nom_utilisateur_pg>
     DATABASE_PASSWORD=<votre_mot_de_passe_pg>
     JWT_SECRET_KEY=<votre_cle_secrete_jwt>
     ```

6. **Lancez le serveur**
   ```bash
   rails s
   ```

7. **Accédez à l'application**
   Ouvrez votre navigateur et rendez-vous sur : `http://localhost:3000`

### Commandes Utiles
- **Lancer les tests** :
  ```bash
  rspec
  ```
- **Vérifier les erreurs N+1 avec Bullet** :
  Bullet est déjà configuré en mode développement pour alerter en cas de requêtes N+1.

### Notes
- Cette application utilise Devise pour l'authentification et JWT pour les API.
- Assurez-vous que PostgreSQL est en cours d'exécution avant de démarrer l'application.

---

## Utilisation

---

## Documentation de l'API : Endpoints de l'API

### Events
- **POST** `/api/v1/events` : Créer un nouvel événement.
- **GET** `/api/v1/events` : Récupérer la liste des événements (paginée).
- **GET** `/api/v1/events/:id` : Récupérer les détails d'un événement spécifique.
- **PUT** `/api/v1/events/:id` : Mettre à jour un événement (authentifié et propriétaire).
- **DELETE** `/api/v1/events/:id` : Supprimer un événement (authentifié et propriétaire).

### Users
- **POST** `/api/v1/auth/login` : Authentification et génération de JWT.
- **POST** `/api/v1/users` : Créer un nouvel utilisateur.
- **GET** `/api/v1/users` : Récupérer la liste des utilisateurs.
- **GET** `/api/v1/users/:id` : Récupérer les détails d'un utilisateur spécifique.
- **PUT** `/api/v1/users/:id` : Mettre à jour un utilisateur (authentifié et propriétaire).
- **DELETE** `/api/v1/users/:id` : Supprimer un utilisateur (authentifié et propriétaire).

---

## Défis et Solutions

---

## Améliorations Futures

---

