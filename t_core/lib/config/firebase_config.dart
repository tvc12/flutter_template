import 'package:t_core/t_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart' as frc;

class FireBaseRemoteConfig extends RemoteConfig {
  frc.RemoteConfig _conf;

  FireBaseRemoteConfig(Map<String, dynamic> value) : super(value) {
    _init();
  }

  void _init() async {
    try {
      _conf = await frc.RemoteConfig.instance;
      await _conf.setDefaults(this.defaultValue ?? <String, dynamic>{});
      await _conf.fetch(expiration: Duration(hours: 1));
      await _conf.activateFetched();
      _conf.addListener(() {
        getAll().forEach((String key, dynamic value) {
          Log.error("Key: " + key + " Value: " + value.toString());
        });
      });
    } catch (e) {
      Log.error('Fail to fetch config from firebase: $e');
    }
  }

  @override
  int getInt(String key) {
    return _conf == null ? defaultValue[key] : _conf.getInt(key);
  }

  @override
  String getString(String key) {
    return _conf == null ? defaultValue[key] : _conf.getString(key);
  }

  @override
  double getDouble(String key) {
    return _conf == null ? defaultValue[key] : _conf.getDouble(key);
  }

  @override
  bool getBool(String key) {
    return _conf == null ? defaultValue[key] : _conf.getBool(key);
  }

  @override
  Map<String, dynamic> getAll() {
    return _conf == null ? defaultValue : _conf.getAll();
  }
}
