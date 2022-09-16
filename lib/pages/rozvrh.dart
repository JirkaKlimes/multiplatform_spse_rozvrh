import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:spse_rozvrh/utils/shared_prefs.dart';
import 'package:spse_rozvrh/widgets/day_picker.dart';
import 'package:spse_rozvrh/widgets/week_view.dart';

class RozvrhPage extends StatefulWidget {
  RozvrhPage({Key? key}) : super(key: key);

  RozvrhPageState createState() => RozvrhPageState();
  Map data = {};
  int selected = DateTime.now().weekday - 1;

  PageController pageController = PageController(initialPage: DateTime.now().weekday - 1);

}

class RozvrhPageState extends State<RozvrhPage> {
  void changeSelected(index) {
    setState(() {
      widget.selected = index;
    });
  }

  Widget build(BuildContext context) {
    DatePicker datePicker =
        DatePicker(widget.selected, widget.data, changeSelected);
    // var pageController = PageController(initialPage: widget.selected);
    WeekView weekView = WeekView(widget.selected, widget.data, changeSelected, widget.pageController);
    refresh();
    // ignore: prefer_const_constructors
    if (widget.data.isEmpty) {
      return const Scaffold(
        backgroundColor: Colors.black,
      );
    } else {
      return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [datePicker, weekView],
        ),
      );
    }
  }

  Future<void> _pullRefresh() async {
    refresh();
  }

  void updateData() async {
    var username = SharedPrefs().username;
    var time = DateTime.now().millisecondsSinceEpoch;
    // print(time);
    Map payload = {
      "cmd": "get",
      "data": {"id": "!$username", "date": time}
    };

    String encoded = json.encode(payload);

    var response = await http.post(Uri.parse('http://rozvrh.spse.cz/index.php'),
        body: encoded);
    widget.data = json.decode(response.body);
    SharedPrefs().lastUpdateTime = time;
  }

  void refresh() {
    updateData();
    setState(() {});
  }
}
