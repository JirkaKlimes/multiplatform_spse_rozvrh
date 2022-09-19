import 'dart:async';
import 'package:flutter/material.dart';
import 'package:spse_rozvrh/pages/rozvrh.dart';
import 'package:spse_rozvrh/utils/colorTheme.dart';
import 'package:spse_rozvrh/widgets/app_bar.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<RozvrhPageState> _keyRozvrh = GlobalKey();
  final GlobalKey<MyAppBarState> _keyAppBar = GlobalKey();

  double toolbarHeight = 60;

  void refreshCallBack() {
    _keyRozvrh.currentState!.refresh();
    _keyAppBar.currentState?.refresh();
  }

  @override
  Widget build(BuildContext context) {
    RozvrhPage rozvrhpage = RozvrhPage(key: _keyRozvrh);
    MyAppBar appBar = MyAppBar(
      refreshCallBack,
      key: _keyAppBar,
    );

    Timer.periodic(const Duration(seconds: 60), (timer) {
      _keyRozvrh.currentState?.getData();
    });

    Scaffold scaffold = Scaffold(
        appBar: appBar,
        backgroundColor: CustomColors().primaryBkg,
        body: rozvrhpage);

    return scaffold;
  }
}
