SELECT * FROM sys.objects;
SELECT * FROM sys.tables;
SELECT * FROM sys.columns;
SELECT * FROM sys.database_principals;
SELECT * FROM sys.databases;
SELECT * FROM sys.database_files;

SELECT name AS ����������, modify_date AS �����������������������
FROM sys.objects
WHERE type = 'S';

SELECT name AS ����������, type AS ����������
FROM sys.objects
WHERE create_date BETWEEN '01.11.2024' AND '30.11.2024';

SELECT sys.columns.name AS ����������, sys.tables.name AS ����������
FROM sys.columns
				INNER JOIN sys.tables ON sys.columns.object_id = sys.tables.object_id
WHERE sys.columns.is_nullable = 0 AND sys.columns.name LIKE 'T%';

SELECT sys.database_principals.principal_id AS �����������������������, sys.database_principals.modify_date AS ���������������������������������
FROM sys.database_principals
WHERE sys.database_principals.type = 'S';

SELECT sys.databases.state AS ��������, COUNT(*) AS ������������
FROM sys.databases
GROUP BY state;

SELECT COUNT(*) AS ��������������������
FROM sys.objects
WHERE create_date BETWEEN '01.01.2024' AND '12.12.2024';