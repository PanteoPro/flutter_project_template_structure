import 'package:corporative_messager/core/data/i_api.dart';
import 'package:corporative_messager/core/data/mock_api.dart';
import 'package:corporative_messager/core/di/i_di_scope.dart';
import 'package:corporative_messager/core/local_storage/i_local_storage.dart';
import 'package:corporative_messager/core/local_storage/shared_preferences_storage.dart';

class DiMockScope implements IDiScope {
  @override
  Future<void> init() async {
    _apiClient = MockApi();
    _localStorage = SharedPreferencesStorage();
  }

  @override
  IApi get apiClient => _apiClient;
  late final IApi _apiClient;

  @override
  ILocalStorage get localStorage => _localStorage;
  late final ILocalStorage _localStorage;
}
