abstract class AppPreference {
  void putString(String key, String value);

  void putInt(String key, int value);

  void putDouble(String key, double value);

  void putBool(String key, bool value);

  void putDynamic(String key, dynamic value);

  void clear();

  void removeKey(String key);

  String getString(String key);

  double getDouble(String key);

  int getInt(String key);

  bool getBool(String key);

  dynamic getDynamic(String key);
}
