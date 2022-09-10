// To parse this JSON data, do
//
//     final universityModel = universityModelFromMap(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'university.model.freezed.dart';

part 'university.model.g.dart';

/// It converts a JSON string into a UniversityModel object.
///
/// Args:
///   str (String): The JSON string that you want to convert to a UniversityModel object.
UniversityModel universityModelFromJson(String str) =>
    UniversityModel.fromJson(json.decode(str) as Map<String, dynamic>);

/// It converts a UniversityModel object to a JSON string.
///
/// Args:
///   data (UniversityModel): The data to be converted to JSON.
String universityModelToJson(UniversityModel data) =>
    json.encode(data.toJson());

/// It's a class that represents a university model
@freezed
class UniversityModel with _$UniversityModel {
  /// A factory constructor. It is a constructor that returns an instance of the class from some other input.
  @JsonSerializable(explicitToJson: true)
  factory UniversityModel({
    @Default('') String name,
    @Default('') String alphaTwoCode,
    @Default('') String stateProvince,
    String? photo,
    @Default([]) List<String> domains,
    @Default([]) List<String> webPages,
  }) = _UniversityModel;

  /// It converts a JSON string into a UniversityModel object.
  ///
  /// Args:
  ///   json (Map<String, dynamic>): The JSON data to be parsed.
  factory UniversityModel.fromJson(Map<String, dynamic> json) =>
      _$UniversityModelFromJson(json);
}
