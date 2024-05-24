-- Création de la vue all_workers
CREATE VIEW all_workers AS
SELECT
    lastname,
    firstname,
    age,
    start_date
FROM
    employees
WHERE
    end_date IS NULL
ORDER BY
    start_date DESC;

-- Création de la vue ALL_WORKERS_ELAPSED
CREATE VIEW ALL_WORKERS_ELAPSED AS
SELECT 
    lastname, 
    firstname, 
    age, 
    start_date, 
    DATEDIFF(CURRENT_DATE(), start_date) AS days_elapsed
FROM all_workers;

-- Création de la vue best_suppliers
CREATE VIEW best_suppliers AS
SELECT
    suppliers.name,
    SUM(deliveries.quantity) AS total_quantity
FROM
    suppliers
JOIN
    deliveries ON suppliers.id_suppliers = deliveries.supplier_id
GROUP BY
    suppliers.name
HAVING
    SUM(deliveries.quantity) > 1000
ORDER BY
    total_quantity DESC;

-- Création de la vue robots_factories
CREATE VIEW robots_factories AS
SELECT
    factory_id,
    id_robots,
    production_date
FROM
    robots;
