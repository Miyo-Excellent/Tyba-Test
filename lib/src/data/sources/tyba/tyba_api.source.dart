import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tyba_test/src/data/models/university/university.model.dart';

part 'tyba_api.source.g.dart';

part 'tyba_api_paths.dart';

@RestApi(baseUrl: TybaApiPaths.base)
abstract class TybaApiApiSource {
  factory TybaApiApiSource(Dio dio, {String baseUrl}) = _TybaApiApiSource;

  @GET(TybaApiPaths.universities)
  Future<List<UniversityModel>> getUniversities();
}
