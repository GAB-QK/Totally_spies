-- Création de la table des usines
CREATE TABLE factories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Insertion des usines
INSERT INTO factories (name) VALUES ('Société mère'), ('Usine rachetée');

-- Création de la table des employés
CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    lastname VARCHAR(50),
    firstname VARCHAR(50),
    age INTEGER,
    start_date DATE,
    end_date DATE,
    is_present BOOLEAN,
    factory_id INTEGER REFERENCES factories(id)
);

-- Création de la table des fournisseurs
CREATE TABLE suppliers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100)
);

-- Création de la table des livraisons
CREATE TABLE deliveries (
    id SERIAL PRIMARY KEY,
    supplier_id INTEGER REFERENCES suppliers(id),
    factory_id INTEGER REFERENCES factories(id),
    delivery_date DATE,
    quantity INTEGER,
    received_by INTEGER REFERENCES employees(id)
);

-- Création de la table de production des robots
CREATE TABLE robots (
    id SERIAL PRIMARY KEY,
    factory_id INTEGER REFERENCES factories(id),
    production_date DATE,
    quantity INTEGER,
    parts_used INTEGER
);

-- Création de la table d'audit des robots
CREATE TABLE audit_robot (
    robot_id INTEGER,
    audit_date DATE
);