import 'package:dio/dio.dart';

enum NetworkRequestType { GET, POST, PUT, PATCH, DELETE }

class NetworkRequest {
  const NetworkRequest({
    required this.type,
    required this.path,
    this.data,
    this.queryParams,
    this.headers,
    this.cancelToken,
  });
  final NetworkRequestType type;

  final String path;

  final dynamic data;

  final Map<String, dynamic>? queryParams;
  final Map<String, dynamic>? headers;

  final CancelToken? cancelToken;
}
