import 'package:flutter/material.dart';
import 'package:spse_rozvrh/pages/home.dart';
import 'package:spse_rozvrh/utils/shared_prefs.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs().init();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}


