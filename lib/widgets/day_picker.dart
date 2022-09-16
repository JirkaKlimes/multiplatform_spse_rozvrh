import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatelessWidget {
  final daylist = ['Pon', 'Út', 'Stř', 'Čt', 'Pá'];

  Map data;
  int selected;
  Function callback;

  DatePicker(this.selected, this.data, this.callback);

  @override
  Widget build(BuildContext context) {
    // print('picker building');
    return Container(
        height: 100,
        padding: EdgeInsets.symmetric(vertical: 18),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(28),
              topRight: Radius.circular(28),
            )),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          separatorBuilder: (_, index) => SizedBox(width: 5),
          itemCount: daylist.length,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () => callback(index),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
              margin: const EdgeInsets.symmetric(horizontal: 11),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(30)),
              child: Column(
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: DateTime.now().weekday - 1 == index
                            ? Colors.green
                            : Colors.white),
                  ),
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
                      '${DateTime.fromMillisecondsSinceEpoch(data['days']['$index']["date"]).day}',
                      style: TextStyle(
                          color: selected == index ? Colors.black : Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.bold))
                ],
              ),
            ),
          ),
        ));
  }
}
