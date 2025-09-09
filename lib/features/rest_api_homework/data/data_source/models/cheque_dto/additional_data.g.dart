// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'additional_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdditionalData _$AdditionalDataFromJson(Map<String, dynamic> json) =>
    AdditionalData(
      id: json['id'] as String?,
      title: json['title'] as String?,
      icon: json['icon'] as String?,
      ratio: json['ratio'] as String?,
      sectionSlug: json['sectionSlug'] as String?,
      companyId: json['companyId'] as String?,
      externalProductId: json['externalProductId'] as String?,
      slug: json['slug'] as String?,
      classifierSapId: json['classifierSapId'] as String?,
      brandId: json['brandId'] as String?,
      brandTitle: json['brandTitle'] as String?,
      weighted: json['weighted'] as bool?,
      departmentName: json['departmentName'] as String?,
      barcodes: json['barcodes'] as List<dynamic>?,
      weight: (json['weight'] as num?)?.toDouble(),
      scanExcise: json['scanExcise'] as bool?,
    );

Map<String, dynamic> _$AdditionalDataToJson(AdditionalData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'icon': instance.icon,
      'ratio': instance.ratio,
      'sectionSlug': instance.sectionSlug,
      'companyId': instance.companyId,
      'externalProductId': instance.externalProductId,
      'slug': instance.slug,
      'classifierSapId': instance.classifierSapId,
      'brandId': instance.brandId,
      'brandTitle': instance.brandTitle,
      'weighted': instance.weighted,
      'departmentName': instance.departmentName,
      'barcodes': instance.barcodes,
      'weight': instance.weight,
      'scanExcise': instance.scanExcise,
    };
