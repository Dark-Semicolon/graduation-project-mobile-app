import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';

class TokenManager {
  static const String _boxName = 'tokenBox';

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

  static Future<void> logoutUser(BuildContext context) async {
    await deleteToken();
    GoRouter.of(context).go('/LoginPage');
  }
}
