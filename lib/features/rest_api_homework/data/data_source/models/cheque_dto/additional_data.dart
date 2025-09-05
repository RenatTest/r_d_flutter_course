import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'additional_data.g.dart';

@JsonSerializable()
class AdditionalData {
  AdditionalData({
    this.id,
    this.title,
    this.icon,
    this.ratio,
    this.sectionSlug,
    this.companyId,
    this.externalProductId,
    this.slug,
    this.classifierSapId,
    this.brandId,
    this.brandTitle,
    this.weighted,
    this.departmentName,
    this.barcodes,
    this.weight,
    this.scanExcise,
  });

  /// `dart:convert`
  ///
  // ignore: lines_longer_than_80_chars
  /// Parses the string and returns the resulting Json object as [AdditionalData].
  factory AdditionalData.fromJson(String data) {
    return AdditionalData.fromMap(json.decode(data) as Map<String, dynamic>);
  }
  factory AdditionalData.fromMap(Map<String, dynamic> data) {
    return AdditionalData(
      id: data['id'] as String?,
      title: data['title'] as String?,
      icon: data['icon'] as String?,
      ratio: data['ratio'] as String?,
      sectionSlug: data['sectionSlug'] as String?,
      companyId: data['companyId'] as String?,
      externalProductId: data['externalProductId'] as String?,
      slug: data['slug'] as String?,
      classifierSapId: data['classifierSapId'] as String?,
      brandId: data['brandId'] as String?,
      brandTitle: data['brandTitle'] as String?,
      weighted: data['weighted'] as bool?,
      departmentName: data['departmentName'] as String?,
      barcodes: data['barcodes'] as List<dynamic>?,
      weight: (data['weight'] as num?)?.toDouble(),
      scanExcise: data['scanExcise'] as bool?,
    );
  }
  String? id;
  String? title;
  String? icon;
  String? ratio;
  String? sectionSlug;
  String? companyId;
  String? externalProductId;
  String? slug;
  String? classifierSapId;
  String? brandId;
  String? brandTitle;
  bool? weighted;
  String? departmentName;
  List<dynamic>? barcodes;
  double? weight;
  bool? scanExcise;

  Map<String, dynamic> toMap() => {
    'id': id,
    'title': title,
    'icon': icon,
    'ratio': ratio,
    'sectionSlug': sectionSlug,
    'companyId': companyId,
    'externalProductId': externalProductId,
    'slug': slug,
    'classifierSapId': classifierSapId,
    'brandId': brandId,
    'brandTitle': brandTitle,
    'weighted': weighted,
    'departmentName': departmentName,
    'barcodes': barcodes,
    'weight': weight,
    'scanExcise': scanExcise,
  };

  /// `dart:convert`
  ///
  /// Converts [AdditionalData] to a JSON string.
  String toJson() => json.encode(toMap());
}
