import 'package:api/api.dart';
import 'package:flutter/foundation.dart';
import 'package:assist_app/src/utils/notification.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_data/user_data.dart';

class DeviceController {
  DeviceController._();
  static final DeviceController _instance = DeviceController._();
  factory DeviceController() => _instance;

  bool initialized = false;

  Future<void> init() async {
    if (initialized) return;

    final prefs = await SharedPreferences.getInstance();

    if (prefs.getString("device_id") != null) {
      setDeviceId(prefs.getString("device_id")!);
      return;
    }

    final packageInfo = await PackageInfo.fromPlatform();

    final r = await Api.auth.mutations.getDeviceId(
      Input$SetDeviceIdInput(
        app_version: packageInfo.buildNumber,
        apns_token: await NotificationController().apnsToken,
        fcm_token: await NotificationController().deviceToken,
        os: os,
        locales: PlatformDispatcher.instance.locales
            .where((e) => e.countryCode != null)
            .map((e) => e.toString())
            .join(","),
      ),
    );

    await prefs.setString("device_id", r);

    setDeviceId(r);

    initialized = true;
  }

  String get os {
    if (kIsWasm) return "web";
    if (kIsWeb) return "web";
    if (defaultTargetPlatform == TargetPlatform.iOS) return "ios";
    if (defaultTargetPlatform == TargetPlatform.android) return "android";
    if (defaultTargetPlatform == TargetPlatform.linux) return "linux";
    if (defaultTargetPlatform == TargetPlatform.macOS) return "macos";
    if (defaultTargetPlatform == TargetPlatform.windows) return "windows";
    return "unknown";
  }
}
