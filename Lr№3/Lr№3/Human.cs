using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace Lr_3
{
    class Human
    {
        private string _surname;
        private string[] _gender = {"Женщина", "Мужчина"};
        private string _oneGender;
        private string _birthYear;

        Validator validator = new Validator();

        public string Surname // Свойство описывающее возможность либо чтения либо записи в поле surname или и того и другого
        {
            get 
            {
                return _surname;
            }

            set
            {
                _surname = value;
            }
        }

        public string OneGender
        {
            get
            {
                return _oneGender;
            }

            set
            {
                if (value == "1")
                {
                    _oneGender = _gender[1];
                }
                if (value == "0")
                {
                    _oneGender = _gender[0];
                }
            }
        }

        public string BirthYear
        {
            get
            {
                return _birthYear;
            }

            set
            {
                _birthYear = value;
            }
        }

        public Human(string surname, string oneGender, string birthYear) // Конструктор для простого создания экземпляра класса с конкретными передаваемыми значениями
        {
            Surname = surname;
            OneGender = oneGender;
            BirthYear = birthYear;
        }

        public static Human Create (string surname, string oneGender, string birthYear)  // Создание нового экземпляра класса по желанию пользователя
        {
            return new Human(surname, oneGender, birthYear);
        }
    }
}
