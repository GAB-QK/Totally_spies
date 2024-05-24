# Dictionnaire de Données

## Table: factories
| Champ        | Type          | Description                                   |
|--------------|---------------|-----------------------------------------------|
| id_factories | SERIAL        | Identifiant unique de l'usine (Primary Key)   |
| name         | VARCHAR(100)  | Nom de l'usine                                |

## Table: employees
| Champ        | Type          | Description                                   |
|--------------|---------------|-----------------------------------------------|
| id_employees | SERIAL        | Identifiant unique de l'employé (Primary Key) |
| lastname     | VARCHAR(50)   | Nom de famille de l'employé                   |
| firstname    | VARCHAR(50)   | Prénom de l'employé                           |
| age          | INTEGER       | Âge de l'employé                              |
| start_date   | DATE          | Date de début de l'emploi                     |
| end_date     | DATE          | Date de fin de l'emploi                       |
| is_present   | BOOLEAN       | Indicateur de présence de l'employé           |
| factory_id   | INTEGER       | Référence à l'identifiant de l'usine (Foreign Key) |

## Table: suppliers
| Champ        | Type          | Description                                   |
|--------------|---------------|-----------------------------------------------|
| id_suppliers | SERIAL        | Identifiant unique du fournisseur (Primary Key)|
| name         | VARCHAR(100)  | Nom du fournisseur                            |

## Table: deliveries
| Champ        | Type          | Description                                   |
|--------------|---------------|-----------------------------------------------|
| id_deliveries| SERIAL        | Identifiant unique de la livraison (Primary Key)|
| supplier_id  | INTEGER       | Référence à l'identifiant du fournisseur (Foreign Key) |
| factory_id   | INTEGER       | Référence à l'identifiant de l'usine (Foreign Key) |
| delivery_date| DATE          | Date de la livraison                          |
| quantity     | INTEGER       | Quantité de pièces livrées                    |
| received_by  | INTEGER       | Référence à l'identifiant de l'employé qui a reçu la livraison (Foreign Key) |

## Table: robots
| Champ          | Type          | Description                                   |
|----------------|---------------|-----------------------------------------------|
| id_robots      | SERIAL        | Identifiant unique du robot (Primary Key)     |
| factory_id     | INTEGER       | Référence à l'identifiant de l'usine (Foreign Key) |
| modelName      | VARCHAR(50)   | Nom du modèle de robot                        |
| production_date| DATE          | Date de production du robot                   |
| quantity       | INTEGER       | Quantité de robots produits                   |
| parts_used     | INTEGER       | Nombre de pièces utilisées                    |

## Table: audit_robot
| Champ          | Type          | Description                                   |
|----------------|---------------|-----------------------------------------------|
| audit_robot_id | INTEGER       | Identifiant unique de l'audit (Primary Key)   |
| audit_date     | DATE          | Date de l'audit                               |

## Table: stock
| Champ          | Type          | Description                                   |
|----------------|---------------|-----------------------------------------------|
| id_stock       | INT AUTO_INCREMENT | Identifiant unique du stock (Primary Key) |
| factory_id     | INT           | Référence à l'identifiant de l'usine (Foreign Key) |
| robot_id       | INT           | Référence à l'identifiant du robot (Foreign Key) |
| quantity       | INT           | Quantité de pièces en stock                   |
| last_update    | TIMESTAMP     | Dernière mise à jour                          |

## Vues

### Vue: all_workers
Affiche les informations de tous les employés présents dans les usines.

| Champ        | Type          | Description                                   |
|--------------|---------------|-----------------------------------------------|
| lastname     | VARCHAR(50)   | Nom de famille de l'employé                   |
| firstname    | VARCHAR(50)   | Prénom de l'employé                           |
| age          | INTEGER       | Âge de l'employé                              |
| start_date   | DATE          | Date de début de l'emploi                     |

### Vue: ALL_WORKERS_ELAPSED
Affiche le nombre de jours écoulés depuis l'arrivée de chaque employé.

| Champ        | Type          | Description                                   |
|--------------|---------------|-----------------------------------------------|
| lastname     | VARCHAR(50)   | Nom de famille de l'employé                   |
| firstname    | VARCHAR(50)   | Prénom de l'employé                           |
| age          | INTEGER       | Âge de l'employé                              |
| start_date   | DATE          | Date de début de l'emploi                     |
| days_elapsed | INTEGER       | Nombre de jours écoulés depuis l'arrivée      |

### Vue: best_suppliers
Affiche les fournisseurs ayant livré plus de 1000 pièces.

| Champ          | Type          | Description                                   |
|----------------|---------------|-----------------------------------------------|
| name           | VARCHAR(100)  | Nom du fournisseur                            |
| total_quantity | INTEGER       | Quantité totale de pièces livrées             |

### Vue: robots_factories
Affiche les usines ayant assemblé chaque robot.

| Champ          | Type          | Description                                   |
|----------------|---------------|-----------------------------------------------|
| factory_id     | INTEGER       | Référence à l'identifiant de l'usine (Foreign Key) |
| id_robots      | INTEGER       | Identifiant unique du robot (Primary Key)     |
| production_date| DATE          | Date de production du robot                   |
