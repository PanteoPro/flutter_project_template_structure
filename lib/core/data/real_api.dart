import 'package:corporative_messager/core/data/i_api.dart';
import 'package:corporative_messager/core/network_manager/network_manager.dart';
import 'package:corporative_messager/features/test/data/requests/test_request.dart';
import 'package:corporative_messager/features/test/data/responses/test_response.dart';

class RealApi implements IApi {
  const RealApi({required this.dioNetworkManager});
  final DioNetworkManager dioNetworkManager;

  @override
  Future<TestResponse> test(TestRequest request) {
    return dioNetworkManager.performRequest(
      request: request,
      objectParser: TestResponse.fromJson,
    );
  }
}
