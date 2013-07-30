IF (COL_LENGTH('ZONE_INFO', 'isAttackZone') IS NOT NULL)
BEGIN
	DECLARE @constraint as sysname
	SELECT @constraint = b.name FROM sys.all_columns a 
	INNER JOIN sys.default_constraints b ON a.default_object_id = b.object_id WHERE a.object_id = OBJECT_ID('ZONE_INFO')
	AND a.name = 'isAttackZone'
	IF (@constraint IS NOT NULL)
		EXEC('ALTER TABLE ZONE_INFO DROP CONSTRAINT ' + @constraint)
	ALTER TABLE ZONE_INFO DROP COLUMN isAttackZone
END
