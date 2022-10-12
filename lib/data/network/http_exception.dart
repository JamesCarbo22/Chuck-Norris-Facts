class HttpException implements Exception {
  HttpException({
    required this.statusCode,
    required this.statusMessage,
    this.responseBody,
  });

  final int statusCode;
  final String statusMessage;
  final String? responseBody;
}
