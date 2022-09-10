// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'university.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UniversityModel _$UniversityModelFromJson(Map<String, dynamic> json) {
  return _UniversityModel.fromJson(json);
}

/// @nodoc
mixin _$UniversityModel {
  String get name => throw _privateConstructorUsedError;
  String get alphaTwoCode => throw _privateConstructorUsedError;
  String get stateProvince => throw _privateConstructorUsedError;
  String? get photo => throw _privateConstructorUsedError;
  List<String> get domains => throw _privateConstructorUsedError;
  List<String> get webPages => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UniversityModelCopyWith<UniversityModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UniversityModelCopyWith<$Res> {
  factory $UniversityModelCopyWith(
          UniversityModel value, $Res Function(UniversityModel) then) =
      _$UniversityModelCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String alphaTwoCode,
      String stateProvince,
      String? photo,
      List<String> domains,
      List<String> webPages});
}

/// @nodoc
class _$UniversityModelCopyWithImpl<$Res>
    implements $UniversityModelCopyWith<$Res> {
  _$UniversityModelCopyWithImpl(this._value, this._then);

  final UniversityModel _value;
  // ignore: unused_field
  final $Res Function(UniversityModel) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? alphaTwoCode = freezed,
    Object? stateProvince = freezed,
    Object? photo = freezed,
    Object? domains = freezed,
    Object? webPages = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      alphaTwoCode: alphaTwoCode == freezed
          ? _value.alphaTwoCode
          : alphaTwoCode // ignore: cast_nullable_to_non_nullable
              as String,
      stateProvince: stateProvince == freezed
          ? _value.stateProvince
          : stateProvince // ignore: cast_nullable_to_non_nullable
              as String,
      photo: photo == freezed
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      domains: domains == freezed
          ? _value.domains
          : domains // ignore: cast_nullable_to_non_nullable
              as List<String>,
      webPages: webPages == freezed
          ? _value.webPages
          : webPages // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$$_UniversityModelCopyWith<$Res>
    implements $UniversityModelCopyWith<$Res> {
  factory _$$_UniversityModelCopyWith(
          _$_UniversityModel value, $Res Function(_$_UniversityModel) then) =
      __$$_UniversityModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String alphaTwoCode,
      String stateProvince,
      String? photo,
      List<String> domains,
      List<String> webPages});
}

/// @nodoc
class __$$_UniversityModelCopyWithImpl<$Res>
    extends _$UniversityModelCopyWithImpl<$Res>
    implements _$$_UniversityModelCopyWith<$Res> {
  __$$_UniversityModelCopyWithImpl(
      _$_UniversityModel _value, $Res Function(_$_UniversityModel) _then)
      : super(_value, (v) => _then(v as _$_UniversityModel));

  @override
  _$_UniversityModel get _value => super._value as _$_UniversityModel;

  @override
  $Res call({
    Object? name = freezed,
    Object? alphaTwoCode = freezed,
    Object? stateProvince = freezed,
    Object? photo = freezed,
    Object? domains = freezed,
    Object? webPages = freezed,
  }) {
    return _then(_$_UniversityModel(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      alphaTwoCode: alphaTwoCode == freezed
          ? _value.alphaTwoCode
          : alphaTwoCode // ignore: cast_nullable_to_non_nullable
              as String,
      stateProvince: stateProvince == freezed
          ? _value.stateProvince
          : stateProvince // ignore: cast_nullable_to_non_nullable
              as String,
      photo: photo == freezed
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      domains: domains == freezed
          ? _value._domains
          : domains // ignore: cast_nullable_to_non_nullable
              as List<String>,
      webPages: webPages == freezed
          ? _value._webPages
          : webPages // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_UniversityModel implements _UniversityModel {
  _$_UniversityModel(
      {this.name = '',
      this.alphaTwoCode = '',
      this.stateProvince = '',
      this.photo,
      final List<String> domains = const [],
      final List<String> webPages = const []})
      : _domains = domains,
        _webPages = webPages;

  factory _$_UniversityModel.fromJson(Map<String, dynamic> json) =>
      _$$_UniversityModelFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String alphaTwoCode;
  @override
  @JsonKey()
  final String stateProvince;
  @override
  final String? photo;
  final List<String> _domains;
  @override
  @JsonKey()
  List<String> get domains {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_domains);
  }

  final List<String> _webPages;
  @override
  @JsonKey()
  List<String> get webPages {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_webPages);
  }

  @override
  String toString() {
    return 'UniversityModel(name: $name, alphaTwoCode: $alphaTwoCode, stateProvince: $stateProvince, photo: $photo, domains: $domains, webPages: $webPages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UniversityModel &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.alphaTwoCode, alphaTwoCode) &&
            const DeepCollectionEquality()
                .equals(other.stateProvince, stateProvince) &&
            const DeepCollectionEquality().equals(other.photo, photo) &&
            const DeepCollectionEquality().equals(other._domains, _domains) &&
            const DeepCollectionEquality().equals(other._webPages, _webPages));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(alphaTwoCode),
      const DeepCollectionEquality().hash(stateProvince),
      const DeepCollectionEquality().hash(photo),
      const DeepCollectionEquality().hash(_domains),
      const DeepCollectionEquality().hash(_webPages));

  @JsonKey(ignore: true)
  @override
  _$$_UniversityModelCopyWith<_$_UniversityModel> get copyWith =>
      __$$_UniversityModelCopyWithImpl<_$_UniversityModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UniversityModelToJson(
      this,
    );
  }
}

abstract class _UniversityModel implements UniversityModel {
  factory _UniversityModel(
      {final String name,
      final String alphaTwoCode,
      final String stateProvince,
      final String? photo,
      final List<String> domains,
      final List<String> webPages}) = _$_UniversityModel;

  factory _UniversityModel.fromJson(Map<String, dynamic> json) =
      _$_UniversityModel.fromJson;

  @override
  String get name;
  @override
  String get alphaTwoCode;
  @override
  String get stateProvince;
  @override
  String? get photo;
  @override
  List<String> get domains;
  @override
  List<String> get webPages;
  @override
  @JsonKey(ignore: true)
  _$$_UniversityModelCopyWith<_$_UniversityModel> get copyWith =>
      throw _privateConstructorUsedError;
}
