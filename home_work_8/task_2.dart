void main() {
  // Завдання 2 — Set

  // Створіть перший SET з типами даних, які памʼятаєте - не підглядайте 😉
  // Використовуючи документації Dart створіть Set з усіми build-in типами
  // Знайдіть спільні типи, що є в обох сетах.
  // Виведіть типи, яких не було у вашому власному списку, що ви пригадали.

  Set<String> typesOfDataMy = {'Num', 'String', 'bool', 'Map', 'List', 'Set'};
  Set<String> typesOfDataDoc = {
    'Num',
    'String',
    'bool',
    'Record',
    'Function',
    'List',
    'Set',
    'Map',
    'Runes',
    'Symbol',
    'null',
  };

  Set<String> commonTypes = {};
  Set<String> forgottenTypes = {};

  for (var element in typesOfDataDoc) {
    if (typesOfDataMy.contains(element)) commonTypes.add(element);
    if (!typesOfDataMy.contains(element)) forgottenTypes.add(element);
  }
  print('Спільні типи: ${commonTypes.join(', ')}');
  print('Забуті типи: ${forgottenTypes.join(', ')}');
}
