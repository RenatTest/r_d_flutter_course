import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:r_d_flutter_course/core/network/alerts_info_api/active_alerts_regions_api.dart';
import 'package:r_d_flutter_course/core/network/cheque_api/cheque_api.dart';
import 'package:r_d_flutter_course/core/network/news_api/news_api.dart';
import 'package:r_d_flutter_course/core/network/products_api/products_api.dart';
import 'package:r_d_flutter_course/features/alerts_info/active_alerts_regions/data/data_source/active_alerts_regions_data_source.dart';
import 'package:r_d_flutter_course/features/alerts_info/active_alerts_regions/data/repository/active_alerts_regions_repository.dart';
import 'package:r_d_flutter_course/features/architecture/data/data_source/news_data_source.dart';
import 'package:r_d_flutter_course/features/architecture/data/repository/news_repository.dart';
import 'package:r_d_flutter_course/features/error_handling/data/data_source/products_data_source.dart';
import 'package:r_d_flutter_course/features/error_handling/data/repository/products_repository.dart';
import 'package:r_d_flutter_course/features/rest_api_homework/data/data_source/cheque_data_source.dart';
import 'package:r_d_flutter_course/features/rest_api_homework/data/repository/cheque_repository.dart';

final getIt = GetIt.instance;

void initDI() {
  _registerProductsRepository();
  _registerNewsRepository();
  _registerChequeRepository();
  _registerActiveAlertsRegionsRepository();
}

void _registerActiveAlertsRegionsRepository() {
  getIt.registerLazySingleton<ActiveAlertsRegionsRepository>(
    () => ActiveAlertsRegionsRepositoryImpl(
      ActiveAlertsRegionsDataSourceImpl(ActiveAlertsRegionsApiImpl()),
    ),
  );
}

void _registerChequeRepository() {
  getIt.registerLazySingleton<ChequeRepository>(
    () => ChequeRepositoryImpl(ChequeDataSourceImpl(ChequeApiImpl())),
  );
}

void _registerNewsRepository() {
  getIt.registerLazySingleton<NewsRepository>(
    () => NewsRepositoryImpl(NewsDataSourceImpl(NewsApiImpl())),
  );
}

// 3 variant
// void _registerProductsRepository() {
//   getIt.registerSingleton<ProductsRepository>(
//     ProductsRepositoryImpl(ProductsDataSourceImpl(ProductsApiImpl())),
//   );
// }

// 3 variant
void _registerProductsRepository() {
  getIt.registerLazySingleton<ProductsRepository>(
    () => ProductsRepositoryImpl(ProductsDataSourceImpl(ProductsApiImpl())),
  );
}

// create singleton 4 variant
final getItS = Di.instance;

class Di {
  Di._();

  static final Di instance = Di._();

  final ProductsRepository productsRepository = ProductsRepositoryImpl(
    ProductsDataSourceImpl(ProductsApiImpl()),
  );
}

// using Inherited Widget 5 variant
class Dependencies {
  Dependencies();

  final ProductsRepository productsRepository = ProductsRepositoryImpl(
    ProductsDataSourceImpl(ProductsApiImpl()),
  );
}

class DevScopes extends InheritedWidget {
  const DevScopes({
    required super.child,
    required this.dependencies,
    super.key,
  });

  final Dependencies dependencies;

  static Dependencies of(BuildContext context) {
    return context.getInheritedWidgetOfExactType<DevScopes>()!.dependencies;
  }

  @override
  bool updateShouldNotify(DevScopes oldWidget) {
    return false;
  }
}
