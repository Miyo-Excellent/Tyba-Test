import 'package:camera/camera.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tyba_test/src/core/utils/logger.dart';
import 'package:tyba_test/src/data/models/university/university.model.dart';
import 'package:tyba_test/src/data/repositories/tyba/tyba.repository.dart';

part 'universities.bloc.freezed.dart';

part 'universities.event.dart';

part 'universities.state.dart';

class UniversitiesBloc extends Bloc<UniversitiesEvent, UniversitiesState> {
  final CameraDescription _camera;
  final TybaRepository _tybaRepository;

  late final CameraController _cameraController = CameraController(
    // Get a specific camera from the list of available cameras.
    _camera,
    // Define the resolution to use.
    ResolutionPreset.ultraHigh,
  );

  final BehaviorSubject<XFile> _cameraFileController = BehaviorSubject<XFile>();

  CameraController get cameraController => _cameraController;

  XFile get cameraFile => _cameraFileController.value;

  bool get isCameraInitialized => _cameraController.value.isInitialized;

  bool get isCameraTakingPicture => _cameraController.value.isTakingPicture;

  Future<void> Function() get cameraInitializer => _cameraController.initialize;

  Future<void> Function() get cameraDispose => _cameraController.dispose;

  Stream<XFile> get cameraFileStream => _cameraFileController.stream;

  Function(XFile) get changeCameraFile => _cameraFileController.sink.add;

  UniversitiesBloc({
    required CameraDescription camera,
    required TybaRepository tybaRepository,
  })  : _camera = camera,
        _tybaRepository = tybaRepository,
        super(const UniversitiesState.initial()) {
    on<UniversitiesEvent>(
      (UniversitiesEvent event, Emitter<UniversitiesState> emit) {
        emit(
          event.when(
            initial: _initial,
            fetchData: _fetchData,
            loaded: _loaded,
            addPhoto: _addPhoto,
          ),
        );
      },
    );
  }

  UniversitiesState _initial() {
    try {
      logger.fine('Universities Bloc Event: Initial');
      return const UniversitiesState.initial();
    } catch (error) {
      logger.error('Universities Bloc Event: Error');
      logger.error(error);
      return UniversitiesState.error(error: error);
    }
  }

  UniversitiesState _addPhoto(UniversityModel university) {
    try {
      logger.fine(
          'Universities Bloc Event: Adding photo to ${university.name}...');

      Future.delayed(Duration.zero).then((_) async {
        await cameraInitializer();
      });

      logger.fine(
          'Universities Bloc Event: Photo added into ${university.name}...');
      return state;
    } catch (error) {
      logger.error('Universities Bloc Event: Error');
      logger.error(error);
      return UniversitiesState.error(
        error: error,
      );
    }
  }

  UniversitiesState _fetchData(
    Future<void> Function(List<UniversityModel> universities) onDone,
  ) {
    try {
      logger.fine('Universities Bloc Event: Fetching data...');

      Future.delayed(Duration.zero).then((_) async {
        final List<UniversityModel> universities =
            await _tybaRepository.getUniversities();

        loaded(universities);

        return onDone(universities);
      });

      logger.fine('Universities Bloc Event: Data fetched!');
      return state;
    } catch (error) {
      logger.error('Universities Bloc Event: Error');
      logger.error(error);
      return UniversitiesState.error(
        error: error,
      );
    }
  }

  UniversitiesState _loaded(List<UniversityModel> universities) {
    try {
      logger.fine('Universities Bloc Event: Loaded');

      return UniversitiesState.loaded(universities: universities);
    } catch (error) {
      logger.error('Universities Bloc Event: Error');
      logger.error(error);
      return UniversitiesState.error(
        error: error,
      );
    }
  }

  void initial() => add(const UniversitiesEvent.initial());

  void addPhoto(UniversityModel university) =>
      add(UniversitiesEvent.addPhoto(university: university));

  void fetchData(
    Future<void> Function(List<UniversityModel> universities) onDone,
  ) =>
      add(UniversitiesEvent.fetchData(onDone));

  void loaded(List<UniversityModel> universities) =>
      add(UniversitiesEvent.loaded(universities));

  Future<void> takePicture({
    required void Function(XFile picture) onDone,
    required void Function(dynamic error) onError,
  }) async {
    if (!isCameraInitialized) return;
    if (isCameraTakingPicture) return;

    try {
      await cameraController.setFlashMode(FlashMode.off);

      final XFile picture = await cameraController.takePicture();

      changeCameraFile(picture);
      onDone(picture);
    } on CameraException catch (error) {
      logger.error('Error occured while taking picture: $error');
      onError(error);
    }
  }
}
