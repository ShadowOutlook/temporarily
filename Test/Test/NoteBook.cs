using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.NetworkInformation;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace Test
{
    abstract class NoteBook
    {
        private DateTime _creationDate;

        public DateTime CreationDate
        {
            get
            {
                return _creationDate;
            }

            set
            {
                _creationDate = value;
            }
        }

        public abstract void ChangeCreationDate();

        public abstract void InfoOutput();

        public abstract void CreateNote();
    }

    class WorkNote : NoteBook
    {
        Validator validator = new Validator();

        private string _projectName;
        private string _taskDescription;
        private string _assignedTo;

        public string ProjectName
        {
            get
            {
                return _projectName;
            }

            set
            {
                _projectName = value;
            }
        }
        public string TaskDescription
        {
            get
            {
                return _taskDescription;
            }

            set
            {
                _taskDescription = value;
            }
        }
        public string AssignedTo
        {
            get
            {
                return _assignedTo;
            }

            set
            {
                _assignedTo = value;
            }
        }

        public override void ChangeCreationDate()
        {
            CreationDate = validator.CorrectDateTime(validator.GetInput($"Дата создания (предыдущая - {CreationDate.Date}): "));
        }

        public override void CreateNote()
        {
            CreationDate = DateTime.Now.Date;

            ProjectName = validator.Line(validator.GetInput("Название: "));

            TaskDescription = validator.Line(validator.GetInput("Описание: "));

            AssignedTo = validator.Line(validator.GetInput("Назначено: "));
        }

        public override void InfoOutput()
        {
            Console.WriteLine("\nРабота:" +
                              $"\n{new string(Convert.ToChar("-"), 64)}" +
                              $"\nНазвание: {ProjectName}" +
                              $"\nОписание: {TaskDescription}" +
                              $"\nНазначено: {AssignedTo}" +
                              $"\n"
                             );
        }
    }

    class HomeNote : NoteBook
    {
        Validator validator = new Validator();

        private string _taskType;
        private string _description;
        private string _assignedTo;

        public string TaskType
        {
            get
            {
                return _taskType;
            }

            set
            {
                _taskType = value;
            }
        }
        public string Description
        {
            get
            {
                return _description;
            }

            set
            {
                _description = value;
            }
        }
        public string AssignedTo
        {
            get
            {
                return _assignedTo;
            }

            set
            {
                _assignedTo = value;
            }
        }

        public override void ChangeCreationDate()
        {
            CreationDate = validator.CorrectDateTime(validator.GetInput($"Дата создания (предыдущая - {CreationDate.Date}): "));
        }

        public override void CreateNote()
        {
            CreationDate = DateTime.Now.Date;

            TaskType = validator.Line(validator.GetInput("Тип: "));

            Description = validator.Line(validator.GetInput("Описание: "));

            AssignedTo = validator.Line(validator.GetInput("Назначено: "));
        }

        public override void InfoOutput()
        {
            Console.WriteLine("\nДом:" +
                              $"\n{new string(Convert.ToChar("-"), 64)}" +
                              $"\nНазвание: {TaskType}" +
                              $"\nОписание: {Description}" +
                              $"\nНазначено: {AssignedTo}" +
                              $"\n"
                             );
        }
    }

    class HealthNote : NoteBook
    {
        Validator validator = new Validator();

        private string _appointmentType;
        private string _specialist;
        private string _description;

        public string AppointmentType
        {
            get
            {
                return _appointmentType;
            }

            set
            {
                _appointmentType = value;
            }
        }
        public string Specialist
        {
            get
            {
                return _specialist;
            }

            set
            {
                _specialist = value;
            }
        }
        public string Description
        {
            get
            {
                return _description;
            }

            set
            {
                _description = value;
            }
        }

        public override void ChangeCreationDate()
        {
            CreationDate = validator.CorrectDateTime(validator.GetInput($"Дата создания (предыдущая - {CreationDate.Date}): "));
        }

        public override void CreateNote()
        {
            CreationDate = DateTime.Now.Date;

            AppointmentType = validator.Line(validator.GetInput("Тип назначения: "));

            Specialist = validator.Line(validator.GetInput("Специалист: "));

            Description = validator.Line(validator.GetInput("Описание: "));
        }

        public override void InfoOutput()
        {
            Console.WriteLine("\nЗдоровье:" +
                              $"\n{new string(Convert.ToChar("-"), 64)}" +
                              $"\nТип назначения: {AppointmentType}" +
                              $"\nСпециалист: {Specialist}" +
                              $"\nОписание: {Description}" +
                              $"\n"
                             );
        }
    }
}
