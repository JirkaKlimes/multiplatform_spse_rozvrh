import 'package:flutter/material.dart';
import 'package:spse_rozvrh/widgets/hour.dart';
import 'package:spse_rozvrh/utils/colorTheme.dart';

class DayPage extends StatefulWidget {
  Map data;
  int dayIndex;

  @override
  DayPage(this.data, this.dayIndex);

  @override
  State<DayPage> createState() => _DayPageState();
}

class _DayPageState extends State<DayPage> {
  double heightFactor = 0.65;
  double hourHeight = 110;
  double spacerHeight = 30;

  double get realHourHeight => (hourHeight + spacerHeight) * heightFactor;

  ScrollController controller = ScrollController();

  late List<Hour> hours;

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
      int firstHour = int.parse(day.entries.first.key);
      int lastHour = int.parse(day.entries.last.key);

      hours = List.empty(growable: true);

      for (int i = firstHour; i <= lastHour; i++) {
        hours.add(Hour(widget.data, i, widget.dayIndex, hourHeight));
      }
      return;
    }
    hours = List.empty();
  }

  @override
  void initState() {
    super.initState();
    createHours();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    createHours();
    Size size = MediaQuery.of(context).size;

    return Container(
      color: CustomColors().secondaryBkg,
      alignment: Alignment.topCenter,
      child: ListView.builder(
        controller: controller,
        itemCount: hours.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final double itemPos = index * realHourHeight;
          final double difference = controller.offset - itemPos;
          double opacity = 1 - (difference / realHourHeight);
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
