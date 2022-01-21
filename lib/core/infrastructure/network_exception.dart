class RestApiException implements Exception {
  final int? errorCode;
  final String message;

  RestApiException(this.errorCode, {this.message = ""});
}
