-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

-- Generate and execute commands to drop foreign key constraints
SELECT CONCAT('ALTER TABLE `', TABLE_NAME, '` DROP FOREIGN KEY `', CONSTRAINT_NAME, '`;')
FROM information_schema.KEY_COLUMN_USAGE
WHERE CONSTRAINT_SCHEMA = DATABASE() AND REFERENCED_TABLE_NAME IS NOT NULL;

ALTER TABLE mhl_suppliers
ADD CONSTRAINT 
FOREIGN KEY (company) REFERENCES mhl_companies(id)
ON DELETE RESTRICT
ON UPDATE RESTRICT;

-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;
