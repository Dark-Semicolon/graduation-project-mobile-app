// import 'package:device_info_plus/device_info_plus.dart';
// import 'package:flutter/material.dart';
// import 'package:package_info_plus/package_info_plus.dart';
//
// class DeviceInfoPage extends StatelessWidget {
//   const DeviceInfoPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Device Information'),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: FutureBuilder<Map<String, dynamic>>(
//           future: getAndroidDeviceInfo(),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const Center(child: CircularProgressIndicator());
//             } else if (snapshot.hasError) {
//               return Center(child: Text('Error: ${snapshot.error}'));
//             } else {
//               Map<String, dynamic> data = snapshot.data!;
//               return Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'App Version: ${data['app_version']}',
//                     style: const TextStyle(
//                         fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 20),
//                   const Text(
//                     'Device Information:',
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 10),
//                   for (var entry in data['device_info'].entries)
//                     Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 5),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             '${entry.key}: ',
//                             style: const TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                           Expanded(
//                             child: Text('${entry.value}'),
//                           ),
//                         ],
//                       ),
//                     ),
//                 ],
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
//
//   Future<Map<String, dynamic>> getAndroidDeviceInfo() async {
//     DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
//     AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
//
//     Map<String, dynamic> data = {
//       'app_version': await _getAppVersion(),
//       'device_info': {
//         'version.release': androidInfo.version.release,
//         'version.securityPatch': androidInfo.version.securityPatch,
//         'version.sdkInt': androidInfo.version.sdkInt,
//         'brand': androidInfo.brand,
//         'model': androidInfo.model,
//         'device': androidInfo.device,
//         'board': androidInfo.board,
//         'bootloader': androidInfo.bootloader,
//         'display': androidInfo.display,
//         'fingerprint': androidInfo.fingerprint,
//         'hardware': androidInfo.hardware,
//         'host': androidInfo.host,
//         'id': androidInfo.id,
//         'manufacturer': androidInfo.manufacturer,
//         'product': androidInfo.product,
//         'supported32BitAbis': androidInfo.supported32BitAbis,
//         'supported64BitAbis': androidInfo.supported64BitAbis,
//         'supportedAbis': androidInfo.supportedAbis,
//         'tags': androidInfo.tags,
//         'type': androidInfo.type,
//         'isPhysicalDevice': androidInfo.isPhysicalDevice,
//         'systemFeatures': androidInfo.systemFeatures,
//       }
//     };
//     return data;
//   }
//
//   Future<String> _getAppVersion() async {
//     final packageInfo = await PackageInfo.fromPlatform();
//     return packageInfo.version;
//   }
// }
