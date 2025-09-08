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

// ignore_for_file: prefer_constructors_over_static_methods, omit_local_variable_types, lines_longer_than_80_chars, unreachable_from_main

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
part 'encode_decode.g.dart';

// import 'package:r_d_flutter_course/features/rest_api/encode_decode/models/person_dto/person_dto.dart';
// import 'package:r_d_flutter_course/features/rest_api/encode_decode/models/person_entity/person_entity.dart';

void main() {
  const String json = personJson;
  final mapJson = jsonDecode(json) as Map<String, dynamic>;

  final person = PersonDtoH.fromJson(mapJson);
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

@JsonSerializable() // createToJson: false
class PersonDtoH {
  PersonDtoH({
    required this.name,
    required this.lastName,
    required this.age,
    required this.progress,
    @JsonKey(name: 'email_v2') required this.email,
  });

  // static PersonDtoH fromJson(Map<String, dynamic> json) {
  //   return PersonDtoH(
  //     name: json['name'] as String,
  //     lastName: json['lastName'] as String,
  //     age: json['age'] as int,
  //     progress: ProgressDtoH.fromJson(json['progress'] as Map<String, dynamic>),
  //   );
  // }
  factory PersonDtoH.fromJson(Map<String, dynamic> json) =>
      _$PersonDtoHFromJson(json);

  final String name;
  final String lastName;
  final int age;
  final ProgressDtoH progress;
  final String email;

  @override
  String toString() {
    return 'PersonDtoH(name: $name, lastName: $lastName, age: $age, progress: $progress)';
  }
}

@JsonSerializable()
class ProgressDtoH {
  ProgressDtoH({this.currentLesson, this.totalScore, this.rating});

  // static ProgressDtoH fromJson(Map<String, dynamic> json) {
  //   return ProgressDtoH(
  //     currentLesson: json['currentLesson'] as int,
  //     totalScore: json['totalScore'] as int,
  //     rating: json['rating'] as double,
  //   );
  // }

  factory ProgressDtoH.fromJson(Map<String, dynamic> json) =>
      _$ProgressDtoHFromJson(json);

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
   "email_v2": "example@gmail.com",
   "progress":{
      "currentLesson":26,
      "totalScore":78,
      "rating":4.5
   }
}
''';
