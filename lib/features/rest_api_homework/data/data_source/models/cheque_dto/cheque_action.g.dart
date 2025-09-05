// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cheque_action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChequeAction _$ChequeActionFromJson(Map<String, dynamic> json) => ChequeAction(
  actionType: (json['actionType'] as num?)?.toInt(),
  actionTypeCodeName: json['actionTypeCodeName'],
  actionId: (json['actionId'] as num?)?.toInt(),
  discpercent: (json['discpercent'] as num?)?.toInt(),
  discount: (json['discount'] as num?)?.toDouble(),
  varcharData: json['varcharData'] as String?,
);

Map<String, dynamic> _$ChequeActionToJson(ChequeAction instance) =>
    <String, dynamic>{
      'actionType': instance.actionType,
      'actionTypeCodeName': instance.actionTypeCodeName,
      'actionId': instance.actionId,
      'discpercent': instance.discpercent,
      'discount': instance.discount,
      'varcharData': instance.varcharData,
    };
