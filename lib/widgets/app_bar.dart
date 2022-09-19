import 'package:flutter/material.dart';
import 'package:spse_rozvrh/utils/colorTheme.dart';
import 'package:spse_rozvrh/utils/shared_prefs.dart';
import 'package:spse_rozvrh/pages/settings.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  // final GlobalKey<RozvrhPageState> key;
  final Function refreshCallback;

  // const MyAppBar(this.key, this.refreshCallback);
  const MyAppBar(this.refreshCallback, {Key? key}) : super(key: key);

  @override
  MyAppBarState createState() => MyAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class MyAppBarState extends State<MyAppBar> {
  double toolbarHeight = 60;

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
      return '${diff.round()}m';
    }
    // in hours
    diff /= 60;
    if (diff < 24) {
      return '${diff.round()}h';
    }
    // in days
    diff /= 24;
    if (diff < 7) {
      return '${diff.round()}d';
    }
    // in weeks
    diff /= 7;
    return '${diff.round()}w';
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
            const SizedBox(
              width: 10,
            ),
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
            onPressed: () => widget.refreshCallback(),
            icon: Icon(
              Icons.update,
              color: CustomColors().primaryText,
              size: toolbarHeight * 0.4,
            )),
        IconButton(
            onPressed: (() => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SettingsPage()))
                }),
            icon: Icon(
              Icons.settings,
              color: CustomColors().primaryText,
              size: toolbarHeight * 0.4,
            )),
      ],
    );
  }

  void refresh() {
    setState(() {});
  }
}
