ALTER TABLE Student
ADD CONSTRAINT chk_DateOfAddmission CHECK (YEAR(DateOfAdmissionToUniversity) > 2000);