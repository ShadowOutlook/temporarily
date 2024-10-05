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

        public string thisYear;

        static void Main(string[] args)
        {
            Program program = new Program();
            Validator validator = new Validator();

            while (program.continueLoop)
            {

                bool create = GetUserConsent("Желаете ли вы создать нового пользователя?" +
                                             "\nДля ответа введите да или нет: ");


                if (create)
                {
                    program.CreateNewPerson();
                }
                else
                {
                    if (program.Persons.Count >= 1)
                    {
                        bool look = GetUserConsent("Хотите ли вы просмотреть список сохраненных пользователей?" +
                                                   "\nОтветье 'да' или 'нет': ");

                        if (look)
                        {
                            foreach (var kvp in program.Persons)
                            {
                                Human human = kvp.Value;

                                Console.WriteLine(new string(Convert.ToChar("-"), 64) + 
                                                  $"\nФамилия: {human.Surname}" +
                                                  $"\nПол: {human.OneGender}" +
                                                  $"\nГод рождения: {human.BirthYear}\n" +
                                                  new string(Convert.ToChar("-"), 64));
                            }
                        }
                    }

                    Console.WriteLine("Завершение работы программы!" +
                                      "\nПрограмма завершена. Нажмите любую клавишу, чтобы закрыть консоль.");
                    Console.ReadKey();

                    program.continueLoop = false;
                }
            }
        }

        public void Saving(Human human) // Метод сохранения пользователя в словаре
        {
            bool save = GetUserConsent("Хотите ли вы сохранить данного пользователя?: ");

            if (save)
            {
                Persons.Add(index, human);

                index++;
            }
        }

        public void Correct(Human human) // Метод проверки введенных данных перед сохранением
        {
            bool correct = GetUserConsent("Введите 'да' если все правильно или 'нет' в противном случае:");
            
            if (correct)
            {
                Saving(human);
            }
            else
            {
                Console.WriteLine("В таком случае, введите все данные c самого начала:");

                CreateNewPerson();
            }
        }

        public void CreateNewPerson() // Метод создания нового пользователя
        {
            string surname;
            string gender;
            string birthYear;

            surname = validator.Line(GetInput(new string(Convert.ToChar("-"), 64) +
                               "\nВведите свою фамилию: "));

            gender = validator.Variant(GetInput("Введите свой пол в виде числа: 1 - мужчина, 0 - женщина: "));

            birthYear = validator.Year(GetInput("Введите свой год рождения: "), Convert.ToString(DateTime.Now.Year));

            Human human = Human.Create(surname, gender, birthYear);

            Console.WriteLine(new string(Convert.ToChar("-"), 64) +
                              $"\nУбедитесь в правильности введенных вами значений:" +
                              $"\nФамилия: {human.Surname}" +
                              $"\nПол: {human.OneGender}" +
                              $"\nГод рождения: {human.BirthYear}\n" +
                              new string(Convert.ToChar("-"), 64));
            
            Correct(human);

            Console.WriteLine(new string(Convert.ToChar("-"), 64) + "\n");
        }

        public string GetInput(string prompt) // Метод задания вопроса и получения на него ответа при вводе данных
        {
            Console.Write(prompt);
            return Console.ReadLine();
        }

        public static bool GetUserConsent(string prompt) // Метод проверки выбора пользователя на поступающий вопрос
        {
            while (true)
            {
                Console.Write(prompt);
                string input = Console.ReadLine().Trim().ToLower(); ;

                if (input == "да")
                {
                    return true;
                }
                else if (input == "нет")
                {
                    return false;
                }
                else
                {
                    Console.WriteLine("Некорректный ввод. Пожалуйста, введите 'да' или 'нет'.\n");
                }
            }
        }
    }
}
