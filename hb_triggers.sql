-- Trigger pour intercepter les tentatives d'insertion dans la vue ALL_WORKERS_ELAPSED
CREATE OR REPLACE FUNCTION trg_insert_all_workers_elapsed()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        INSERT INTO employees (lastname, firstname, age, start_date, is_present)
        VALUES (NEW.lastname, NEW.firstname, NEW.age, NEW.start_date, TRUE);
        RETURN NEW;
    ELSIF TG_OP = 'UPDATE' OR TG_OP = 'DELETE' THEN
        RAISE EXCEPTION 'Operation not allowed on view ALL_WORKERS_ELAPSED';
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_all_workers_elapsed
INSTEAD OF INSERT OR UPDATE OR DELETE ON ALL_WORKERS_ELAPSED
FOR EACH ROW
EXECUTE FUNCTION trg_insert_all_workers_elapsed();

-- Trigger pour enregistrer la date d'ajout du robot dans la table AUDIT_ROBOT
CREATE OR REPLACE FUNCTION trg_insert_robot_audit()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO audit_robot (robot_id, audit_date)
    VALUES (NEW.id, CURRENT_DATE);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_robot_audit
AFTER INSERT ON robots
FOR EACH ROW
EXECUTE FUNCTION trg_insert_robot_audit();

-- Trigger pour empêcher la modification de données via la vue ROBOTS_FACTORIES
CREATE OR REPLACE FUNCTION trg_prevent_modify_robots_factories()
RETURNS TRIGGER AS $$
DECLARE
    factory_count INTEGER;
    worker_table_count INTEGER;
BEGIN
    -- Compter le nombre d'usines
    SELECT COUNT(*) INTO factory_count FROM factories;

    -- Compter le nombre de tables respectant le format WORKERS_FACTORY_<N>
    SELECT COUNT(*) INTO worker_table_count
    FROM information_schema.tables
    WHERE table_name LIKE 'workers_factory_%';

    -- Vérifier si les comptes sont égaux
    IF factory_count != worker_table_count THEN
        RAISE EXCEPTION 'Modification not allowed on view ROBOTS_FACTORIES due to mismatch in factory tables';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_prevent_modify_robots_factories
INSTEAD OF INSERT OR UPDATE OR DELETE ON ROBOTS_FACTORIES
FOR EACH ROW
EXECUTE FUNCTION trg_prevent_modify_robots_factories();