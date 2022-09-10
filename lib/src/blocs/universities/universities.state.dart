part of 'universities.bloc.dart';

@freezed
class UniversitiesState with _$UniversitiesState {
  const factory UniversitiesState.initial() = _UniversitiesInitialState;

  const factory UniversitiesState.loaded({
    required List<UniversityModel> universities,
  }) = _UniversitiesLoadedState;

  const factory UniversitiesState.error({Object? error}) =
      _UniversitiesErrorState;
}
