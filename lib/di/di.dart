import 'package:get_it/get_it.dart';
import 'package:r_d_flutter_course/core/network/products_api/products_api.dart';
import 'package:r_d_flutter_course/features/error_handling/data/data_source/products_data_source.dart';
import 'package:r_d_flutter_course/features/error_handling/data/repository/products_repository.dart';

final getIt = GetIt.instance;

void initDI() {
  _registerProductsRepository();
}

// void _registerProductsRepository() {
//   getIt.registerSingleton<ProductsRepository>(
//     ProductsRepositoryImpl(ProductsDataSourceImpl(ProductsApiImpl())),
//   );
// }

void _registerProductsRepository() {
  getIt.registerLazySingleton<ProductsRepository>(
    () => ProductsRepositoryImpl(ProductsDataSourceImpl(ProductsApiImpl())),
  );
}
