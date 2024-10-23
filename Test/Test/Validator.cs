using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace Test
{
    class Validator
    {
        public string GetInput(string prompt) // Метод задания вопроса и получения на него ответа при вводе данных
        {
            Console.Write(prompt);
            return Console.ReadLine();
        }

        public string Line(string value) // Проверка на введение строки
        {
            while (int.TryParse(value, out _) || string.IsNullOrEmpty(value) || value.Contains(" ") || !Regex.IsMatch(value, @"[а-яА-Я]"))
            {
                Console.Write("Введите верное значение!: ");

                value = Console.ReadLine();
            }

            return value;
        }

        public DateTime CorrectDateTime(string value)
        {
            while (!DateTime.TryParseExact(value, "dd.MM.yyyy", null, System.Globalization.DateTimeStyles.None, out DateTime validDate))
            {
                value = Line(GetInput("Введите дату согласно формату dd.MM.yyyy: "));
            }

            return Convert.ToDateTime(value);
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
    }
}
