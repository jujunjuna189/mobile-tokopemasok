import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  LocalStorage._privateConstructor();
  static final LocalStorage instance = LocalStorage._privateConstructor();

  Future logout() async {
    final preference = await SharedPreferences.getInstance();
    preference.clear();
    return true;
  }

  Future<void> setSession(String key, Map<String, dynamic> value) async {
    final preference = await SharedPreferences.getInstance();
    if (preference.containsKey(key)) {
      preference.remove(key);
    }
    preference.setString(key, jsonEncode(value));
  }

  Future getSession(String key) async {
    final preference = await SharedPreferences.getInstance();
    if (preference.containsKey(key)) {
      final data = jsonDecode(preference.getString(key).toString());
      return data;
    } else {
      return null;
    }
  }

  Future removeSession(String key) async {
    final preference = await SharedPreferences.getInstance();
    if (preference.containsKey(key)) {
      preference.remove(key);
      return true;
    } else {
      return false;
    }
  }
}
