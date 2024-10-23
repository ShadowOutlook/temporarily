using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;

namespace Test
{
    internal class Program
    {
        static void Main(string[] args)
        {
            bool exit = false;

            NoteBook[] notes = new NoteBook[5];

            ref NoteBook[] notesRef = ref notes;

            Validator validator = new Validator();

            Dictionary<int, NoteBook> noteCategory = new Dictionary<int, NoteBook>
            {
                {1, new WorkNote()},
                {2, new HomeNote()},
                {3, new HealthNote()}
            };

            Dictionary<int, Action<string, Validator, Dictionary<int, NoteBook>, NoteBook[]>> actions = new Dictionary<int, Action<string, Validator, Dictionary<int, NoteBook>, NoteBook[]>>
            {
                { 1, CreateNewNote },
                { 2, ViewNotes },
                { 3, ChangeCreationDate },
            };

            string categories = "Выберите категорию:" +
                                "\n1 - Работа" +
                                "\n2 - Дом" +
                                "\n3 - Здоровье" +
                                "\n\nВвод: ";

            string actionList = "Выберите действие, введя номер:" +
                                "\n1 - Создать новую заметку" +
                                "\n2 - Просмотреть заметку" +
                                "\n3 - Изменить дату создания заметки" +
                                "\n4 -  Закончить" +
                                "\n\nВвод: ";

            while (!exit)
            {
                int oneAction = validator.Variant(validator.GetInput(actionList), 1, actions.Count + 1);

                if (actions.ContainsKey(oneAction))
                {
                    actions[oneAction](categories, validator, noteCategory, notesRef);
                }
                else
                {
                    exit = true;
                }
            }

            if (exit)
            {
                Console.WriteLine("Завершение работы программы!" +
                                  "\nПрограмма завершена. Нажмите любую клавишу, чтобы закрыть консоль.");
                Console.ReadKey();
            }
        }

        static void CreateNewNote(string categories, Validator validator, Dictionary<int, NoteBook> noteCategory, NoteBook[] notes)
        {
            NoteBook note = noteCategory[validator.Variant(validator.GetInput(categories), 1, noteCategory.Count)];

            note.CreateNote();

            for (int i = 0; i < notes.Length; i++)
            {
                if (notes[i] == null)
                {
                    notes[i] = note;

                    break;
                }
            }
        }

        static void ViewNotes(string categories, Validator validator, Dictionary<int, NoteBook> noteCategory, NoteBook[] notes)
        {
            bool empty = true;

            while (empty) // Чтобы мы в любом случае попробовали снова просмотреть записи по какой-либо категории
            {
                Dictionary<int, Type> typeNoteCategory = noteCategory.ToDictionary(kvp => kvp.Key, kvp => kvp.Value.GetType()); // Словарь существующих типов потомков

                Type noteType = typeNoteCategory[validator.Variant(validator.GetInput(categories), 1, noteCategory.Count)]; // Выбор катеогрии для просмотра

                for (int i = 0; i < notes.Length; i++) // Проходимся по массиву записей для отображения по выбранной категории
                {
                    if (notes[i] != null)
                    {
                        if (notes[i].GetType() == noteType)
                        {
                            notes[i].InfoOutput();

                            empty = false;
                        }
                    }
                }

                if (empty) // В случае если по данной категории отсутствуют записи
                {
                    Console.WriteLine($"Категория:{noteType} - пусто");
                }
            }
        }

        static void ChangeCreationDate(string categories, Validator validator, Dictionary<int, NoteBook> noteCategory, NoteBook[] notes)
        {
            bool containsValue = notes.Any(note => note != null); // Проверяем, содержит ли массив хотя бы одну запись

            if (containsValue)
            {
                while (true) // Чтобы мы в любом случае попробовали снова изменить дату создания записи по какой-либо категории
                {
                    Dictionary<int, Type> typeNoteCategory = noteCategory.ToDictionary(kvp => kvp.Key, kvp => kvp.Value.GetType());
                    Type noteType = typeNoteCategory[validator.Variant(validator.GetInput(categories), 1, noteCategory.Count)];
                    List<int> indexNotes = new List<int>();

                    // Поиск индексов нахождения всех записей по конкретной категории
                    for (int i = 0; i < notes.Length; i++)
                    {
                        if (notes[i] != null && notes[i].GetType() == noteType)
                        {
                            indexNotes.Add(i);
                        }
                    }

                    if (!indexNotes.Any()) // В случае, если ни одной записи данной категории не найдено
                    {
                        Console.WriteLine($"Категория: {noteType} - пусто");
                    }
                    else
                    {
                        string indexsNote = string.Join(" ", indexNotes.Select(num => (num + 1).ToString()));
                        int indexNote = Convert.ToInt32(validator.Number(validator.GetInput($"Введите номер записи, дату которой вы хотите изменить из {indexsNote} вариантов: "))) - 1;

                        while (!indexNotes.Contains(indexNote)) // Проверка на корректный ввод
                        {
                            indexNote = Convert.ToInt32(validator.Number(validator.GetInput($"Введите верное значение из {indexsNote} вариантов: ")));
                        }

                        notes[indexNote].ChangeCreationDate(); // Вызов метода изменения даты создания
                        break;
                    }

                }
            }
        }
    }
}
