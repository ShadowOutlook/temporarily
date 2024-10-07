using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace Lr_3
{
    class Validator
    {
        public string Line(string value) // Проверка на введение строки
        {
            while (int.TryParse(value, out _) || string.IsNullOrEmpty(value) || value.Contains(" ") || !Regex.IsMatch(value, @"[а-яА-Я]"))
            {
                Console.Write("Введите верное значение!: ");

                value = Console.ReadLine();
            }

            return value;
        }

        public string Number(string value) // Проверка на введение числа
        {
            while (!int.TryParse(value, out _) || string.IsNullOrEmpty(value) || value.Contains(" ") || !Regex.IsMatch(value, @"[0-9]"))
            {
                Console.Write("Введите верное значение!: ");

                value = Console.ReadLine();
            }

            return value;
        }

        public int Variant(string value, int min, int max) // Проверка на ввод из вариантов чисел
        {
            value = Number(value);

            while (Convert.ToInt32(value) < min || Convert.ToInt32(value) > max || value == "-0")
            {
                Console.Write("Введите верное значение!: ");

                value = Number(Console.ReadLine());
            }

            return Convert.ToInt32(value);
        }

        public int Year(string value, string thisYear) // Проверка на ввод года рождения в определенном диапазоне
        {
            value = Number(value);

            while (Convert.ToInt32(value) < 1945 || Convert.ToInt32(value) > Convert.ToInt32(thisYear))
            {
                Console.Write("Введите год рождения от 1945!, но не более значения текущего года: ");

                value = Number(Console.ReadLine());
            }

            return Convert.ToInt32(value);
        }
    }
}
