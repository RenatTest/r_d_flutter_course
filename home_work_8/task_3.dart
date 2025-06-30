// ignore_for_file: avoid_function_literals_in_foreach_calls

void main() {
  // Завдання 3 — Map

  // Створіть Map<String, String> де ключ — назва команди, а значення — що вона робить
  // Додайте ще одну пару
  // Оновіть значення для одного з учасників.
  // Виведіть список всіх команд та їх опис. Вивід провести двічі. Подумай які варіанти перебору ми можемо використати.
  // Знайдіть опис команди, яка має найдовшу довжину і виведіть її. (Підказка - використовуйте length у String)

  Map<String, String> teamsDevs = {
    'frontend': 'розробка інтерфейсу',
    'backend': 'розробка бекенду',
  };
  teamsDevs['qa'] = 'тестування';
  teamsDevs['qa'] = 'тестування сайту/додатку';

  teamsDevs.forEach((key, value) {
    // 1
    print('$key: $value');
  });

  for (var entry in teamsDevs.entries) {
    // 2
    print('${entry.key}: ${entry.value}');
  }

  String longestLength = '';
  teamsDevs.values.forEach((value) {
    if (value.length > longestLength.length) {
      longestLength = value;
    }
  });

  print('Найдовша довжина значення: $longestLength');
}
