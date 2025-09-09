import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'cheque_header.g.dart';

@JsonSerializable()
class ChequeHeader {
  ChequeHeader({
    this.filId,
    this.chequeId,
    this.created,
    this.loyaltyFactId,
    this.businessCardId,
    this.sumReg,
    this.sumBalance,
    this.filialName,
    this.cityName,
    this.frId,
    this.zId,
    this.frChequeId,
    this.payType,
    this.payTypeArray,
    this.fiscalNumber,
    this.externalOperationId,
  });

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ChequeHeader].
  factory ChequeHeader.fromJson(String data) {
    return ChequeHeader.fromMap(json.decode(data) as Map<String, dynamic>);
  }
  factory ChequeHeader.fromMap(Map<String, dynamic> data) => ChequeHeader(
    filId: data['filId'] as int?,
    chequeId: data['chequeId'] as int?,
    created: data['created'] as String?,
    loyaltyFactId: data['loyaltyFactId'] as int?,
    businessCardId: data['businessCardId'] as int?,
    sumReg: (data['sumReg'] as num?)?.toDouble(),
    sumBalance: (data['sumBalance'] as num?)?.toDouble(),
    filialName: data['filialName'] as String?,
    cityName: data['cityName'] as String?,
    frId: data['frId'] as int?,
    zId: data['zId'] as int?,
    frChequeId: data['frChequeId'] as int?,
    payType: data['payType'] as int?,
    payTypeArray: data['payTypeArray'] as List<dynamic>?,
    fiscalNumber: data['fiscalNumber'] as String?,
    externalOperationId: data['externalOperationId'] as dynamic,
  );
  int? filId;
  int? chequeId;
  String? created;
  int? loyaltyFactId;
  int? businessCardId;
  double? sumReg;
  double? sumBalance;
  String? filialName;
  String? cityName;
  int? frId;
  int? zId;
  int? frChequeId;
  int? payType;
  List<dynamic>? payTypeArray;
  String? fiscalNumber;
  dynamic externalOperationId;

  Map<String, dynamic> toMap() => {
    'filId': filId,
    'chequeId': chequeId,
    'created': created,
    'loyaltyFactId': loyaltyFactId,
    'businessCardId': businessCardId,
    'sumReg': sumReg,
    'sumBalance': sumBalance,
    'filialName': filialName,
    'cityName': cityName,
    'frId': frId,
    'zId': zId,
    'frChequeId': frChequeId,
    'payType': payType,
    'payTypeArray': payTypeArray,
    'fiscalNumber': fiscalNumber,
    'externalOperationId': externalOperationId,
  };

  /// `dart:convert`
  ///
  /// Converts [ChequeHeader] to a JSON string.
  String toJson() => json.encode(toMap());
}
