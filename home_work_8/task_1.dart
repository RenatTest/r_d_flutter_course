void main() {
  // Завдання 1 — List

  // Створіть список із 5 назв мов програмувань
  // Додайте ще одну мову в кінець списку.
  // Видаліть одну з мов.
  // Виведіть список у консоль по одному елементу з індексом. (1- Dart, 2-....)
  // Виведіть список в алфавітному порядку.

  List<String> langs = ['Dart', 'JavaScript', 'Python', 'Java', 'Go'];
  langs.add('Swift');
  langs.remove('Go');

  for (var i = 0; i < langs.length; i++) {
    print('${i + 1} - ${langs[i]}');
  }

  langs.sort();
  for (final el in langs) {
    print(el);
  }
}
