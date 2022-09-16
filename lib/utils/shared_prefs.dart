import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SharedPrefs {
  static late SharedPreferences _sharedPrefs;

  factory SharedPrefs() => SharedPrefs._internal();

  SharedPrefs._internal();

  Future<void> init() async {
    _sharedPrefs = await SharedPreferences.getInstance();
  }

  String get username => _sharedPrefs.getString('username') ?? "";
  set username(String value) {
    _sharedPrefs.setString('username', value);
  }

  int get lastUpdateTime => _sharedPrefs.getInt('lastUpdateTime') ?? 0;
  set lastUpdateTime(int value) {
    _sharedPrefs.setInt('lastupdatetime', value);
  }

}