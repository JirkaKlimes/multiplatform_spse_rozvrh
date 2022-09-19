import 'package:flutter/material.dart';
import 'package:spse_rozvrh/utils/colorTheme.dart';

// import 'package:html/parser.dart' show parse;
// import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';


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
  late bool highlighted;

  @override
  Hour(this.data, this.hourIndex, this.dayIndex, this.height,
      {super.key, this.highlighted = false});

  void searchTeacher(String teacher) async {
    if (isTeacher) {
      Uri url = Uri.parse(
          'https://www.google.com/search?q=site%3Ahttps%3A%2F%2Fwww.spse.cz%2F+inurl%3Azamestnanec.php+%22$teacher%22');
      var urllaunchable = await canLaunchUrl(url);
      if (urllaunchable) {
        launchUrl(url);
      }
    }
  }
  // void searchTeacher(String teacher) async {
  //   if (isTeacher) {
  //     Uri url = Uri.parse(
  //         'https://www.google.com/search?q=site%3Ahttps%3A%2F%2Fwww.spse.cz%2F+inurl%3Azamestnanec.php+%22$teacher%22');
  //     final response = await http.get(url);
  //     final document = parse(response.body);
  //     if (response.statusCode == 200) {
  //       final hrefs = document
  //           .getElementsByTagName('a')
  //           .where((e) => e.attributes.containsKey('href'))
  //           .map((e) => e.attributes['href'])
  //           .toList();
  //       print(hrefs);
  //     }
  //   else {
  //     print(response.statusCode);
  //   }
  //   }
  // }

  Widget hourFrame(BuildContext context, Color bkgColor, Color textColor, List<Widget> children) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      height: height - 20,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: bkgColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: CustomColors().shadows,
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
              width: 6,
            ),
            SizedBox(
              width: 20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  highlighted
                      ? Column(
                          children: [
                            SizedBox(
                              height: 8,
                              width: 8,
                              child: Container(
                                  decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: CustomColors().currentHour,
                              )),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                          ],
                        )
                      : const SizedBox(),
                  SizedBox(
                    width: 8,
                    child: Container(
                      color: Colors.transparent,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '$hourIndex',
                        style: TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ],
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
                            color: textColor,
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
                            color: textColor),
                      ),
                    ),
                    Container(
                      color: Colors.transparent,
                      child: Text(
                        endTime,
                        style: TextStyle(
                            color: textColor,
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
      CustomColors().freeHourText,
      [
        SizedBox(
          width: width / 5,
          height: 7,
          child: Container(
            decoration: BoxDecoration(
                // color: CustomColors().freeHourText,
                color: CustomColors().freeHourText,
                borderRadius: BorderRadius.circular(4)),
          ),
        ),
        Icon(Icons.fastfood, color: CustomColors().freeHourText, size: 50),
        SizedBox(
          width: width / 5,
          height: 7,
          child: Container(
            decoration: BoxDecoration(
                color: CustomColors().freeHourText,
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
      CustomColors().changedHourText,
      [
        SizedBox(
          child: Container(
            color: Colors.transparent,
            child: Text(
              subject.replaceAll('(', '').replaceAll(')', ''),
              style: TextStyle(
                  color: CustomColors().changedHourText,
                  fontWeight: FontWeight.bold,
                  fontSize: 40),
            ),
          ),
        ),
        SizedBox(
          child: Container(
            color: Colors.transparent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  isRoom ? Icons.meeting_room_sharp : Icons.groups,
                  color: CustomColors().changedHourText,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  roomOrCls.replaceAll('(', '').replaceAll(')', ''),
                  style: TextStyle(
                      color: CustomColors().changedHourText,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                )
              ],
            ),
          ),
        ),
        GestureDetector(
          onLongPress: () => searchTeacher(teacherOrCls),
          child: SizedBox(
            child: Container(
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    (!isTeacher && isRoom) ? Icons.groups : Icons.person,
                    color: CustomColors().changedHourText,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    teacherOrCls,
                    style: TextStyle(
                        color: CustomColors().changedHourText,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  )
                ],
              ),
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
      CustomColors().droppedHourText,
      [
        SizedBox(
          width: width / 5,
          height: 7,
          child: Container(
            decoration: BoxDecoration(
                color: CustomColors().droppedHourText,
                borderRadius: BorderRadius.circular(4)),
          ),
        ),
        Icon(Icons.delete, color: CustomColors().droppedHourText, size: 50),
        SizedBox(
          width: width / 5,
          height: 7,
          child: Container(
            decoration: BoxDecoration(
                color: CustomColors().droppedHourText,
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
      CustomColors().normalHourText,
      [
        SizedBox(
          child: Container(
            color: Colors.transparent,
            child: Text(
              subject.replaceAll('(', '').replaceAll(')', ''),
              style: TextStyle(
                  color: CustomColors().normalHourText,
                  fontWeight: FontWeight.bold,
                  fontSize: 40),
            ),
          ),
        ),
        SizedBox(
          child: Container(
            color: Colors.transparent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  isRoom ? Icons.meeting_room_sharp : Icons.groups,
                  color: CustomColors().normalHourText,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  roomOrCls.replaceAll('(', '').replaceAll(')', ''),
                  style: TextStyle(
                      color: CustomColors().normalHourText,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                )
              ],
            ),
          ),
        ),
        GestureDetector(
          onLongPress: () => searchTeacher(teacherOrCls),
          child: SizedBox(
            child: Container(
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    (!isTeacher && isRoom) ? Icons.groups : Icons.person,
                    color: CustomColors().normalHourText,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    teacherOrCls,
                    style: TextStyle(
                        color: CustomColors().normalHourText,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
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
      isTeacher = hour.containsKey('cls') ? false : true;
      isRoom = hour.containsKey('room') ? true : false;
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
