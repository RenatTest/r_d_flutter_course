// ignore_for_file: avoid_print - it's ok for this file, lines_longer_than_80_chars
// ignore_for_file: omit_local_variable_types  - need to show that json
// is just string

// Початкова структура
// Чому ми вказуємо тип Map<String, dynamic> ?
// Чи можна працювати з Map у Flutter проєкті і як це виглядає?
// Базова конвертація Map<String, dynamic> у обʼєкт класу (DTO - що це таке?)
// Покращення конвертації Map<String, dynamic> у обʼєкт класу
// Автоматизація конвертації за допомогою jsonSerializable
// Прискорення формування DTO класу за допомогою онлайн сервісів (наприклад https://dart-quicktype.netlify.app/)
// Прискорення формування DTO класу за допомогою VSCode розширення (наприклад https://marketplace.visualstudio.com/items?itemName=hirantha.json-to-dart)
// Чи  можна DTO клас використовувати у UI?
// Що таке Entity клас і для чого він потрібен.

// Encode - навіщо він потрібен? Приклад з кешуванням.

import 'dart:convert';

// import 'package:r_d_flutter_course/features/rest_api/encode_decode/models/person_dto/person_dto.dart';
// import 'package:r_d_flutter_course/features/rest_api/encode_decode/models/person_entity/person_entity.dart';

void main() {
  const String json = personJson;
  final mapJson = jsonDecode(json) as Map<String, dynamic>;

  final person = PersonDtoH(
    name: mapJson['name'] as String,
    lastName: mapJson['lastName'] as String,
    age: mapJson['age'] as int,
    progress: ProgressDtoH(
      currentLesson: mapJson['progress']['currentLesson'] as int,
      totalScore: mapJson['progress']['totalScore'] as int,
      rating: mapJson['progress']['rating'] as double,
    ),
  );
  print(person);

  // final person = PersonDto.fromJson(personMap);

  // final personEntity = PersonEntity.fromDto(person);

  // final currentLesson = personEntity.totalScore;
  // final totalScore = personEntity.totalScore;
  // final rating = personEntity.totalScore;

  // print('currentLesson: $currentLesson');
  // print('totalScore: $totalScore');
  // print('rating: $rating');
}

class PersonDtoH {
  PersonDtoH({
    required this.name,
    required this.lastName,
    required this.age,
    required this.progress,
  });

  final String name;
  final String lastName;
  final int age;
  final ProgressDtoH progress;

  @override
  String toString() {
    // ignore: lines_longer_than_80_chars
    return 'PersonDtoH(name: $name, lastName: $lastName, age: $age, progress: $progress)';
  }
}

class ProgressDtoH {
  ProgressDtoH({this.currentLesson, this.totalScore, this.rating});

  final int? currentLesson;
  final int? totalScore;
  final double? rating;

  @override
  String toString() {
    return 'ProgressDtoH(currentLesson: $currentLesson, totalScore: $totalScore, rating: $rating,)';
  }
}

const personJson = '''
{
   "name":"Pavlo",
   "lastName":"Avdonin",
   "age":30,
   "progress":{
      "currentLesson":26,
      "totalScore":78,
      "rating":4.5
   }
}
''';
