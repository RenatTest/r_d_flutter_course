void main() {
  // Додаткове завдання (опціонально)

  // Створіть список (List<String>) з іменами всіх студентів, що беруть участь у нашому курсі.
  // Імена можна взяти з нашого каналу в Slack.
  // 1. Виведіть унікальні імена — тобто ті, що зустрічаються лише один раз у списку.
  // 2. Виведіть імена, що повторюються, а також кількість повторень для кожного з них.

  List<String> students = [
    'Alex',
    'Anastasia',
    'Anastasiia',
    'Andrii',
    'Andrii',
    'Andrii',
    'Anna',
    'Anton',
    'Artem',
    'Artur',
    'Borys',
    'Constantine',
    'Daniel',
    'Dima',
    'Dmitry',
    'Dmytro',
    'Vladyslav',
    'Ihor',
    'Ivan',
    'Karyna',
    'Віталій',
    'Maksym',
    'Matvii',
    'Oleh',
    'Oleksandr',
    'Oleksii',
    'Pavel',
    'Pavlo',
    'Pavlo',
    'Renat',
    'Rostyslav',
    'Sashka',
    'Stanislav',
    'Tanya',
    'Tetiana',
    'Vadym',
    'vikk',
    'Vitalii',
    'Vladyslav',
    'Yaroslav',
    'Yurii',
    'Yurij',
    'Andrew',
    'Богдан',
    'Галина',
    'Евгений',
    'evhenii',
    'Игорь',
    'Олександр',
  ];

  Map<String, int> allNamesWithCounts = {};
  Map<String, int> repeatedNames = {};
  List<String> uniqueNames = [];

  for (var i = 0; i < students.length; i++) {
    allNamesWithCounts[students[i]] =
        (allNamesWithCounts[students[i]] ?? 0) + 1;
  }

  allNamesWithCounts.forEach((name, count) {
    if (count == 1) {
      uniqueNames.add(name);
    } else {
      repeatedNames[name] = count;
    }
  });

  print('Унікальні імена: ${uniqueNames.join(', ')}');
  print('Повторювані імена: $repeatedNames');
}
