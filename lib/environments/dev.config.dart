// import 'dart:io';
import 'dart:io';

import 'package:todo_flutter/environments/config.dart';

class DevConfig extends EnvironmentConfig {
  // DevConfig(super.api, super.mainApi, super.production);
  DevConfig()
      : super(
          api: getApiUrl(),
          // mainApi: _getMainApiUrl(),
          production: false,
          // ... initialize other configuration variables
        );

  static String getApiUrl() {
    if (Platform.isAndroid) {
      return 'http://10.0.2.2:4000/v1'; // Android emulator
    } else if (Platform.isIOS) {
      return 'http://127.0.0.1:4000/v1'; // iOS simulator
    }
    // Default to a fallback URL
    return 'http://localhost:4000/v1';
  }

  // static String _getMainApiUrl() {
  //   // Define the main API URL logic similarly as _getApiUrl()
  //   // You can customize this based on your needs
  //   if (Platform.isAndroid) {
  //     return 'http://10.0.2.2:4000/v1'; // Android emulator
  //   } else if (Platform.isIOS) {
  //     return 'http://127.0.0.1:4000/v1'; // iOS simulator
  //   }
  //   // Default to a fallback URL
  //   return 'http://localhost:4000/v1';
  // }
}
