import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:r_d_flutter_course/features/error_handling/data/data_source/models/product_dto.dart';

abstract interface class ProductsApi {
  Future<List<ProductDTO>> getProducts();
}

class ProductsApiImpl implements ProductsApi {
  @override
  Future<List<ProductDTO>> getProducts() async {
    final response = await http.get(
      Uri.parse('https://onlytarg.github.io/mock_api/products.json'),
    );

    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body) as Map<String, dynamic>;

      final productsList = jsonBody['products'] as List<dynamic>;

      return productsList
          .map((item) => ProductDTO.fromJson(item as Map<String, dynamic>))
          .toList();
    } else {
      throw NeedMoreProductsException(3);
      // throw Exception(
      //   'Failed to fetch products from API, '
      //   'status code: ${response.statusCode}',
      // );
    }
  }
}

class NeedMoreProductsException implements Exception {
  NeedMoreProductsException(this.count);

  final int count;
  @override
  String toString() => '404 not found';
}
