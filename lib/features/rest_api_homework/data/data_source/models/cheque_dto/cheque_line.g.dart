// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cheque_line.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChequeLine _$ChequeLineFromJson(Map<String, dynamic> json) => ChequeLine(
  chequeLineId: (json['chequeLineId'] as num?)?.toInt(),
  lagerId: (json['lagerId'] as num?)?.toInt(),
  lagerNameUa: json['lagerNameUa'] as String?,
  lagerUnit: json['lagerUnit'] as String?,
  kolvo: (json['kolvo'] as num?)?.toDouble(),
  priceOut: (json['priceOut'] as num?)?.toDouble(),
  unitText: json['unitText'] as String?,
  fileName: json['fileName'] as String?,
  sumCashbackLine: (json['sumCashbackLine'] as num?)?.toInt(),
  additionalData: json['additionalData'] == null
      ? null
      : AdditionalData.fromJson(json['additionalData'] as String),
  like: json['like'] == null ? null : Like.fromJson(json['like'] as String),
);

Map<String, dynamic> _$ChequeLineToJson(ChequeLine instance) =>
    <String, dynamic>{
      'chequeLineId': instance.chequeLineId,
      'lagerId': instance.lagerId,
      'lagerNameUa': instance.lagerNameUa,
      'lagerUnit': instance.lagerUnit,
      'kolvo': instance.kolvo,
      'priceOut': instance.priceOut,
      'unitText': instance.unitText,
      'fileName': instance.fileName,
      'sumCashbackLine': instance.sumCashbackLine,
      'additionalData': instance.additionalData,
      'like': instance.like,
    };
