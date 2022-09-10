// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'university.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UniversityModel _$$_UniversityModelFromJson(Map<String, dynamic> json) =>
    _$_UniversityModel(
      name: json['name'] as String? ?? '',
      alphaTwoCode: json['alphaTwoCode'] as String? ?? '',
      stateProvince: json['stateProvince'] as String? ?? '',
      photo: json['photo'] as String?,
      domains: (json['domains'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      webPages: (json['webPages'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_UniversityModelToJson(_$_UniversityModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'alphaTwoCode': instance.alphaTwoCode,
      'stateProvince': instance.stateProvince,
      'photo': instance.photo,
      'domains': instance.domains,
      'webPages': instance.webPages,
    };
