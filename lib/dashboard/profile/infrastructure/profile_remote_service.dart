import 'package:dio/dio.dart';

class ProfileRemoteService {
  final Dio _dio;
  final ProfileRemoteService _profileRemoteService;

  ProfileRemoteService(this._dio, this._profileRemoteService);
}
