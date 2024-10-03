using System;
using System.Collections.Generic;
using System.Diagnostics.Eventing.Reader;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Runtime.Remoting.Metadata.W3cXsd2001;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace Lr_3
{
    internal class Program
    {
        private Dictionary<int, Human> Persons = new Dictionary<int, Human>();

        Validator validator = new Validator();

        private int index = 0;

        bool continueLoop = true;

        string choise;

        static void Main(string[] args)
        {
            Program program = new Program();
            Validator validator = new Validator();

            while (program.continueLoop)
            {
                Console.WriteLine("Желаете ли вы создать нового пользователя?");
                Console.Write("Для ответа введите да или нет: ");

                program.choise = validator.Line(Console.ReadLine());

                if (program.choise.ToLower() == "да")
                {
                    DateTime currentDate = DateTime.Now;

                    string thisYear = Convert.ToString(currentDate.Year);

                    program.CreateNewPerson();
                }
                else if (program.choise.ToLower() == "нет")
                {
                    Console.WriteLine("\nЗавершение работы программы!");

                    program.continueLoop = false;
                }

                while (program.choise.ToLower() != "да" | program.choise.ToLower() != "нет")
                {
                    Console.Write("Введите верное значение!: ");

                    program.choise = validator.Line(Console.ReadLine());
                }
            }
            if (!program.continueLoop)
            {
                program.continueLoop = true;
                program.choise = null;
            }
        }

        public void CreateNewPerson()
        {
            string surname;
            string gender;
            string birthYear;
            
            Console.Write("Введите свою фамилию: ");

            surname = Console.ReadLine();

            Console.Write("Введите свой пол в виде числа: 1 - мужчина, 0 - женщина: ");

            gender = Console.ReadLine();

            Console.Write("Введите свой год рождения: ");

            birthYear = Console.ReadLine();

            Human human = Human.Create(surname, gender, birthYear);

            while(continueLoop)
            {
                Console.WriteLine($"Убедитесь в правильности введенных вами значений:\nФамилия: {human.Surname}\nПол: {human.OneGender}\nГод рождения: {human.BirthYear}");
                Console.Write("Введите 'да' если все правильно или 'нет' в противном случае: ");

                choise = validator.Line(Console.ReadLine());

                if (choise.ToLower() == "да") // Правильный ввод => вопрос о сохранении
                {
                    choise = null;

                    Console.Write("Хотите ли вы сохранить данного пользователя?: ");

                    choise = validator.Line(Console.ReadLine());

                    if (choise.ToLower() == "да") // Хотим сохранить => сохраняем в словаре и прекращаем цикл с вопросом о правильности введенных данных
                    {
                        choise = null;

                        Persons.Add(index, human);

                        index++;
                    }

                    while (choise.ToLower() != "да" | choise.ToLower() != "нет") // Пока пользователь не введет корректный ответ о вопросе сохранения
                    {
                        Console.Write("Введите верное значение!: ");

                        choise = validator.Line(Console.ReadLine());

                        if (choise.ToLower() == "да") // Хотим сохранить => сохраняем в словаре и прекращаем цикл с вопросом о правильности введенных данных
                        {
                            choise = null;

                            Persons.Add(index, human);

                            index++;
                        }
                    }

                    continueLoop = false; // Прекращаем цикл с вопросом о правильности введенных данных
                }
                else if (choise.ToLower() == "нет") // Если пользователь где-то допустил ошибку, то начинаем ввод данных с самого начала
                {
                    Console.WriteLine("В таком случае, введите все данные c самого начала:");

                    continueLoop = false; // Прекращаем цикл с вопросом о правильности введенных данных
                    choise = null;
                }

                while (choise.ToLower() != "да" | choise.ToLower() != "нет") // // Пока пользователь не введет корректный ответ о вопросе корректности введенных данных
                {
                    Console.Write("Введите верное значение!: ");

                    choise = validator.Line(Console.ReadLine());

                    if (choise.ToLower() == "да") // Правильный ввод => вопрос о сохранении
                    {
                        choise = null;

                        Console.Write("Хотите ли вы сохранить данного пользователя?: ");

                        choise = validator.Line(Console.ReadLine());

                        if (choise.ToLower() == "да") // Хотим сохранить => сохраняем в словаре и прекращаем цикл с вопросом о правильности введенных данных
                        {
                            choise = null;

                            Persons.Add(index, human);

                            index++;
                        }

                        while (choise.ToLower() != "да" | choise.ToLower() != "нет") // Пока пользователь не введет корректный ответ о вопросе сохранения
                        {
                            Console.Write("Введите верное значение!: ");

                            choise = validator.Line(Console.ReadLine());

                            if (choise.ToLower() == "да") // Хотим сохранить => сохраняем в словаре и прекращаем цикл с вопросом о правильности введенных данных
                            {
                                choise = null;

                                Persons.Add(index, human);

                                index++;
                            }
                        }

                        continueLoop = false; // Прекращаем цикл с вопросом о правильности введенных данных
                    }
                    else if (choise.ToLower() == "нет") // Если пользователь где-то допустил ошибку, то начинаем ввод данных с самого начала
                    {
                        Console.WriteLine("В таком случае, введите все данные c самого начала:");

                        continueLoop = false; // Прекращаем цикл с вопросом о правильности введенных данных
                        choise = null;
                    }

                    choise = "да"; // Для выхода из цикла
                }

                continueLoop = false; // Для выхода из цикла
            }
        }
    }
}
