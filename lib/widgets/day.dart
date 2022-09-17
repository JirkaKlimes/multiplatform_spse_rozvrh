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
        hours.add(Hour(widget.data, i, widget.dayIndex));
      }
      return;
    }
    hours = List.empty();
  }

  double topContainer = 0;
  double heightFactor = 0.6;

  ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    createHours();
    controller.addListener(() {
      double value = controller.offset / 100 * heightFactor;
      setState(() {
        topContainer = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        color: CustomColors().secondaryBkg,
        alignment: Alignment.topCenter,
        child: Expanded(
          child: ListView.builder(
            controller: controller,
            itemCount: hours.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              double scale = 1.0;
              if (topContainer > 0) {
                if (index == 0) {
                  scale = index + 1 - topContainer;
                } else if (index == 1) {
                  scale = index + 0.5 - topContainer;
                } else if (index == 2) {
                  scale = index + 0.1 - topContainer;
                } else if (index == 3) {
                  scale = index - 0.4 - topContainer;
                } else if (index == 4) {
                  scale = index - 0.7 - topContainer;
                } else {
                  scale = index - 1 - topContainer;
                }
                if (scale < 0) {
                  scale = 0;
                } else if (scale > 1) {
                  scale = 1;
                }
              }
              return Opacity(
                opacity: scale,
                child: Transform(
                  transform: Matrix4.identity()..scale(scale, scale),
                  alignment: Alignment.bottomCenter,
                  child: Align(
                    heightFactor: heightFactor,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40,
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
        ));
  }
}
