import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';

class TokenManager {
  static const String _boxName = 'tokenBox';

  /// Sets the token in the Hive box.
  static Future<void> setToken(String token) async {
    try {
      final box = await _getBox();
      await box.put('token', token);
    } catch (e) {
      // Handle the error
      debugPrint('Error setting token: $e');
    }
  }

  /// Retrieves the token from the Hive box.
  static Future<String?> getToken() async {
    try {
      final box = await _getBox();
      return box.get('token');
    } catch (e) {
      // Handle the error
      debugPrint('Error getting token: $e');
      return null;
    }
  }

  /// Deletes the token from the Hive box.
  static Future<void> deleteToken() async {
    try {
      final box = await _getBox();
      await box.delete('token');
    } catch (e) {
      // Handle the error
      debugPrint('Error deleting token: $e');
    }
  }

  /// Opens the Hive box.
  static Future<Box> _getBox() async {
    try {
      return await Hive.openBox(_boxName);
    } catch (e) {
      // Handle the error
      debugPrint('Error opening box: $e');
      rethrow;
    }
  }

  /// Logs out the user by deleting the token and navigating to the login page.
  static Future<void> logoutUser(BuildContext context) async {
    final navigator = GoRouter.of(context);

    try {
      await deleteToken();
      navigator.go('/LoginPage');
    } catch (e) {
      // Handle the error
      debugPrint('Error during logout: $e');
    }
  }
}

