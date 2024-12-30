import 'package:corporative_messager/core/data/i_api.dart';
import 'package:corporative_messager/core/data/real_api.dart';
import 'package:corporative_messager/core/di/i_di_scope.dart';
import 'package:corporative_messager/core/local_storage/i_local_storage.dart';
import 'package:corporative_messager/core/local_storage/shared_preferences_storage.dart';
import 'package:corporative_messager/core/network_manager/network_manager.dart';

class DiScope implements IDiScope {
  @override
  Future<void> init() async {
    _dioNetworkManager = DioNetworkManager(baseUrl: '');
    _apiClient = RealApi(dioNetworkManager: _dioNetworkManager);
    _localStorage = SharedPreferencesStorage();
  }

  late final DioNetworkManager _dioNetworkManager;

  @override
  IApi get apiClient => _apiClient;
  late final IApi _apiClient;

  @override
  ILocalStorage get localStorage => _localStorage;
  late final ILocalStorage _localStorage;
}
