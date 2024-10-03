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
            while (int.TryParse(value, out _) | string.IsNullOrEmpty(value) | value.Contains(" ") | !Regex.IsMatch(value, @"[а-яА-Я]"))
            {
                Console.Write("Введите верное значение!: ");

                value = Console.ReadLine();
            }

            return value;
        }

        public string Number(string value) // Проверка на введение числа
        {
            while (!int.TryParse(value, out _) | string.IsNullOrEmpty(value) | value.Contains(" ") | !Regex.IsMatch(value, @"[0-9]"))
            {
                Console.Write("Введите верное значение!: ");

                value = Console.ReadLine();
            }

            return value;
        }
    }
}
