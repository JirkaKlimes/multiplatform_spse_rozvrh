import 'dart:async';
import 'package:flutter/material.dart';
import 'package:spse_rozvrh/pages/settings.dart';
import 'package:spse_rozvrh/pages/rozvrh.dart';
import 'package:spse_rozvrh/utils/colorTheme.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<RozvrhPageState> _key = GlobalKey();

  double toolbarHeight = 60;

  @override
  Widget build(BuildContext context) {
    RozvrhPage rozvrhpage = RozvrhPage(key: _key);

    Timer.periodic(const Duration(seconds: 60), (timer) {
      _key.currentState?.getData();
    });

    Scaffold scaffold = Scaffold(
        appBar: AppBar(
          title: Text(
            'Rozvrh hodin',
            style: TextStyle(fontSize: toolbarHeight * 0.4),
          ),
          backgroundColor: CustomColors().primaryBkg,
          toolbarHeight: toolbarHeight,
          elevation: 0,
          // leading: IconButton(
          //     onPressed: null,
          //     icon: Icon(
          //       Icons.menu,
          //       color: CustomColors().primaryText,
          //       size: toolbarHeight * 0.4,
          //     )),
          actions: [
            IconButton(
                onPressed: () => _key.currentState!.refresh(),
                icon: Icon(
                  Icons.update,
                  color: CustomColors().primaryText,
                  size: toolbarHeight * 0.4,
                )),
            IconButton(
                onPressed: (() => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SettingsPage()))
                    }),
                icon: Icon(
                  Icons.settings,
                  color: CustomColors().primaryText,
                  size: toolbarHeight * 0.4,
                )),
          ],
        ),
        backgroundColor: CustomColors().primaryBkg,
        body: rozvrhpage);

    return scaffold;
  }
}
