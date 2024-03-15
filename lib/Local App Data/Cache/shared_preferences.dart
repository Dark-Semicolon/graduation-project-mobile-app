import 'package:shared_preferences/shared_preferences.dart';

class CacheManager {
  static Future<bool> addToCache(String key, dynamic value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (value is String) {
      return await prefs.setString(key, value);
    } else if (value is int) {
      return await prefs.setInt(key, value);
    } else if (value is double) {
      return await prefs.setDouble(key, value);
    } else if (value is bool) {
      return await prefs.setBool(key, value);
    } else if (value is List<String>) {
      return await prefs.setStringList(key, value);
    }
    return false;
  }

  static Future<dynamic> readFromCache(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(key);
  }
 
  static Future<bool> deleteFromCache(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.remove(key);
  }
}

// Example usage
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await CacheManager.addToCache('username', 'JohnDoe');
//
//   dynamic cachedValue = await CacheManager.readFromCache('username');
//   print('Cached Value: $cachedValue');
//
//   await CacheManager.deleteFromCache('username');
// }
