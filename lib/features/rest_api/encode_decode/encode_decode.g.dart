// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'encode_decode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonDtoH _$PersonDtoHFromJson(Map<String, dynamic> json) => PersonDtoH(
  name: json['name'] as String,
  lastName: json['lastName'] as String,
  age: (json['age'] as num).toInt(),
  progress: ProgressDtoH.fromJson(json['progress'] as Map<String, dynamic>),
  email: json['email'] as String? ?? 'fluttercourse@gmail.com',
);

Map<String, dynamic> _$PersonDtoHToJson(PersonDtoH instance) =>
    <String, dynamic>{
      'name': instance.name,
      'lastName': instance.lastName,
      'age': instance.age,
      'progress': instance.progress,
      'email': instance.email,
    };

ProgressDtoH _$ProgressDtoHFromJson(Map<String, dynamic> json) => ProgressDtoH(
  currentLesson: (json['currentLesson'] as num?)?.toInt(),
  totalScore: (json['totalScore'] as num?)?.toInt(),
  rating: (json['rating'] as num?)?.toDouble(),
);

Map<String, dynamic> _$ProgressDtoHToJson(ProgressDtoH instance) =>
    <String, dynamic>{
      'currentLesson': instance.currentLesson,
      'totalScore': instance.totalScore,
      'rating': instance.rating,
    };
