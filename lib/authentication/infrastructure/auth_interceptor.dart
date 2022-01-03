import 'package:dio/dio.dart';
import 'package:gooddhan/authentication/infrastructure/authenticator.dart';

class AuthInterceptor extends Interceptor {
  final Authenticator _authenticator;

  AuthInterceptor(this._authenticator);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final credential = await _authenticator.getSignedCredentials();
    final modifiedOptions = options
      ..headers.addAll(
        credential == null ? {} : {'Authorization': 'bearer $credential'},
      );
    handler.next(modifiedOptions);
    super.onRequest(options, handler);
  }
}
