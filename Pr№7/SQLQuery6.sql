SELECT YEAR(DateOfAdmissionToUniversity) AS ��������������, COUNT(*) AS �������������������
FROM Student
GROUP BY YEAR(DateOfAdmissionToUniversity)
HAVING COUNT(*) < 1000;