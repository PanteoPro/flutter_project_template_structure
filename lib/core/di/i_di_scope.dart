import 'package:corporative_messager/core/data/i_api.dart';
import 'package:corporative_messager/core/local_storage/i_local_storage.dart';

abstract class IDiScope {
  Future<void> init();

  IApi get apiClient;
  ILocalStorage get localStorage;
}
