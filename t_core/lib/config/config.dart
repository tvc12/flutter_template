import 'package:t_core/config/firebase_config.dart';
import 'package:t_core/config/remote_config.dart';

enum Mode { Debug, Production }

class Config {
  static const Map<String, dynamic> _debug = {
    'api_host': '',
  };

  static const Map<String, dynamic> _production = {
    'api_host': '',
  };

  static RemoteConfig _config;

  static void init(Mode mode) {
    if (Mode.Debug == mode) {
      _config = RemoteConfig(_debug);
    } else {
      _config = FireBaseRemoteConfig(_production);
    }
  }

  int getInt(String key) {
    return _config.getInt(key);
  }

  String getString(String key) {
    return _config.getString(key);
  }

  double getDouble(String key) {
    return _config.getDouble(key);
  }

  bool getBool(String key) {
    return _config.getBool(key);
  }

  Map<String, dynamic> getAll() {
    return _config.getAll();
  }
}
