class NewDTO {
  const NewDTO({
    required this.titleUa,
    required this.contentShortUa,
    required this.img,
  });

  NewDTO.fromJson(Map<String, dynamic> json)
      : titleUa = json['titleUa'] as String,
        contentShortUa = json['contentShortUa'] as String,
        img = json['img'] as String;

  final String titleUa;
  final String contentShortUa;
  final String img;
}
