DECLARE @constraint as sysname
SELECT @constraint = b.name FROM sys.all_columns a 
INNER JOIN
sys.default_constraints b
ON a.default_object_id = b.object_id
WHERE a.object_id = OBJECT_ID('MAGIC')
AND a.name = 'Etc'
IF (@constraint IS NOT NULL)
	EXEC('ALTER TABLE MAGIC DROP CONSTRAINT ' + @constraint)
GO
ALTER TABLE MAGIC ALTER COLUMN Etc smallint NOT NULL 
ALTER TABLE MAGIC ADD CONSTRAINT [DF_Etc] DEFAULT 0 FOR [Etc]
