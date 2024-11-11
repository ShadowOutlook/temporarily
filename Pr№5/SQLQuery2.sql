USE IAb221_SabirovU;

INSERT INTO [Group] (GroupName) VALUES ('���-221'), ('���-231');

INSERT INTO Discipline (DisciplineName, CountOfHours) VALUES ('����������', 120), ('������', 100);

INSERT INTO Teacher (TeacherSurname, TeacherName, TeacherPatronymic) VALUES ('������', '����', '��������'), ('�������', '����', '��������');

INSERT INTO Student (StudentSurname, StudentName, StudentPatronymic, DateOfBirth, HomeAdress, Email, DateOfAdmissionToUniversity, School, GroupId)
VALUES
('�������', '�������', '��������', '2004-05-15', '��. ������� �.1', 'student1@kuzstu.ru', '2022-09-01', '����� �1', 1),
('���������', '�����', '��������', '2006-03-20', '��. ������ �.2', 'student2@kuzstu.ru', '2023-09-01', '����� �5', 2);

INSERT INTO Award (AwardName) VALUES ('������ �������'), ('��������');

INSERT INTO Grade (GradeName) VALUES ('�������'), ('������'), ('�����������������'), ('�������������������');

INSERT INTO TeacherDisciplineGroup (TeacherId, DisciplineId, GroupId) VALUES (1, 1, 1), (2, 2, 2);

INSERT INTO AwardStudent (AwardId, StudentId, DateOfDelivery, PlaceOfDelivery) VALUES (1, 1, '2023-06-15', '�����������'), (2, 2, '2023-06-20', '�����������');

INSERT INTO Performance (DisciplineId, TeacherId, StudentId, GradeId, DateGrade) VALUES (1, 1, 1, 1, '2022-11-07'), (2, 2, 2, 2, '2023-10-20');

INSERT INTO Hobbies (HobbieName) VALUES ('������'), ('���������'), ('�����������'), ('�����');

INSERT INTO HobbieStudent (HobbieId, StudentId) VALUES (1, 1), (2, 2), (3, 2), (4, 2);

