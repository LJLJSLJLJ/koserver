DECLARE @constraint as sysname
SELECT @constraint = b.name FROM sys.all_columns a 
INNER JOIN
sys.default_constraints b
ON a.default_object_id = b.object_id
WHERE a.object_id = OBJECT_ID('USERDATA')
AND a.name = 'Exp'
IF (@constraint IS NOT NULL)
	EXEC('ALTER TABLE USERDATA DROP CONSTRAINT ' + @constraint)
GO
UPDATE USERDATA SET [Exp] = 0 WHERE [Exp] IS NULL
ALTER TABLE USERDATA ALTER COLUMN [Exp] bigint NOT NULL 
ALTER TABLE USERDATA ADD CONSTRAINT [DF_Exp] DEFAULT 0 FOR [Exp]
