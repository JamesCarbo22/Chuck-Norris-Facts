import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:chuck_norris_facts/data/network/http_exception.dart';

enum Type {
  get,
  put,
  post,
  delete,
}

enum Status {
  ok,
  accepted,
  badRequest,
  unauthorized,
  notFound,
  created,
  noContent
}

final _statusMap = <int, Status>{
  200: Status.ok,
  201: Status.created,
  202: Status.accepted,
  204: Status.noContent,
  400: Status.badRequest,
  401: Status.unauthorized,
  404: Status.notFound,
};

class ApiService {
  ApiService(this.dio) {
    if (kDebugMode) {
      if (!Platform.environment.containsKey('FLUTTER_TEST')) {
        (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
            (HttpClient client) {
          client.badCertificateCallback =
              (X509Certificate cert, String host, int port) => true;
          return client;
        };
      }

      dio.interceptors.add(
        LogInterceptor(
          responseBody: false,
          error: true,
          requestHeader: true,
          responseHeader: true,
          request: true,
          requestBody: true,
        ),
      );
    }
  }

  final Dio dio;

  Future<dynamic> get({
    required String path,
    required List<Status> expected,
    Map<String, dynamic>? queryParameters,
  }) async =>
      await _request(
        type: Type.get,
        path: path,
        expected: expected,
        queryParameters: queryParameters,
      );

  Future<dynamic> delete({
    required String path,
    required List<Status> expected,
    Map<String, dynamic>? queryParameters,
  }) async =>
      await _request(
        type: Type.delete,
        path: path,
        expected: expected,
        queryParameters: queryParameters,
      );

  Future<dynamic> post({
    required String path,
    required List<Status> expected,
    String? auth,
    String? jsonBody,
    Map<String, dynamic>? queryParameters,
  }) async =>
      await _request(
        type: Type.post,
        path: path,
        expected: expected,
        auth: auth,
        jsonBody: jsonBody,
        queryParameters: queryParameters,
      );

  Future<dynamic> _request({
    required Type type,
    required String path,
    required List<Status> expected,
    String? auth,
    String? jsonBody,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      late Response response;
      final options = Options();
      switch (type) {
        case Type.get:
          response = await dio.get(
            path,
            queryParameters: queryParameters,
          );
          break;
        case Type.put:
          break;
        case Type.post:
          response = await dio.post(
            path,
            data: jsonBody,
            queryParameters: queryParameters,
            options: options,
          );
          break;
        case Type.delete:
          response = await dio.delete(path, queryParameters: queryParameters);
          break;
      }
      if (response.statusCode != null) {
        if (_statusMap[response.statusCode] == null) {
          throw HttpException(
            statusCode: response.statusCode!,
            statusMessage: 'Unknown status: ${response.statusMessage}',
          );
        }
        if (expected.contains(_statusMap[response.statusCode])) {
          return response.data;
        }
      }
      throw HttpException(
        statusCode: 0,
        statusMessage: response.statusMessage ?? '',
        responseBody: response.data is String ? response.data : '',
      );
    } on DioError catch (d) {
      if (d.response != null && d.response!.statusCode != null) {
        throw HttpException(
          statusCode: d.response!.statusCode!,
          statusMessage: d.response!.statusMessage ?? '',
        );
      } else {
        rethrow;
      }
    }
  }
}
