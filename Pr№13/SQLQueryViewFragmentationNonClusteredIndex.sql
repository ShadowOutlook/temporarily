SELECT
	OBJECT_NAME(i.object_id) AS TableName,
	i.name AS IndexName,
	ips.index_id,
	ips.avg_fragmentation_in_percent,
	ips.page_count
FROM sys.dm_db_index_physical_stats(
	DB_ID('IAb221_SabirovU'),
	OBJECT_ID('Student'),
	NULL,
	NULL,
	'DETAILED'
) ips
	INNER JOIN sys.indexes i ON ips.object_id = i.object_id AND ips.index_id = i.index_id
WHERE i.name = 'IX_StudentSecondName';

SELECT
	OBJECT_NAME(i.object_id) AS TableName,
	i.name AS IndexName,
	ips.index_id,
	ips.avg_fragmentation_in_precent,
	ips.page_count
FROM sys.dm_db_index_physical_stats(
	DB_ID('IAb221_SabirovU'),
	OBJECT_ID('Performance'),
	NULL,
	NULL,
	'DETAILS'
)ips
	INNER JOIN sys.indexes i ON ips.object_id = i.object_id AND ips.index_id = i.index_id
WHERE i.name = 'IX_DateGrade';