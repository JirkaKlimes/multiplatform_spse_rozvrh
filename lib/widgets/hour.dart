import 'package:flutter/material.dart';
import 'package:spse_rozvrh/utils/colorTheme.dart';

// ignore: must_be_immutable
class Hour extends StatelessWidget {
  Map data;
  int hourIndex;
  int dayIndex;

  double widgetHeight = 95;
  double widgetWidthOfset = 30;

  EdgeInsets edgeInsets =
      const EdgeInsets.symmetric(horizontal: 8, vertical: 10);

  late String startTime;
  late String endTime;
  late String subject;
  late String teacherOrCls;
  late String cls;
  late String roomOrCls;
  late String change;
  late double height;
  late bool isTeacher;
  late bool isRoom;

  @override
  Hour(this.data, this.hourIndex, this.dayIndex, this.height, {super.key});

  Widget hourFrame(BuildContext context, Color color, List<Widget> children) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      height: height - 10,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            blurRadius: 6,
            spreadRadius: 3,
          ),
        ],
      ),
      child: SizedBox(
        width: width - 30,
        height: 95,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 12,
            ),
            SizedBox(
              height: 30,
              width: 20,
              child: Container(
                color: Colors.transparent,
                alignment: Alignment.centerLeft,
                child: Text(
                  '$hourIndex',
                  style: TextStyle(
                      color: CustomColors().primaryText,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
            ),
            SizedBox(
              height: 70,
              width: 45,
              child: Container(
                color: Colors.transparent,
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.transparent,
                      child: Text(
                        startTime,
                        style: TextStyle(
                            color: CustomColors().primaryText,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ),
                    ),
                    SizedBox(
                      width: 4,
                      height: 40,
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: CustomColors().primaryText),
                      ),
                    ),
                    Container(
                      color: Colors.transparent,
                      child: Text(
                        endTime,
                        style: TextStyle(
                            color: CustomColors().primaryText,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.transparent,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: children),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget freeHour(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return hourFrame(
      context,
      CustomColors().freeHour,
      [
        SizedBox(
          width: width / 5,
          height: 7,
          child: Container(
            decoration: BoxDecoration(
                color: CustomColors().primaryText,
                borderRadius: BorderRadius.circular(4)),
          ),
        ),
        Icon(Icons.fastfood, color: CustomColors().primaryText, size: 50),
        SizedBox(
          width: width / 5,
          height: 7,
          child: Container(
            decoration: BoxDecoration(
                color: CustomColors().primaryText,
                borderRadius: BorderRadius.circular(4)),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }

  Widget changedHour(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return hourFrame(
      context,
      CustomColors().changedHour,
      [
        SizedBox(
          // width: 80,
          child: Container(
            color: Colors.transparent,
            child: Text(
              subject.replaceAll('(', '').replaceAll(')', ''),
              style: TextStyle(
                  color: CustomColors().primaryText,
                  fontWeight: FontWeight.bold,
                  fontSize: 40),
            ),
          ),
        ),
        // const SizedBox(
        //   width: 5,
        // ),
        SizedBox(
          // width: 80,
          child: Container(
            color: Colors.transparent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.meeting_room_sharp,
                  color: CustomColors().primaryText,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  roomOrCls.replaceAll('(', '').replaceAll(')', ''),
                  style: TextStyle(
                      color: CustomColors().primaryText,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                )
              ],
            ),
          ),
        ),
        // const SizedBox(
        // width: 10,
        // ),
        SizedBox(
          // width: 80,
          child: Container(
            color: Colors.transparent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  isTeacher ? Icons.groups : Icons.person,
                  color: CustomColors().primaryText,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  teacherOrCls,
                  style: TextStyle(
                      color: CustomColors().primaryText,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget dropedHour(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return hourFrame(
      context,
      CustomColors().droppedHour,
      [
        SizedBox(
          width: width / 5,
          height: 7,
          child: Container(
            decoration: BoxDecoration(
                color: CustomColors().primaryText,
                borderRadius: BorderRadius.circular(4)),
          ),
        ),
        Icon(Icons.delete, color: CustomColors().primaryText, size: 50),
        SizedBox(
          width: width / 5,
          height: 7,
          child: Container(
            decoration: BoxDecoration(
                color: CustomColors().primaryText,
                borderRadius: BorderRadius.circular(4)),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }

  Widget normalHour(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return hourFrame(
      context,
      CustomColors().normalHour,
      [
        // const SizedBox(
        // width: 5,
        // ),
        SizedBox(
          // width: 80,
          child: Container(
            color: Colors.transparent,
            child: Text(
              subject.replaceAll('(', '').replaceAll(')', ''),
              style: TextStyle(
                  color: CustomColors().primaryText,
                  fontWeight: FontWeight.bold,
                  fontSize: 40),
            ),
          ),
        ),
        // const SizedBox(
        //   width: 5,
        // ),
        SizedBox(
          // width: 80,
          child: Container(
            color: Colors.transparent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  isRoom ? Icons.groups : Icons.meeting_room_sharp,
                  color: CustomColors().primaryText,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  roomOrCls.replaceAll('(', '').replaceAll(')', ''),
                  style: TextStyle(
                      color: CustomColors().primaryText,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                )
              ],
            ),
          ),
        ),
        // const SizedBox(
        // width: 10,
        // ),
        SizedBox(
          // width: 80,
          child: Container(
            color: Colors.transparent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  (isTeacher && !isRoom) ? Icons.groups : Icons.person,
                  color: CustomColors().primaryText,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  teacherOrCls,
                  style: TextStyle(
                      color: CustomColors().primaryText,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // Map day = data['items'][dayIndex];
    var day = data['items'][dayIndex];

    if (day is List) {
      Map tempDay = {};
      for (int i = 0; i < day.length; i++) {
        tempDay['$i'] = day[i];
      }
      day = tempDay;
    }

    endTime = data['hours'][hourIndex]['to'];
    startTime = data['hours'][hourIndex]['from'];

    if (day.containsKey('$hourIndex')) {
      Map hour = day['$hourIndex'][0];
      subject = hour['subject'];
      roomOrCls = hour.containsKey('room') ? hour['room'] : hour['cls'];
      teacherOrCls =
          hour.containsKey('teacher') ? hour['teacher'] : hour['cls'];
      change = hour.containsKey('change') ? hour['change'] : 'none';
      isTeacher = hour.containsKey('cls') ? true : false;
      isRoom = hour.containsKey('room') ? false : true;
    }
    if (day.containsKey('$hourIndex')) {
      if (change == "none") {
        return normalHour(context);
      } else if (change == "drop") {
        return dropedHour(context);
      } else {
        return changedHour(context);
      }
    } else {
      return freeHour(context);
    }
  }
}
