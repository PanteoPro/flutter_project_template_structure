import 'dart:io';

import 'package:corporative_messager/core/network_manager/isolate_network_request.dart';
import 'package:corporative_messager/core/network_manager/network_request.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

Future<Model> executeRequest<Model>(IsolateNetworkRequest request) async {
  try {
    final response = await request.dio.request(
      request.request.path,
      data: request.request.data,
      cancelToken: request.request.cancelToken,
      queryParameters: request.request.queryParams,
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          final toCheckStatus = status ?? 0;
          if (toCheckStatus >= 400) return false;
          return true;
        },
        method: request.request.type.name,
        headers: request.headers,
      ),
    );

    if (request.objectParser != null) {
      return request.objectParser!(response.data);
    }
    if (request.arrayParser != null) {
      return request.arrayParser!(response.data);
    }
    return response.data;
  } catch (error) {
    return Future.error(error);
  }
}

class DioNetworkManager {
  DioNetworkManager({
    required String baseUrl,
  }) {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
      ),
    );
  }

  late final Dio _dio;

  final Map<String, dynamic> _headers = {
    HttpHeaders.contentTypeHeader: ContentType.json.toString(),
  };

  void addDomainAuth(String token) {
    _headers.addAll({
      'Authorization': 'Bearer $token',
    });
  }

  Future<Model> performRequest<Model>({
    required NetworkRequest request,
    Model Function(Map<String, dynamic> json)? objectParser,
    Model Function(List<dynamic> json)? arrayParser,
  }) async {
    final isolateRequest = IsolateNetworkRequest(
      dio: _dio,
      request: request,
      objectParser: objectParser,
      arrayParser: arrayParser,
      headers: {..._headers, ...(request.headers ?? {})},
    );

    return compute(
      executeRequest,
      isolateRequest,
    );
  }
}
