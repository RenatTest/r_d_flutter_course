import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:r_d_flutter_course/features/rest_api_homework/data/data_source/models/cheque_dto/additional_data.dart';
import 'package:r_d_flutter_course/features/rest_api_homework/data/data_source/models/cheque_dto/like.dart';

part 'cheque_line.g.dart';

@JsonSerializable()
class ChequeLine {
  ChequeLine({
    this.chequeLineId,
    this.lagerId,
    this.lagerNameUa,
    this.lagerUnit,
    this.kolvo,
    this.priceOut,
    this.unitText,
    this.fileName,
    this.sumCashbackLine,
    this.additionalData,
    this.like,
  });

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ChequeLine].
  factory ChequeLine.fromJson(String data) {
    return ChequeLine.fromMap(json.decode(data) as Map<String, dynamic>);
  }
  factory ChequeLine.fromMap(Map<String, dynamic> data) => ChequeLine(
    chequeLineId: data['chequeLineId'] as int?,
    lagerId: data['lagerId'] as int?,
    lagerNameUa: data['lagerNameUA'] as String?,
    lagerUnit: data['lagerUnit'] as String?,
    kolvo: (data['kolvo'] as num?)?.toDouble(),
    priceOut: (data['priceOut'] as num?)?.toDouble(),
    unitText: data['unitText'] as String?,
    fileName: data['fileName'] as String?,
    sumCashbackLine: data['sumCashbackLine'] as int?,
    additionalData: data['additionalData'] == null
        ? null
        : AdditionalData.fromMap(
            data['additionalData'] as Map<String, dynamic>,
          ),
    like: data['like'] == null
        ? null
        : Like.fromMap(data['like'] as Map<String, dynamic>),
  );
  int? chequeLineId;
  int? lagerId;
  String? lagerNameUa;
  String? lagerUnit;
  double? kolvo;
  double? priceOut;
  String? unitText;
  String? fileName;
  int? sumCashbackLine;
  AdditionalData? additionalData;
  Like? like;

  Map<String, dynamic> toMap() => {
    'chequeLineId': chequeLineId,
    'lagerId': lagerId,
    'lagerNameUA': lagerNameUa,
    'lagerUnit': lagerUnit,
    'kolvo': kolvo,
    'priceOut': priceOut,
    'unitText': unitText,
    'fileName': fileName,
    'sumCashbackLine': sumCashbackLine,
    'additionalData': additionalData?.toMap(),
    'like': like?.toMap(),
  };

  /// `dart:convert`
  ///
  /// Converts [ChequeLine] to a JSON string.
  String toJson() => json.encode(toMap());
}
