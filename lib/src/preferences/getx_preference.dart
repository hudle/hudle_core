import 'package:get_storage/get_storage.dart';

import 'app_preferences.dart';

@Deprecated("Do not use get storage anymore, Use shared preference")
class GetXPreference implements AppPreference {

  late GetStorage storage;

  GetXPreference() {
    _init();
    storage = GetStorage();
  }

  _init() async {
    await GetStorage.init();
  }

  @override
  bool getBool(String key) {
    return storage.read(key);
  }

  @override
  double getDouble(String key) {
    return storage.read(key);
  }

  @override
  int getInt(String key) {
    return storage.read(key);
  }

  @override
  String getString(String key) {
    return storage.read(key);
  }

  @override
  dynamic getDynamic(String key) {
    return storage.read(key);
  }

  @override
  void putBool(String key, bool value) {
    storage.write(key, value);
  }

  @override
  void putDouble(String key, double value) {
    storage.write(key, value);
  }

  @override
  void putInt(String key, int value) {
    storage.write(key, value);
  }

  @override
  void putString(String key, String value) {
    storage.write(key, value);
  }

  @override
  void putDynamic(String key, value) {
    storage.write(key, value);
  }

  @override
  void removeKey(String key) {
    storage.remove(key);
  }

  @override
  void clear() {
    storage.erase();
  }

}