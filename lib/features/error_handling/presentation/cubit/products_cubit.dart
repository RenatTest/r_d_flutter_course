import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r_d_flutter_course/core/network/products_api/products_api.dart';
import 'package:r_d_flutter_course/features/error_handling/data/repository/products_repository.dart';
import 'package:r_d_flutter_course/features/error_handling/presentation/cubit/products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this._repository) : super(const ProductsState.initial());

  final ProductsRepository _repository;

  Future<void> getProducts() async {
    try {
      final products = await _repository.getProducts();

      emit(state.copyWith(status: ProductsStatus.loaded, products: products));
    } on NeedMoreProductsException catch (exception, stackTrace) {
      // ignore: avoid_print
      print('stackTrace $stackTrace');
      emit(
        state.copyWith(
          status: ProductsStatus.error,
          errorMessage: 'Need more products ${exception.count}',
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: ProductsStatus.error,
          errorMessage: e.toString(),
        ),
      );

      rethrow;
    }
  }
}
