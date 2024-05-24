-- Création de la table des usines
CREATE TABLE factories (
    id_factories INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Insertion des usines
INSERT INTO factories (name) VALUES ('Société mère'), ('Usine rachetée');

-- Création de la table des employés
CREATE TABLE employees (
    id_employees INT AUTO_INCREMENT PRIMARY KEY,
    lastname VARCHAR(50),
    firstname VARCHAR(50),
    age INT,
    start_date DATE,
    end_date DATE,
    is_present BOOLEAN,
    factory_id INT,
    FOREIGN KEY (factory_id) REFERENCES factories(id_factories)
);

-- Création de la table des fournisseurs
CREATE TABLE suppliers (
    id_suppliers INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100)
);

-- Création de la table des livraisons
CREATE TABLE deliveries (
    id_deliveries INT AUTO_INCREMENT PRIMARY KEY,
    supplier_id INT,
    factory_id INT,
    delivery_date DATE,
    quantity INT,
    received_by INT,
    FOREIGN KEY (supplier_id) REFERENCES suppliers(id_suppliers),
    FOREIGN KEY (factory_id) REFERENCES factories(id_factories),
    FOREIGN KEY (received_by) REFERENCES employees(id_employees)
);

-- Création de la table de production des robots
CREATE TABLE robots (
    id_robots INT AUTO_INCREMENT PRIMARY KEY,
    factory_id INT,
    production_date DATE,
    quantity INT,
    parts_used INT,
    FOREIGN KEY (factory_id) REFERENCES factories(id_factories)
);

-- Création de la table d'audit des robots
CREATE TABLE audit_robot (
    audit_robot_id INT,
    audit_date DATE
);

-- Création de la table stock
CREATE TABLE stock (
    id_stock INT AUTO_INCREMENT PRIMARY KEY,
    factory_id INT,
    robot_id INT,
    quantity INT,
    last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (factory_id) REFERENCES factories(id_factories),
    FOREIGN KEY (robot_id) REFERENCES robots(id_robots)
);
