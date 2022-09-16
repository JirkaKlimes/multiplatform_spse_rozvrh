import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:spse_rozvrh/utils/size_config.dart';

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
        padding: EdgeInsets.symmetric(vertical: 12),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
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
                      ? Colors.grey
                      : const Color.fromARGB(0, 255, 255, 255),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              width: ((width - 2 * 12) / 5),
              child: Column(
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  Text(daylist[index],
                      style: TextStyle(
                          color: selected == index ? Colors.black : Colors.grey,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 8,
                  ),
                  // Text('$index',
                  Text(
                      '${DateTime.fromMillisecondsSinceEpoch(data['days']['$index']["date"]).day}. ${monthList[DateTime.fromMillisecondsSinceEpoch(data['days']['$index']["date"]).month - 1]}',
                      style: TextStyle(
                          color: selected == index ? Colors.black : Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.bold)),
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
                            ? Colors.green
                            : Color.fromARGB(0, 255, 255, 255)),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}