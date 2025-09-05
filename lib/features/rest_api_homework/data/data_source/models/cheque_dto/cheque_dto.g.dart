// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cheque_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChequeDto _$ChequeDtoFromJson(Map<String, dynamic> json) => ChequeDto(
  chequeHeader: json['chequeHeader'] == null
      ? null
      : ChequeHeader.fromJson(json['chequeHeader'] as String),
  sumDiscount: (json['sumDiscount'] as num?)?.toDouble(),
  chequeLines: (json['chequeLines'] as List<dynamic>?)
      ?.map((e) => ChequeLine.fromJson(e as String))
      .toList(),
  chequeActions: (json['chequeActions'] as List<dynamic>?)
      ?.map((e) => ChequeAction.fromJson(e as String))
      .toList(),
  chPrediction: json['chPrediction'] as String?,
  sumCashback: (json['sumCashback'] as num?)?.toInt(),
  chequeMagicName: json['chequeMagicName'] as String?,
  feedbackRates: json['feedbackRates'] as List<dynamic>?,
);

Map<String, dynamic> _$ChequeDtoToJson(ChequeDto instance) => <String, dynamic>{
  'chequeHeader': instance.chequeHeader,
  'sumDiscount': instance.sumDiscount,
  'chequeLines': instance.chequeLines,
  'chequeActions': instance.chequeActions,
  'chPrediction': instance.chPrediction,
  'sumCashback': instance.sumCashback,
  'chequeMagicName': instance.chequeMagicName,
  'feedbackRates': instance.feedbackRates,
};
