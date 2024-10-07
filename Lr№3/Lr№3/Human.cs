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
        private int _birthYear;

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
                _oneGender = _gender[Convert.ToInt32(value)];
            }
        }

        public int BirthYear
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

        public Human(string surname, int oneGender, int birthYear) // Конструктор для простого создания экземпляра класса с конкретными передаваемыми значениями
        {
            Surname = surname;
            OneGender = Convert.ToString(oneGender);
            BirthYear = birthYear;
        }

        public static Human Create (string surname, int oneGender, int birthYear)  // Создание нового экземпляра класса по желанию пользователя
        {
            return new Human(surname, oneGender, birthYear);
        }

        public static Human operator ++(Human h)
        {
            ++h.BirthYear;
            return h;
        }

        public static Human operator --(Human h)
        {
            --h.BirthYear;
            return h;
        }
    }
}
