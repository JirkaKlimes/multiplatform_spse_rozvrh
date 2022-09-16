import 'package:flutter/material.dart';
import 'package:spse_rozvrh/widgets/hour.dart';
import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';

class DayPage extends StatelessWidget {
  Map data;
  int dayIndex;

  @override
  DayPage(this.data, this.dayIndex);

  List<Hour> createHours() {
    Map day = data['items'][dayIndex];
    int firstHour = int.parse(day.entries.first.key);
    int lastHour = int.parse(day.entries.last.key);

    List<Hour> hours = List.empty(growable: true);

    for (int i = firstHour; i <= lastHour; i++) {
      hours.add(Hour(data, i, dayIndex));
    }
    return hours;
  }

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
        color: Colors.white,
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: createHours(),
          ),
        ));
  }
}
