SELECT DateGrade, COUNT(*) AS ���������������������
FROM Performance
GROUP BY DateGrade
HAVING COUNT(*) > 2;