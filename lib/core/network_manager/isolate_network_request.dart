import 'package:corporative_messager/core/network_manager/network_request.dart';
import 'package:dio/dio.dart';

class IsolateNetworkRequest<Model> {
  IsolateNetworkRequest({
    required this.request,
    this.objectParser,
    this.arrayParser,
    required this.dio,
    required this.headers,
  });
  final NetworkRequest request;

  final Model Function(Map<String, dynamic> json)? objectParser;
  final Model Function(List<dynamic> json)? arrayParser;
  final Dio dio;
  final Map<String, dynamic> headers;
}
