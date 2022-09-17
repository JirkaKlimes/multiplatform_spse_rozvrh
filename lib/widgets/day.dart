import 'package:flutter/material.dart';
import 'package:spse_rozvrh/utils/colorTheme.dart';
import 'package:spse_rozvrh/widgets/hour.dart';

class DayPage extends StatelessWidget {
  Map data;
  int dayIndex;

  @override
  DayPage(this.data, this.dayIndex);

  List<Hour> createHours() {
    var day = data['items'][dayIndex];

    if (day is List){
      Map tempDay = {};
      for (int i = 0; i < day.length; i++){
        tempDay['$i'] = day[i];
      }
      day = tempDay;
    }

    int firstHour = int.parse(day.entries.first.key);
    int lastHour = int.parse(day.entries.last.key);

    List<Hour> hours = List.empty(growable: true);

    for (int i = firstHour; i <= lastHour; i++) {
      hours.add(Hour(data, i, dayIndex));
    }
    return hours;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
        color: CustomColors().color3,
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: createHours(),
          ),
        ));
  }
}
