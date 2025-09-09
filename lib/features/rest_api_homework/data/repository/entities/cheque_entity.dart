import 'package:r_d_flutter_course/features/rest_api_homework/data/data_source/models/cheque_dto/cheque_dto.dart';

class ChequeEntity {
  ChequeEntity({
    required this.chequeId,
    required this.totalAmount,
    required this.items,
    required this.prediction,
  });

  ChequeEntity.fromDto(ChequeDto dto)
    : chequeId = dto.chequeHeader?.chequeId ?? 0,
      totalAmount = dto.chequeHeader?.sumReg ?? 0,
      items =
          dto.chequeLines
              ?.map((product) => product.lagerNameUa ?? '')
              .toList() ??
          [],
      prediction = dto.chPrediction ?? 'Без передбачення :(';

  final int chequeId;
  final double totalAmount;
  final List<String> items;
  final String prediction;
}
