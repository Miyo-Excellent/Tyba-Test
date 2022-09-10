import 'package:dio/dio.dart';
import 'package:tyba_test/src/data/models/university/university.model.dart';
import 'package:tyba_test/src/data/sources/tyba/tyba_api.source.dart';
import 'package:tyba_test/src/domain/repositories/tyba/tyba.data_repository.dart';

class TybaRepository implements TybaDataRepository {
  final TybaApiApiSource source;

  TybaRepository({required this.source});

  @override
  Future<List<UniversityModel>> getUniversities() async {
    return source.getUniversities();
  }

  @override
  Future<List<UniversityModel>> dioGetUniversities(Dio dio) async {
    final List<UniversityModel> universities = [];

    final Response<dynamic> response =
    await dio.get('${TybaApiPaths.base}${TybaApiPaths.universities}');

    return universities;
  }
}
