import 'package:t_core/config/firebase_config.dart';
import 'package:t_core/config/remote_config.dart';

enum Mode { Debug, Production }

class Config {
  static const Map<String, dynamic> _debug = <String, dynamic>{
    'api_host': 'https://reqres.in',
  };

  static const Map<String, dynamic> _production = <String, dynamic>{
    'api_host': 'https://reqres.in',
  };

  static RemoteConfig _config;

  static void init(Mode mode) {
    if (Mode.Debug == mode) {
      _config = RemoteConfig(_debug);
    } else {
      _config = FireBaseRemoteConfig(_production);
    }
  }

  static int getInt(String key) {
    return _config.getInt(key);
  }

  static String getString(String key) {
    return _config.getString(key);
  }

  static double getDouble(String key) {
    return _config.getDouble(key);
  }

  static bool getBool(String key) {
    return _config.getBool(key);
  }

  static Map<String, dynamic> getAll() {
    return _config.getAll();
  }
}
