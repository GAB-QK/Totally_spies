-- Création des Triggers
CREATE OR REPLACE TRIGGER INSERT_ALL_WORKERS_ELAPSED
INSTEAD OF INSERT ON ALL_WORKERS_ELAPSED
FOR EACH ROW
BEGIN
    -- Insertion dans la table correcte
    INSERT INTO employees (lastname, firstname, age, start_date, factory_id, is_present)
    VALUES (:NEW.lastname, :NEW.firstname, :NEW.age, :NEW.start_date, :NEW.factory_id, TRUE);
END INSERT_ALL_WORKERS_ELAPSED;


CREATE OR REPLACE TRIGGER UPDATE_ALL_WORKERS_ELAPSED
BEFORE UPDATE ON ALL_WORKERS_ELAPSED
BEGIN
    -- Lève une erreur pour toute tentative de mise à jour
    RAISE_APPLICATION_ERROR(-20001, 'Mise à jour interdite sur la vue ALL_WORKERS_ELAPSED.');
END UPDATE_ALL_WORKERS_ELAPSED;


CREATE OR REPLACE TRIGGER DELETE_ALL_WORKERS_ELAPSED
BEFORE DELETE ON ALL_WORKERS_ELAPSED
BEGIN
    -- Lève une erreur pour toute tentative de suppression
    RAISE_APPLICATION_ERROR(-20002, 'Suppression interdite sur la vue ALL_WORKERS_ELAPSED.');
END DELETE_ALL_WORKERS_ELAPSED;


CREATE OR REPLACE TRIGGER NEW_ROBOT_AUDIT
AFTER INSERT ON robots
FOR EACH ROW
BEGIN
    INSERT INTO AUDIT_ROBOT (audit_robot_id, audit_date)
    VALUES (:NEW.id_robots, SYSDATE);
END NEW_ROBOT_AUDIT;
