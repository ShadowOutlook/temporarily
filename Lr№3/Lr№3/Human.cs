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

        public static List<string> operator +(List<string> surnames, Human h)
        {
            surnames.Add(h.Surname);

            return surnames;
        }

        public static int operator -(Human h1, Human h2)
        {
            return h1.BirthYear - h2.BirthYear;
        }

        public static bool operator ==(Human h1, Human h2)
        {
            if (ReferenceEquals(h1, null) || ReferenceEquals(h2, null))
            {
                return false;
            }

            return h1.Surname == h2.Surname;
        }

        public static bool operator !=(Human h1, Human h2)
        {
            return !(h1 == h2);
        }

        public override bool Equals(object obj)
        {
            if (obj == null || !(obj is Human))
            {
                return false;
            }

            return Surname == ((Human)obj).Surname;
        }

        public override int GetHashCode()
        {
            return Surname.GetHashCode();
        }

        public static bool operator !=(int birthYear, Human h2)
        {
            return birthYear == h2.BirthYear;
        }

        public static bool operator ==(int birthYear, Human h2)
        {
            return !(birthYear == h2.BirthYear);
        }
    }
}
