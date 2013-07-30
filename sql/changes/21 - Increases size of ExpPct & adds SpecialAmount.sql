DECLARE @constraint as sysname
SELECT @constraint = b.name FROM sys.all_columns a 
INNER JOIN
sys.default_constraints b
ON a.default_object_id = b.object_id
WHERE a.object_id = OBJECT_ID('MAGIC_TYPE4')
AND a.name = 'ExpPct'
IF (@constraint IS NOT NULL)
	EXEC('ALTER TABLE MAGIC_TYPE4 DROP CONSTRAINT ' + @constraint)
GO
ALTER TABLE MAGIC_TYPE4 ALTER COLUMN ExpPct smallint NOT NULL 
ALTER TABLE MAGIC_TYPE4 ADD CONSTRAINT [DF_ExpPct] DEFAULT 0 FOR [ExpPct]
GO
ALTER TABLE MAGIC_TYPE4 ADD SpecialAmount smallint NOT NULL DEFAULT 0
GO
