import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:gooddhan/authentication/infrastructure/authenticator.dart';

class AuthInterceptor extends Interceptor {
  final Authenticator _authenticator;

  AuthInterceptor(this._authenticator);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    debugPrint("Request: ${options.method}:${options.uri}");

    final credential = await _authenticator.getSignedCredentials();

    final modifiedOptions = options
      ..headers.addAll(
        credential == null ? {} : {'Authorization': 'Bearer $credential'},
      );
    debugPrint(modifiedOptions.headers.toString());
    handler.next(modifiedOptions);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint("___On Reponse___");
    debugPrint("Response:${response.statusCode} ${response.data}");
    // print("data: ${response.headers}");
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    debugPrint("___On Error___");
    debugPrint("Error: ${err.response?.data}");
    super.onError(err, handler);
  }
}
