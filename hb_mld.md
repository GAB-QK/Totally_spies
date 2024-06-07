# Modèle Logique des Données (MLD)

## Table: factories
| Colonne      | Type         | Contraintes |
| ------------ | ------------ | ----------- |
| id_factories | SERIAL       | PRIMARY KEY |
| name         | VARCHAR(100) | NOT NULL    |

## Table: employees
| Colonne                | Type        | Contraintes              |
| ---------------------- | ----------- | ------------------------ |
|  id_employees          | SERIAL      | PRIMARY KEY              |
| lastname               | VARCHAR(50) |                          |
| firstname              | VARCHAR(50) |                          |
| age                    | INTEGER     |                          |
| start_date             | DATE        |                          |
| end_date               | DATE        |                          |
| is_present             | BOOLEAN     |                          |
| factory_id             | INTEGER     | REFERENCES factories(id) |

## Table: suppliers
| Colonne      | Type         | Contraintes |
| ------------ | ------------ | ----------- |
| id_suppliers | SERIAL       | PRIMARY KEY |
| name         | VARCHAR(100) |             |

## Table: deliveries
| Colonne       | Type    | Contraintes              |
| ------------- | ------- | ------------------------ |
| id_deliveries | SERIAL  | PRIMARY KEY              |
| supplier_id   | INTEGER | REFERENCES suppliers(id) |
| factory_id    | INTEGER | REFERENCES factories(id) |
| delivery_date | DATE    |                          |
| quantity      | INTEGER |                          |
| received_by   | INTEGER | REFERENCES employees(id) |
## Table: stock

| Colonne     | Type    | Contraintes              |
| ----------- | ------- | ------------------------ |
| id_stock    | SERIAL  | PRIMARY KEY              |
| factory_id  | INTEGER | REFERENCES factories(id) |
| robot_id    | SERIAL  | REFERENCES robots(id)    |
| quantity    | INTEGER |                          |
| last_update | DATE    |                          |

## Table: robots
| Colonne         | Type    | Contraintes              |
| --------------- | ------- | ------------------------ |
| id_robots       | SERIAL  | PRIMARY KEY              |
| factory_id      | INTEGER | REFERENCES factories(id) |
| production_date | DATE    |                          |
| quantity        | INTEGER |                          |
| parts_used      | INTEGER |                          |

## Table: audit_robot
| Colonne    | Type    | Contraintes |
| ---------- | ------- | ----------- |
| robot_id   | INTEGER |             |
| audit_date | DATE    |             |
|            |         |             |
