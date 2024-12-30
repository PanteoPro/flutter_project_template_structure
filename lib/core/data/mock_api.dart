import 'package:corporative_messager/core/data/i_api.dart';
import 'package:corporative_messager/features/test/data/requests/test_request.dart';
import 'package:corporative_messager/features/test/data/responses/test_response.dart';

class MockApi implements IApi {
  @override
  Future<TestResponse> test(TestRequest request) {
    throw UnimplementedError();
  }
}
