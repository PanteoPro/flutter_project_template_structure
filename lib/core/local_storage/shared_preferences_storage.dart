import 'package:corporative_messager/core/local_storage/i_local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesStorage implements ILocalStorage {
  SharedPreferencesStorage() {
    _pref = SharedPreferences.getInstance();
  }

  late final Future<SharedPreferences> _pref;

  @override
  Future<double?> getIncome() {
    throw UnimplementedError();
  }

  @override
  Future<void> setIncome() {
    throw UnimplementedError();
  }
}
