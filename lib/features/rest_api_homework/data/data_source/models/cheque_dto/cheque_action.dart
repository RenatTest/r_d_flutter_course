import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'cheque_action.g.dart';

@JsonSerializable()
class ChequeAction {
  ChequeAction({
    this.actionType,
    this.actionTypeCodeName,
    this.actionId,
    this.discpercent,
    this.discount,
    this.varcharData,
  });

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ChequeAction].
  factory ChequeAction.fromJson(String data) {
    return ChequeAction.fromMap(json.decode(data) as Map<String, dynamic>);
  }
  factory ChequeAction.fromMap(Map<String, dynamic> data) => ChequeAction(
    actionType: data['actionType'] as int?,
    actionTypeCodeName: data['actionTypeCodeName'] as dynamic,
    actionId: data['actionId'] as int?,
    discpercent: data['discpercent'] as int?,
    discount: (data['discount'] as num?)?.toDouble(),
    varcharData: data['varcharData'] as String?,
  );
  int? actionType;
  dynamic actionTypeCodeName;
  int? actionId;
  int? discpercent;
  double? discount;
  String? varcharData;

  Map<String, dynamic> toMap() => {
    'actionType': actionType,
    'actionTypeCodeName': actionTypeCodeName,
    'actionId': actionId,
    'discpercent': discpercent,
    'discount': discount,
    'varcharData': varcharData,
  };

  /// `dart:convert`
  ///
  /// Converts [ChequeAction] to a JSON string.
  String toJson() => json.encode(toMap());
}
