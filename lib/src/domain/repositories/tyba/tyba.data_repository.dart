import 'package:dio/dio.dart';
import 'package:tyba_test/src/data/models/university/university.model.dart';

abstract class TybaDataRepository {
  Future<List<UniversityModel>> getUniversities();

  Future<List<UniversityModel>> dioGetUniversities(Dio dio);
}
