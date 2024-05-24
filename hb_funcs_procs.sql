-- Création des fonctions
CREATE FUNCTION get_nb_workers(factory_id INT) RETURNS INT
BEGIN
    DECLARE nb_workers INT;
    SELECT COUNT(*) INTO nb_workers FROM employees WHERE factory_id = factory_id AND end_date IS NULL;
    RETURN nb_workers;
END;

CREATE FUNCTION get_nb_big_robots() RETURNS INT
BEGIN
    DECLARE nb_big_robots INT;
    SELECT COUNT(*) INTO nb_big_robots FROM robots WHERE parts_used > 3;
    RETURN nb_big_robots;
END;

CREATE FUNCTION get_best_supplier() RETURNS VARCHAR(100)
BEGIN
    DECLARE best_supplier_name VARCHAR(100);
    SELECT name INTO best_supplier_name FROM best_suppliers LIMIT 1;
    RETURN best_supplier_name;
END;


-- Création des procédures
DELIMITER $$
CREATE PROCEDURE SEED_DATA_WORKERS(IN NB_WORKERS INT, IN FACTORY_ID INT)
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= NB_WORKERS DO
        INSERT INTO employees (firstname, lastname, start_date, factory_id, is_present)
        VALUES (CONCAT('worker_f_', i), CONCAT('worker_l_', i), 
                DATE_ADD('2065-01-01', INTERVAL FLOOR(RAND() * 2191) DAY),
                FACTORY_ID, TRUE);
        SET i = i + 1;
    END WHILE;
    COMMIT;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE ADD_NEW_ROBOT(IN id_robots INT)
BEGIN
    INSERT INTO robots (id_robots, factory_id, production_date, quantity, parts_used)
    SELECT id_robots, factory_id, CURRENT_DATE(), 1, 0
    FROM robots_factories
    LIMIT 1;
    COMMIT;
END$$
DELIMITER ;
