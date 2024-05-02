import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';

Future<Map<String, dynamic>> getAndroidDeviceInfo() async {
  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;

  Map<String, dynamic> data = {
    'app_version': await _getAppVersion(), // Call a function to get app version
    'device_info': {
      'version.release': androidInfo.version.release,
      'version.securityPatch': androidInfo.version.securityPatch,
      'version.sdkInt': androidInfo.version.sdkInt,
      'brand': androidInfo.brand,
      'model': androidInfo.model,
      'device': androidInfo.device,
      'board': androidInfo.board,
      'bootloader': androidInfo.bootloader,
      'display': androidInfo.display,
      'fingerprint': androidInfo.fingerprint,
      'hardware': androidInfo.hardware,
      'host': androidInfo.host,
      'id': androidInfo.id,
      'manufacturer': androidInfo.manufacturer,
      'product': androidInfo.product,
      'supported32BitAbis': androidInfo.supported32BitAbis,
      'supported64BitAbis': androidInfo.supported64BitAbis,
      'supportedAbis': androidInfo.supportedAbis,
      'tags': androidInfo.tags,
      'type': androidInfo.type,
      'isPhysicalDevice': androidInfo.isPhysicalDevice,
      'systemFeatures': androidInfo.systemFeatures,
    }
  };
  return data;
}

Future<String> _getAppVersion() async {
  final packageInfo = await PackageInfo.fromPlatform();
  return packageInfo.version;
}
