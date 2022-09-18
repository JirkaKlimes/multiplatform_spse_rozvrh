import 'package:shared_preferences/shared_preferences.dart';

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
  
  String get encodedData => _sharedPrefs.getString('encodedData') ?? "";
  set encodedData(String data) {
    _sharedPrefs.setString('encodedData', data);
  }

  String get theme => _sharedPrefs.getString('theme') ?? "dark";
  set theme(String value) {
    _sharedPrefs.setString('theme', value);
  }

}