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
                _surname = validator.Line(value);

                if (_surname != value)
                {
                    _surname = validator.Line(value);
                }
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
                value = validator.Number(value);

                while (value != "0" | value != "1")
                {
                    Console.Write("Введите верное значение!: ");

                    value = validator.Number(value);
                }

                if (value == "1")
                {
                    _oneGender = _gender[1];
                }
                else
                {
                    _oneGender = _gender[0];
                }
            }
        }

        public string BirthYear // Свойство описывающее возможность либо чтения либо записи в поле birth_year или и того и другого
        {
            get
            {
                return _birthYear;
            }

            set
            {
                _birthYear = validator.Number(value);

                if (_birthYear != value)
                {
                    _birthYear = validator.Number(value);
                }
            }
        }

        public Human(string surname, string oneGender, string birthYear) // Конструктор для простого создания экземпляра класса с конкретными передаваемыми значениями
        {
            this._surname = surname;
            this._oneGender = oneGender;
            this._birthYear = birthYear;
        }

        public static Human Create (string surname, string oneGender, string birthYear)  // Создание нового экземпляра класса по желанию пользователя
        {
            return new Human(surname, oneGender, birthYear);
        }
    }
}
