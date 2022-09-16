import 'dart:async';
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

  int requestTime = 0;

  bool initialyRefreshed = false;

  PageController pageController =
      PageController(initialPage: DateTime.now().weekday - 1);
}

class RozvrhPageState extends State<RozvrhPage> {
  void changeSelected(index) {
    setState(() {
      widget.selected = index;
    });
  }

  Widget build(BuildContext context) {

    if (!widget.initialyRefreshed){
      refresh();
    }

    Timer? timer;
    timer = Timer.periodic(Duration(seconds: 60), (Timer t) => refresh());
    DatePicker datePicker =
        DatePicker(widget.selected, widget.data, changeSelected);
    WeekView weekView = WeekView(
        widget.selected, widget.data, changeSelected, widget.pageController);
    // ignore: prefer_const_constructors
    if (widget.data.isEmpty) {
      return const Scaffold(backgroundColor: Colors.black);
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

  void getData() async {
    var username = SharedPrefs().username;
    widget.requestTime = DateTime.now().millisecondsSinceEpoch;
    // print(time);
    Map payload = {
      "cmd": "get",
      "data": {"id": "!$username", "date": widget.requestTime}
    };

    String encoded = json.encode(payload);

    var response = await http
        .post(Uri.parse('http://rozvrh.spse.cz/index.php'), body: encoded)
        .then(updateData);
  }

  void updateData(http.Response value) {
    if (value.statusCode == 200) {
      widget.data = json.decode(value.body);
      SharedPrefs().lastUpdateTime = widget.requestTime;
      setState(() {});
      if (!widget.initialyRefreshed){
        widget.initialyRefreshed = true;
      }
    }
  }

  void refresh() {
    getData();
  }
}
