ALTER TABLE Performance
ADD GradeCharacteristic VARCHAR(50);


UPDATE Performance SET GradeCharacteristic = '����� �� �����' WHERE GradeId = 1;
UPDATE Performance SET GradeCharacteristic = '����������� ������' WHERE GradeId = 2;


SELECT DISTINCT p.StudentId, g.GradeName
FROM Performance p
JOIN Grade g ON p.GradeId = g.GradeId
WHERE p.GradeCharacteristic = '����� �� �����';