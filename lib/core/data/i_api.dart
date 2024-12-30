import 'package:corporative_messager/features/test/data/requests/test_request.dart';
import 'package:corporative_messager/features/test/data/responses/test_response.dart';

abstract class IApi {
  Future<TestResponse> test(TestRequest request);
}
