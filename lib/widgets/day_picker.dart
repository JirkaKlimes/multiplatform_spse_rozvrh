import 'package:flutter/material.dart';
import 'package:spse_rozvrh/utils/colorTheme.dart';

class DatePicker extends StatelessWidget {
  final daylist = ['Po', 'Út', 'St', 'Čt', 'Pá'];
  final monthList = [
    "led",
    "úno",
    "bře",
    "dub",
    "kvě",
    "čvn",
    "čvc",
    "srp",
    "zář",
    "říj",
    "lis",
    "pro"
  ];

  Map data;
  int selected;
  Function callback;

  DatePicker(this.selected, this.data, this.callback);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
        height: 100,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
            color: CustomColors().secondaryBkg,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(28),
              topRight: Radius.circular(28),
            )),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          separatorBuilder: (_, index) => const SizedBox(width: 0),
          itemCount: daylist.length,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () => callback(index),
            child: Container(
              decoration: BoxDecoration(
                  color: selected == index
                      ? CustomColors().selectedDay
                      : Colors.transparent,
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              width: ((width - 2 * 12) / 5),
              child: Column(
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  Text(daylist[index],
                      style: TextStyle(
                          color: selected == index
                              ? CustomColors().secondaryText
                              : CustomColors().primaryText,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 8,
                  ),
                  data['days'] != null
                      ? Text(
                          '${DateTime.fromMillisecondsSinceEpoch(data['days'][index]["date"]).day}. ${monthList[DateTime.fromMillisecondsSinceEpoch(data['days'][index]["date"]).month - 1]}',
                          style: TextStyle(
                              color: selected == index
                                  ? CustomColors().secondaryText
                                  : CustomColors().primaryText,
                              fontSize: 14,
                              fontWeight: FontWeight.bold))
                      : Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: 40,
                              height: 4,
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: CustomColors().primaryText,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(2)))),
                            ),
                          ],
                        ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (DateTime.now().weekday - 1 == index &&
                                index != selected)
                            ? CustomColors().currentDay
                            : Colors.transparent),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
