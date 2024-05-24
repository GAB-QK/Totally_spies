-- Création de la vue ALL_WORKERS
CREATE VIEW ALL_WORKERS AS
SELECT 
    lastname,
    firstname,
    age,
    start_date
FROM 
    employees
WHERE 
    is_present = TRUE
ORDER BY 
    start_date DESC;

-- Création de la vue ALL_WORKERS_ELAPSED
CREATE VIEW ALL_WORKERS_ELAPSED AS
SELECT 
    lastname,
    firstname,
    age,
    start_date,
    CURRENT_DATE - start_date AS days_elapsed
FROM 
    ALL_WORKERS;

-- Création de la vue BEST_SUPPLIERS
CREATE VIEW BEST_SUPPLIERS AS
SELECT 
    suppliers.name AS supplier_name,
    SUM(deliveries.quantity) AS total_quantity
FROM 
    deliveries
JOIN 
    suppliers ON deliveries.supplier_id = suppliers.id
GROUP BY 
    suppliers.name
HAVING 
    SUM(deliveries.quantity) > 1000
ORDER BY 
    total_quantity DESC;

-- Création de la vue ROBOTS_FACTORIES
CREATE VIEW ROBOTS_FACTORIES AS
SELECT 
    robots.id AS robot_id,
    factories.name AS factory_name
FROM 
    robots
JOIN 
    factories ON robots.factory_id = factories.id;
