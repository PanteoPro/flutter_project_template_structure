import 'package:corporative_messager/core/data/i_api.dart';
import 'package:corporative_messager/features/test/data/requests/test_request.dart';
import 'package:corporative_messager/features/test/data/responses/test_response.dart';

class TestRepository {
  const TestRepository({
    required IApi api,
  }) : _api = api;
  final IApi _api;
  Future<TestResponse> test(String guid) => _api.test(
        TestRequest(guid: guid),
      );
}
