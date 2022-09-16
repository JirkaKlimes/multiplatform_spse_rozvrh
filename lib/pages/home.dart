import 'package:flutter/material.dart';
import 'package:spse_rozvrh/pages/settings.dart';
import 'package:spse_rozvrh/pages/rozvrh.dart';
import 'package:spse_rozvrh/utils/colorTheme.dart';

class HomePage extends StatelessWidget {

  final GlobalKey<RozvrhPageState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    RozvrhPage rozvrhpage = RozvrhPage(key: _key);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Rozvrh Hodin'),
          backgroundColor: CustomColors().color1,
          toolbarHeight: 68,
          actions: [
            IconButton(
                onPressed: () => _key.currentState!.refresh(),
                icon: const Icon(
                  Icons.refresh,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: (() => {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => SettingsPage()
                    ))}),
                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.white,
                )),
          ],
        ),
        backgroundColor: CustomColors().color1,
        body: rozvrhpage
        );
  }
}
