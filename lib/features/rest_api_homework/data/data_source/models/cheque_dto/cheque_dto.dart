import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:r_d_flutter_course/features/rest_api_homework/data/data_source/models/cheque_dto/cheque_action.dart';
import 'package:r_d_flutter_course/features/rest_api_homework/data/data_source/models/cheque_dto/cheque_header.dart';
import 'package:r_d_flutter_course/features/rest_api_homework/data/data_source/models/cheque_dto/cheque_line.dart';

part 'cheque_dto.g.dart';

@JsonSerializable()
class ChequeDto {
  ChequeDto({
    this.chequeHeader,
    this.sumDiscount,
    this.chequeLines,
    this.chequeActions,
    this.chPrediction,
    this.sumCashback,
    this.chequeMagicName,
    this.feedbackRates,
  });

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ChequeDto].
  factory ChequeDto.fromJson(String data) {
    return ChequeDto.fromMap(json.decode(data) as Map<String, dynamic>);
  }
  factory ChequeDto.fromMap(Map<String, dynamic> data) => ChequeDto(
    chequeHeader: data['chequeHeader'] == null
        ? null
        : ChequeHeader.fromMap(data['chequeHeader'] as Map<String, dynamic>),
    sumDiscount: (data['sumDiscount'] as num?)?.toDouble(),
    chequeLines: (data['chequeLines'] as List<dynamic>?)
        ?.map((e) => ChequeLine.fromMap(e as Map<String, dynamic>))
        .toList(),
    chequeActions: (data['chequeActions'] as List<dynamic>?)
        ?.map((e) => ChequeAction.fromMap(e as Map<String, dynamic>))
        .toList(),
    chPrediction: data['chPrediction'] as String?,
    sumCashback: data['sumCashback'] as int?,
    chequeMagicName: data['chequeMagicName'] as String?,
    feedbackRates: data['feedbackRates'] as List<dynamic>?,
  );
  ChequeHeader? chequeHeader;
  double? sumDiscount;
  List<ChequeLine>? chequeLines;
  List<ChequeAction>? chequeActions;
  String? chPrediction;
  int? sumCashback;
  String? chequeMagicName;
  List<dynamic>? feedbackRates;

  Map<String, dynamic> toMap() => {
    'chequeHeader': chequeHeader?.toMap(),
    'sumDiscount': sumDiscount,
    'chequeLines': chequeLines?.map((e) => e.toMap()).toList(),
    'chequeActions': chequeActions?.map((e) => e.toMap()).toList(),
    'chPrediction': chPrediction,
    'sumCashback': sumCashback,
    'chequeMagicName': chequeMagicName,
    'feedbackRates': feedbackRates,
  };

  /// `dart:convert`
  ///
  /// Converts [ChequeDto] to a JSON string.
  String toJson() => json.encode(toMap());
}
