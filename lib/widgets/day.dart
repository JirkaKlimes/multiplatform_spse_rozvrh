import 'package:flutter/material.dart';
import 'package:spse_rozvrh/widgets/hour.dart';
import 'package:spse_rozvrh/utils/colorTheme.dart';

class DayPage extends StatefulWidget {
  Map data;
  int dayIndex;

  DayPage(this.data, this.dayIndex, {Key? key}) : super(key: key);

  @override
  State<DayPage> createState() => DayPageState();
}

class DayPageState extends State<DayPage> {
  double heightFactor = 0.65;
  double hourHeight = 110;
  double spacerHeight = 30;
  late int firstHour;
  late int currentHourIndex = 0;

  double get fullHourHeight => (hourHeight + spacerHeight) * heightFactor;

  late ScrollController controller;

  late List<Hour> hours;

  bool isCurrent(index) {
    if ((DateTime.now().weekday - 1) == widget.dayIndex) {
      Map hourData = widget.data['hours'][index];
      List timeFrom = hourData['from'].split(':');
      List timeTo = hourData['to'].split(':');
      int breakTime = 30;

      if ((widget.dayIndex - 1) >= 0) {
        breakTime = widget.data['hours'][index]['break'];
      }

      int from = Duration(
                  hours: int.parse(timeFrom[0]),
                  minutes: int.parse(timeFrom[1]))
              .inMinutes -
          breakTime;
      int to =
          Duration(hours: int.parse(timeTo[0]), minutes: int.parse(timeTo[1]))
              .inMinutes;

      int now =
          Duration(hours: DateTime.now().hour, minutes: DateTime.now().minute)
              .inMinutes;

      if (now > from && now < to) {
        currentHourIndex = index - firstHour;
        return true;
      }
    }
    return false;
  }

  createHours() {
    var day = widget.data['items'][widget.dayIndex];

    if (day is List) {
      Map tempDay = {};
      for (int i = 0; i < day.length; i++) {
        tempDay['$i'] = day[i];
      }
      day = tempDay;
    }

    if (day != null) {
      firstHour = int.parse(day.entries.first.key);
      int lastHour = int.parse(day.entries.last.key);

      hours = List.empty(growable: true);

      for (int i = firstHour; i <= lastHour; i++) {
        hours.add(
          Hour(
            widget.data,
            i,
            widget.dayIndex,
            hourHeight,
            highlighted: isCurrent(i),
          ),
        );
      }
      return;
    }
    currentHourIndex = 0;
    hours = List.empty();
  }

  @override
  void initState() {
    super.initState();
    createHours();
    controller = ScrollController(
        initialScrollOffset: currentHourIndex * fullHourHeight);
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    createHours();

    return Container(
      color: CustomColors().secondaryBkg,
      alignment: Alignment.topCenter,
      child: ListView.builder(
        controller: controller,
        itemCount: hours.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final double itemPos = index * fullHourHeight;
          final double difference = controller.offset - itemPos;
          double opacity = 1 - (difference / fullHourHeight);
          double scale = opacity;
          if (opacity > 1.0) opacity = 1.0;
          if (opacity < 0.0) opacity = 0.0;
          if (scale > 1.0) scale = 1.0;

          return Opacity(
            opacity: opacity,
            child: Transform(
              transform: Matrix4.identity()..scale(scale, scale),
              alignment: Alignment.bottomCenter,
              child: Align(
                heightFactor: heightFactor,
                child: Column(
                  children: [
                    SizedBox(
                      height: spacerHeight,
                      child: Container(color: Colors.transparent),
                    ),
                    hours[index],
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
