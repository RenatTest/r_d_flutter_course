import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:r_d_flutter_course/features/architecture/data/data_source/models/new_dto.dart';

abstract interface class NewsApi {
  Future<List<NewDTO>> getNews();
}

const imageLink =
    'https://generation-admin.freegen.games/api/file/downloadFile/';

class NewsApiImpl implements NewsApi {
  @override
  Future<List<NewDTO>> getNews() async {
    final response = await http.get(
      Uri.parse(
        'https://generation-admin.freegen.games/api/publication/admin/all/news/?active=true&sort=publicationDate,DESC&size=10000&lang=ua',
      ),
    );

    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body) as Map<String, dynamic>;

      final newsList = jsonBody['publication'] as List<dynamic>;

      return newsList
          .map((item) => NewDTO.fromJson(item as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception(
        'Failed to fetch news from API, '
        'status code: ${response.statusCode}',
      );
    }
  }
}
