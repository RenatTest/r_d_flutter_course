import 'package:r_d_flutter_course/features/architecture/data/data_source/models/new_dto.dart';

class NewEntity {
  const NewEntity({
    required this.titleUa,
    required this.contentShortUa,
    required this.img,
  });

  factory NewEntity.fromDTO(NewDTO dto) {
    return NewEntity(
      titleUa: dto.titleUa,
      contentShortUa: dto.contentShortUa,
      img: dto.img,
    );
  }

  final String titleUa;
  final String contentShortUa;
  final String img;
}
