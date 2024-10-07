using System;
using System.Collections.Generic;
using System.Diagnostics.Eventing.Reader;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Runtime.Remoting.Metadata.W3cXsd2001;
using System.Security.AccessControl;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace Lr_3
{
    internal class Program
    {
        private Dictionary<int, Human> Persons = new Dictionary<int, Human>();
        private Dictionary<int, Action> actions = new Dictionary<int, Action>
        {
            {1, UpBirthYear},
            {2, DownBirthYear},
            {3, SurnameList},
            {4, DifferenceInYears},
            {5, FindSimilarSurname},
            {6, FindCountOtherYear},
            {7, ListOfSurnamesByGender},
            {8, CountByYears},
        };

        Validator validator = new Validator();

        private int index = 0;

        string actionList = "\n1 - Увеличить год рождения на 1" + "\n2 - Уменьшить год рождения на 1" +
                            "\n3 - Список всех фамилий" + "\n4 - Разница в годах рождения между пользователями" +
                            "\n5 - Нахождение пользователей со схожей фамилией" + "\n6 - Количество пользователей с отличным от вашего года рождения" +
                            "\n7 - Фамилии пользователей одного пола" + "\n8 - Возраст пользователя" +
                            "\n0 - Выйти";

        bool continueLoop = true;
        bool exit = false;

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
                        while (!program.exit)
                        {
                            bool action = GetUserConsent("Хотите ли вы выполнить одно из следующих действий, для ответа введите 'да' или 'нет'?:" + program.actionList);

                            if (action)
                            {
                                int oneAction = validator.Variant(program.GetInput("Выберите какое действие вы хотите выполнить введя номер:" + program.actionList +"\n:"), 0, 8);

                                if (program.actions.ContainsKey(oneAction))
                                {
                                    program.actions[oneAction]();
                                }
                            }
                            else
                            {
                                program.exit = true;
                            }
                        }

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

        private void Saving(Human human) // Метод сохранения пользователя в словаре
        {
            bool save = GetUserConsent("Хотите ли вы сохранить данного пользователя?: ");

            if (save)
            {
                Persons.Add(index, human);

                index++;
            }
        }

        private void Correct(Human human) // Метод проверки введенных данных перед сохранением
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

        private void CreateNewPerson() // Метод создания нового пользователя
        {
            string surname;
            int gender;
            int birthYear;

            surname = validator.Line(GetInput(new string(Convert.ToChar("-"), 64) +
                               "\nВведите свою фамилию: "));

            gender = validator.Variant(GetInput("Введите свой пол в виде числа: 1 - мужчина, 0 - женщина: "), 0, 1);

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

        private string GetInput(string prompt) // Метод задания вопроса и получения на него ответа при вводе данных
        {
            Console.Write(prompt);
            return Console.ReadLine();
        }

        private static bool GetUserConsent(string prompt) // Метод проверки выбора пользователя на поступающий вопрос
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

        

        static void UpBirthYear()
        {
            Program program = new Program();
            Validator validator = new Validator();

            int indexUser = validator.Variant(program.GetInput($"Выберите пользователя для которого вы хотите изменить возраст из {program.Persons.Count} количества: "), 0, program.Persons.Count);

            program.Persons[indexUser]++;
        }

        static void DownBirthYear()
        {
            Program program = new Program();
            Validator validator = new Validator();

            int indexUser = validator.Variant(program.GetInput($"Выберите пользователя для которого вы хотите изменить возраст из {program.Persons.Count} количества: "), 0, program.Persons.Count);

            program.Persons[indexUser]--;
        }

        static void SurnameList()
        {
            Program program = new Program();

            List<string> surnames = new List<string>();

            foreach (var kvp in program.Persons)
            {
                Human human = kvp.Value;

                surnames += human;
            }

            Console.WriteLine("Список всех фамилий пользователей:");

            for (int i = 0; i < surnames.Count; i++)
            {
                Console.WriteLine(surnames[i]);
            }
        }

        static void DifferenceInYears()
        {
            Program program = new Program();
            Validator validator = new Validator();

            int indexUser1 = validator.Variant(program.GetInput($"Выберите пользователя 1 из {program.Persons.Count} количества: "), 0, program.Persons.Count);
            int indexUser2 = validator.Variant(program.GetInput($"Выберите пользователя 2 из {program.Persons.Count} количества: "), 0, program.Persons.Count);

            Human human1 = program.Persons[indexUser1];
            Human human2 = program.Persons[indexUser2];

            Console.WriteLine($"Разница в годах рождения между пользователями {human1.Surname} и {human2.Surname}: {Math.Abs(human1 - human2)}");
        }

        static void FindSimilarSurname()
        {
            Program program = new Program();
            Validator validator = new Validator();

            string surname = validator.Line(program.GetInput("Введите фамилию пользователя, поиск по которой вы хотите произвести: "));

            Human searchHuman = new Human(surname, 1, 2000);

            foreach (var kvp in program.Persons)
            {
                if (kvp.Value == searchHuman)
                {
                    Console.WriteLine($"Совпадение найдено на индексе: {kvp.Key}");
                }
            }
        }

        static void FindCountOtherYear()
        {
            Program program = new Program();
            Validator validator = new Validator();

            int count = 0;

            int birthYear = validator.Year(program.GetInput("Введите год рождения, чтобы получить количество пользователей с отличным от введенного вами: "), Convert.ToString(DateTime.Now.Year));

            foreach (var kvp in program.Persons)
            {
                if (birthYear != kvp.Value)
                {
                    count++;
                }
            }

            Console.WriteLine($"Пользователей с иным годом рождения: {count}");
        }

        static void ListOfSurnamesByGender()
        {
            Program program = new Program();
            Validator validator = new Validator();

            Dictionary<int, string> malesSurnames = new Dictionary<int, string>();
            Dictionary<int, string> femalesSurnames = new Dictionary<int, string>();


        }

        static void CountByYears()
        {

        }
    }
}
