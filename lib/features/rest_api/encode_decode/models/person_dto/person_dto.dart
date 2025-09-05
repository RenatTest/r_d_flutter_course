import 'package:json_annotation/json_annotation.dart';
import 'package:r_d_flutter_course/features/rest_api/encode_decode/models/person_dto/progress_dto.dart';

part 'person_dto.g.dart';

@JsonSerializable()
class PersonDto {
  PersonDto({this.name, this.lastName, this.age, this.progress});

  factory PersonDto.fromJson(Map<String, dynamic> json) {
    return _$PersonDtoFromJson(json);
  }

  String? name;
  String? lastName;
  int? age;
  ProgressDto? progress;
}
