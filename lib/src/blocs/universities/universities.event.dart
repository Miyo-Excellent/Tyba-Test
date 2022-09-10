part of 'universities.bloc.dart';

@freezed
class UniversitiesEvent with _$UniversitiesEvent {
  const factory UniversitiesEvent.initial() = _UniversitiesInitialEvent;

  const factory UniversitiesEvent.fetchData(
    Future<void> Function(List<UniversityModel> universities) onDone,
  ) = _UniversitiesFetchDataEvent;

  const factory UniversitiesEvent.addPhoto({
    required UniversityModel university,
  }) = _UniversitiesAddPhotoEvent;

  const factory UniversitiesEvent.loaded(List<UniversityModel> universities) =
      _UniversitiesLoadedEvent;
}
