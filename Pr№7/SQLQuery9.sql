SELECT DateGrade, COUNT(*) AS КоличествоМероприятий
FROM Performance
GROUP BY DateGrade
HAVING COUNT(*) > 2;