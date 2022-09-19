import 'dart:async';
import 'package:flutter/material.dart';
import 'package:spse_rozvrh/pages/settings.dart';
import 'package:spse_rozvrh/pages/rozvrh.dart';
import 'package:spse_rozvrh/utils/colorTheme.dart';
import 'package:spse_rozvrh/utils/shared_prefs.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<RozvrhPageState> _key = GlobalKey();

  String dataAge() {
    double diff =
        (DateTime.now().millisecondsSinceEpoch - SharedPrefs().lastUpdateTime) *
            1.0;
    // in seconds
    diff /= 1000;
    if (diff < 60) {
      return '${diff.round()}s';
    }
    // in minutes
    diff /= 60;
    if (diff < 60) {
      return '${diff}m';
    }
    // in hours
    diff /= 60;
    if (diff < 24) {
      return '${diff}h';
    }
    // in days
    diff /= 24;
    if (diff < 7) {
      return '${diff}d';
    }
    // in weeks
    diff /= 7;
    return '${diff}w';
  }

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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                (DateTime.now().millisecondsSinceEpoch -
                                SharedPrefs().lastUpdateTime) /
                            1000 >
                        60
                    ? SizedBox(
                        width: 30,
                        height: 30,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            dataAge(),
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                      )
                    : const SizedBox(),
                SizedBox(
                  width: 8,
                  height: 8,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: (DateTime.now().millisecondsSinceEpoch -
                                        SharedPrefs().lastUpdateTime) /
                                    1000 >
                                60
                            ? CustomColors().notLive
                            : CustomColors().live),
                  ),
                ),
              ],
            ),
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
