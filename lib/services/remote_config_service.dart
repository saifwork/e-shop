import 'package:firebase_remote_config/firebase_remote_config.dart';

class RemoteConfigService {
  final FirebaseRemoteConfig _remoteConfig;

  RemoteConfigService({FirebaseRemoteConfig? remoteConfig})
      : _remoteConfig = remoteConfig ?? FirebaseRemoteConfig.instance;

  Future<void> fetchAndActivate() async {
    try {
      _remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(minutes: 1),
          minimumFetchInterval: const Duration(seconds: 5),
        ),
      );
      await _remoteConfig.fetch();
      await _remoteConfig.activate();

      // Log all remote config values
      logRemoteConfigValues();

      // Print the fetched value
      print('Fetched isDiscounted: ${getIsDiscountedPrice()}');
    } catch (e) {
      print("Failed to fetch Remote Config: $e");
    }
  }

  // Get boolean value for showing discounted price
  bool getIsDiscountedPrice() {
    return _remoteConfig.getBool('isDiscounted');
  }

  void logRemoteConfigValues() {
    _remoteConfig.getAll().forEach((key, value) {
      print('$key: ${value.asString()}'); // Log each key and its value
    });
  }
}
