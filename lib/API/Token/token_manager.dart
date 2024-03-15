import 'package:hive/hive.dart';

class TokenManager {
  static final String _boxName = 'tokenBox';

  static Future<void> setToken(String token) async {
    final box = await _getBox();
    await box.put('token', token);
  }

  static Future<String?> getToken() async {
    final box = await _getBox();
    return box.get('token');
  }

  static Future<void> deleteToken() async {
    final box = await _getBox();
    await box.delete('token');
  }

  static Future<Box> _getBox() async {
    return await Hive.openBox(_boxName);
  }
}
