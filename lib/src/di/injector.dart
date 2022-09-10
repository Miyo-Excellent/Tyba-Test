import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tyba_test/src/blocs/universities/universities.bloc.dart';
import 'package:tyba_test/src/data/repositories/tyba/tyba.repository.dart';
import 'package:tyba_test/src/data/sources/tyba/tyba_api.source.dart';

/// A singleton instance of the GetIt class.
final GetIt injector = GetIt.instance;

/// It initializes all the dependencies
Future<void> initializeDependencies() async {
  injector.registerSingleton<List<CameraDescription>>(
    await availableCameras(),
    instanceName: 'NATIVE_CAMERAS',
  );

  injector.registerSingleton<Dio>(
    Dio(BaseOptions(contentType: "application/json")),
  );

  injector.registerSingleton<TybaApiApiSource>(TybaApiApiSource(injector()));

  injector
      .registerSingleton<TybaRepository>(TybaRepository(source: injector()));

  injector.registerSingleton<UniversitiesBloc>(
    UniversitiesBloc(
      camera: injector<List<CameraDescription>>(instanceName: 'NATIVE_CAMERAS')
          .first,
      tybaRepository: injector(),
    ),
  );
}
