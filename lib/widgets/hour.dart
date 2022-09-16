import 'package:flutter/material.dart';

class Hour extends StatelessWidget {
  Map data;
  int hourIndex;
  int dayIndex;

  double widgetHeight = 95;

  @override
  Hour(this.data, this.hourIndex, this.dayIndex);

  Widget freeHour(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.green, borderRadius: BorderRadius.circular(20)),
      child: SizedBox(
        width: width - 40,
        height: widgetHeight,
      ),
    );
  }

  Widget changedHour(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    Map day = data['items'][dayIndex];
    Map hour = day['$hourIndex'][0];

    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(20)),
      child: SizedBox(
        width: width - 40,
        height: widgetHeight,
      ),
    );
  }

  Widget dropedHour(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    Map day = data['items'][dayIndex];
    Map hour = day['$hourIndex'][0];

    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.orange, borderRadius: BorderRadius.circular(20)),
      child: SizedBox(
        width: width - 40,
        height: widgetHeight,
      ),
    );
  }

  Widget normalHour(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    Map day = data['items'][dayIndex];
    Map hour = day['$hourIndex'][0];

    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(20)),
      child: SizedBox(
        width: width - 40,
        height: widgetHeight,
      ),
    );
  }

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    Map day = data['items'][dayIndex];

    if (day.containsKey('$hourIndex')) {
      Map hour = day['$hourIndex'][0];
      if (hour['change'] == "none") {
        return normalHour(context);}
      else if (hour['change'] == "drop"){
        return dropedHour(context);
      }
      else {
        return changedHour(context);
      }
    } else {
      return freeHour(context);
    }
  }
}
