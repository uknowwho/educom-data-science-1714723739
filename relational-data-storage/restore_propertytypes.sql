-- Set missing property_typeIDs in properties column
UPDATE mhl_detaildefs SET properties = '38' WHERE (id = '30');
UPDATE mhl_detaildefs SET properties = '103' WHERE (id = '31');
UPDATE mhl_detaildefs SET properties = '63' WHERE (id = '32');

DROP TABLE IF EXISTS mhl_detaildefs_propertytypes;

CREATE TABLE mhl_detaildefs_propertytypes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    propertytype_ID INT,
    detaildef_ID INT
);

DROP PROCEDURE IF EXISTS InsertPropertyTypes;

DELIMITER $$

CREATE PROCEDURE InsertPropertyTypes()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE detaildef_ID INT;
    DECLARE props TEXT;
    DECLARE prop_value TEXT;
    DECLARE comma_pos INT;

    -- Cursor to loop through detaildefs table
    DECLARE cur CURSOR FOR 
        SELECT id, properties FROM mhl_detaildefs WHERE properties IS NOT NULL;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO detaildef_ID, props;
        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Loop through comma-separated values
        WHILE LENGTH(props) > 0 DO
            SET comma_pos = INSTR(props, ',');

            IF comma_pos > 0 THEN
                SET prop_value = TRIM(SUBSTRING(props, 1, comma_pos - 1));
                SET props = SUBSTRING(props, comma_pos + 1);
            ELSE
                SET prop_value = TRIM(props);
                SET props = '';
            END IF;

            -- Insert into pivot table
            INSERT INTO mhl_detaildefs_propertytypes (propertytype_ID, detaildef_ID)
            VALUES (CAST(prop_value AS UNSIGNED), detaildef_ID);
        END WHILE;
    END LOOP;

    CLOSE cur;
END$$

DELIMITER ;

CALL InsertPropertyTypes();

ALTER TABLE mhl_detaildefs DROP properties;
ALTER TABLE mhl_detaildefs DROP propertytype_ID;
ALTER TABLE mhl_detaildefs DROP property_DEF;
