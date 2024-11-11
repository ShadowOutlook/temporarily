SELECT a.AwardName, s.StudentSurname, s.StudentName, ast.DateOfDelivery, ast.PlaceOfDelivery
FROM AwardStudent ast
JOIN Award a ON ast.AwardId = a.AwardId
JOIN Student s ON ast.StudentId = s.StudentId
WHERE CONVERT(DATE, ast.DateOfDelivery) = CONVERT(DATE, GETDATE());