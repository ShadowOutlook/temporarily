USE IAb221_SabirovU;

INSERT INTO [Group] (GroupName) VALUES ('ИАб-221'), ('ИАб-231');

INSERT INTO Discipline (DisciplineName, CountOfHours) VALUES ('Математика', 120), ('Физика', 100);

INSERT INTO Teacher (TeacherSurname, TeacherName, TeacherPatronymic) VALUES ('Иванов', 'Иван', 'Иванович'), ('Сидоров', 'Петр', 'Петрович');

INSERT INTO Student (StudentSurname, StudentName, StudentPatronymic, DateOfBirth, HomeAdress, Email, DateOfAdmissionToUniversity, School, GroupId)
VALUES
('Смирнов', 'Алексей', 'Петрович', '2004-05-15', 'ул. Пушкина д.1', 'student1@kuzstu.ru', '2022-09-01', 'Школа №1', 1),
('Кузнецова', 'Мария', 'Игоревна', '2006-03-20', 'ул. Ленина д.2', 'student2@kuzstu.ru', '2023-09-01', 'Школа №5', 2);

INSERT INTO Award (AwardName) VALUES ('Лучший студент'), ('Отличник');

INSERT INTO Grade (GradeName) VALUES ('Отлично'), ('Хорошо'), ('Удовлетворительно'), ('Неудовлетворительно');

INSERT INTO TeacherDisciplineGroup (TeacherId, DisciplineId, GroupId) VALUES (1, 1, 1), (2, 2, 2);

INSERT INTO AwardStudent (AwardId, StudentId, DateOfDelivery, PlaceOfDelivery) VALUES (1, 1, '2023-06-15', 'Университет'), (2, 2, '2023-06-20', 'Университет');

INSERT INTO Performance (DisciplineId, TeacherId, StudentId, GradeId, DateGrade) VALUES (1, 1, 1, 1, '2022-11-07'), (2, 2, 2, 2, '2023-10-20');

INSERT INTO Hobbies (HobbieName) VALUES ('Чтение'), ('Рисование'), ('Бодибилдинг'), ('Танцы');

INSERT INTO HobbieStudent (HobbieId, StudentId) VALUES (1, 1), (2, 2), (3, 2), (4, 2);

