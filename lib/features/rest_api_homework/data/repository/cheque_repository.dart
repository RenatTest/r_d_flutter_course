import 'package:r_d_flutter_course/features/rest_api_homework/data/data_source/cheque_data_source.dart';
import 'package:r_d_flutter_course/features/rest_api_homework/data/repository/entities/cheque_entity.dart';

abstract interface class ChequeRepository {
  Future<ChequeEntity> getCheque();
}

class ChequeRepositoryImpl implements ChequeRepository {
  ChequeRepositoryImpl(this._dataSource);

  final ChequeDataSource _dataSource;

  @override
  Future<ChequeEntity> getCheque() async {
    final response = await _dataSource.getCheque();

    final result = ChequeEntity.fromDto(response);

    return result;
  }
}
