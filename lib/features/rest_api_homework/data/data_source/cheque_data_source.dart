import 'package:r_d_flutter_course/core/network/cheque_api/cheque_api.dart';
import 'package:r_d_flutter_course/features/rest_api_homework/data/data_source/models/cheque_dto/cheque_dto.dart';

abstract interface class ChequeDataSource {
  Future<ChequeDto> getCheque();
}

class ChequeDataSourceImpl implements ChequeDataSource {
  ChequeDataSourceImpl(this._api);

  final ChequeApi _api;

  @override
  Future<ChequeDto> getCheque() async {
    final result = await _api.getCheque();

    return result;
  }
}
