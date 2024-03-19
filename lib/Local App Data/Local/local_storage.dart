import 'package:hive_flutter/hive_flutter.dart';

class HiveBoxManager {
  static Future<Box> _getBox(String boxName) async {
    return await Hive.openBox(boxName);
  }

  static Future<void> addToBox(String boxName, String key, dynamic value) async {
    final box = await _getBox(boxName);
    await box.put(key, value);
  }

  static Future<dynamic> readFromBox(String boxName, String key) async {
    final box = await _getBox(boxName);
    return box.get(key);
  }

  static Future<void> deleteFromBox(String boxName, String key) async {
    final box = await _getBox(boxName);
    await box.delete(key);
  }
}
// Example usage
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//
//   // Write data to Hive box
//   await HiveBoxManager.addToBox('userData', 'username', 'JohnDoe');
//
//   // Read data from Hive box
//   final storedUsername = await HiveBoxManager.readFromBox('userData', 'username');
//   print('Stored Username: $storedUsername');
//
//   // Delete data from Hive box
//   await HiveBoxManager.deleteFromBox('userData', 'username');
// }
