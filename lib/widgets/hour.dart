import 'package:flutter/material.dart';

class Hour extends StatelessWidget {
  Map data;
  int hourIndex;
  int dayIndex;

  double widgetHeight = 95;

  late String startTime;
  late String endTime;
  late String subject;
  late String teacher;
  late String room;
  late String change;

  @override
  Hour(this.data, this.hourIndex, this.dayIndex);

  Widget freeHour(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(20)),
      child: SizedBox(
        width: width - 30,
        height: widgetHeight,
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
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
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              )),
          // const SizedBox(
          // width: 0,
          // ),
          Expanded(
            child: Container(
              color: Colors.transparent,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 10),
                    SizedBox(
                      width: 80,
                      height: 50,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          startTime,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                      height: 7,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4)),
                      ),
                    ),
                    const Icon(Icons.fastfood, color: Colors.white, size: 40),
                    SizedBox(
                      width: 30,
                      height: 7,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4)),
                      ),
                    ),
                    SizedBox(
                      width: 80,
                      height: 50,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          endTime,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                      ),
                    ),
                    const SizedBox(width: 30),
                  ]),
            ),
          ),
        ]),
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
          color: Colors.black, borderRadius: BorderRadius.circular(20)),
      child: SizedBox(
        width: width - 30,
        height: widgetHeight,
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
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
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              )),
          // const SizedBox(
          // width: 0,
          // ),
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
                        style: const TextStyle(
                            color: Colors.white,
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
                            color: Colors.white),
                      ),
                    ),
                    Container(
                      color: Colors.transparent,
                      child: Text(
                        endTime,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ),
                    )
                  ]),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.transparent,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // const SizedBox(
                    // width: 5,
                    // ),
                    SizedBox(
                      // width: 80,
                      child: Container(
                        color: Colors.transparent,
                        child: Text(
                          subject,
                          style: const TextStyle(
                              color: Colors.white,
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
                              const Icon(
                                Icons.meeting_room_sharp,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                room.replaceAll('(', '').replaceAll(')', ''),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22),
                              )
                            ],
                          )),
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
                              const Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                teacher,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22),
                              )
                            ],
                          )),
                    )
                  ]),
            ),
          ),
        ]),
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
          color: Colors.black, borderRadius: BorderRadius.circular(20)),
      child: SizedBox(
        width: width - 30,
        height: widgetHeight,
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
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
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              )),
          // const SizedBox(
          // width: 0,
          // ),
          Expanded(
            child: Container(
              color: Colors.transparent,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 10),
                    SizedBox(
                      width: 80,
                      height: 50,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          startTime,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                      height: 7,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4)),
                      ),
                    ),
                    const Icon(Icons.delete, color: Colors.white, size: 40),
                    SizedBox(
                      width: 30,
                      height: 7,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4)),
                      ),
                    ),
                    SizedBox(
                      width: 80,
                      height: 50,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          endTime,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                      ),
                    ),
                    const SizedBox(width: 30),
                  ]),
            ),
          ),
        ]),
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
        width: width - 30,
        height: widgetHeight,
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
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
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              )),
          // const SizedBox(
          // width: 0,
          // ),
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
                        style: const TextStyle(
                            color: Colors.white,
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
                            color: Colors.white),
                      ),
                    ),
                    Container(
                      color: Colors.transparent,
                      child: Text(
                        endTime,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ),
                    )
                  ]),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.transparent,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // const SizedBox(
                    // width: 5,
                    // ),
                    SizedBox(
                      // width: 80,
                      child: Container(
                        color: Colors.transparent,
                        child: Text(
                          subject,
                          style: const TextStyle(
                              color: Colors.white,
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
                              const Icon(
                                Icons.meeting_room_sharp,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                room.replaceAll('(', '').replaceAll(')', ''),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22),
                              )
                            ],
                          )),
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
                              const Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                teacher,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22),
                              )
                            ],
                          )),
                    )
                  ]),
            ),
          ),
        ]),
      ),
    );
  }

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    Map day = data['items'][dayIndex];

    endTime = data['hours'][hourIndex]['to'];
    startTime = data['hours'][hourIndex]['from'];

    if (day.containsKey('$hourIndex')) {
      Map hour = day['$hourIndex'][0];
      subject = hour['subject'];
      room = hour['room'];
      teacher = hour['teacher'];
      change = hour['change'];
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
