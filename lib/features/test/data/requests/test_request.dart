import 'package:corporative_messager/core/network_manager/network_request.dart';

class TestRequest extends NetworkRequest {
  TestRequest({
    required this.guid,
  }) : super(type: NetworkRequestType.GET, path: '/api/test');

  final String guid;

  @override
  Map<String, dynamic>? get queryParams => {
        "guid": guid,
      };

  @override
  get data => {
        "guid": guid,
      };
}
