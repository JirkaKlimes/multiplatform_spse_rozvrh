import 'dart:async';
import 'package:flutter/material.dart';
import 'package:spse_rozvrh/pages/settings.dart';
import 'package:spse_rozvrh/pages/rozvrh.dart';
import 'package:spse_rozvrh/utils/colorTheme.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<RozvrhPageState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    RozvrhPage rozvrhpage = RozvrhPage(key: _key);


    Timer.periodic(const Duration(seconds: 60), (timer) {
    _key.currentState?.getData();
    });


    Scaffold scaffold = Scaffold(
        appBar: AppBar(
          title: const Text('Rozvrh Hodin'),
          backgroundColor: CustomColors().primaryBkg,
          toolbarHeight: 68,
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () => _key.currentState!.refresh(),
                icon: Icon(
                  Icons.refresh,
                  color: CustomColors().primaryText,
                )),
            IconButton(
                onPressed: (() => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SettingsPage()))
                    }),
                icon: Icon(
                  Icons.more_vert,
                  color: CustomColors().primaryText,
                )),
          ],
        ),
        backgroundColor: CustomColors().primaryBkg,
        body: rozvrhpage);
    
    return scaffold;
  }
}
