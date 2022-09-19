import 'package:flutter/material.dart';
import 'package:spse_rozvrh/utils/shared_prefs.dart';

class CustomColors {
  late Color primaryBkg;
  late Color secondaryBkg;
  late Color normalHour;
  late Color changedHour;
  late Color freeHour;
  late Color droppedHour;
  late Color normalHourText;
  late Color changedHourText;
  late Color freeHourText;
  late Color droppedHourText;
  late Color selectedDay;
  late Color primaryText;
  late Color secondaryText;
  late Color currentDay;
  late Color currentHour;
  late Color shadows;
  late Color live;
  late Color notLive;

  CustomColors() {
    switch (SharedPrefs().theme) {
      case "dark":
        primaryBkg = const Color.fromARGB(255, 27, 30, 47);
        secondaryBkg = const Color.fromARGB(255, 9, 12, 28);
        normalHour = const Color.fromARGB(255, 27, 30, 47);
        changedHour = const Color.fromARGB(255, 27, 30, 47);
        freeHour = const Color.fromARGB(255, 27, 30, 47);
        droppedHour = const Color.fromARGB(255, 27, 30, 47);
        normalHourText = const Color.fromARGB(255, 255, 255, 255);
        changedHourText = const Color.fromARGB(255, 251, 122, 101);
        freeHourText = const Color.fromARGB(255, 91, 231, 154);
        droppedHourText = const Color.fromARGB(255, 91, 231, 154);
        selectedDay = const Color.fromARGB(255, 67, 120, 255);
        primaryText = const Color.fromARGB(255, 255, 255, 255);
        secondaryText = const Color.fromARGB(255, 255, 255, 255);
        currentDay = const Color.fromARGB(255, 0, 255, 0);
        currentHour = const Color.fromARGB(255, 0, 255, 0);
        shadows = const Color.fromARGB(255, 82, 137, 255).withOpacity(0.2);
        live = const Color.fromARGB(255, 0, 255, 0);
        notLive = const Color.fromARGB(255, 255, 0, 0);
        break;

      case "light":
        primaryBkg = const Color.fromARGB(255, 168, 168, 168);
        secondaryBkg = const Color.fromARGB(255, 255, 255, 255);
        normalHour = const Color.fromARGB(255, 168, 168, 168);
        changedHour = const Color.fromARGB(255, 168, 168, 168);
        freeHour = const Color.fromARGB(255, 168, 168, 168);
        droppedHour = const Color.fromARGB(255, 168, 168, 168);
        normalHourText = const Color.fromARGB(255, 255, 255, 255);
        changedHourText = const Color.fromARGB(255, 190, 50, 28);
        freeHourText = const Color.fromARGB(255, 91, 231, 154);
        droppedHourText = const Color.fromARGB(255, 91, 231, 154);
        selectedDay = const Color.fromARGB(255, 168, 168, 168);
        primaryText = const Color.fromARGB(255, 0, 0, 0);
        secondaryText = const Color.fromARGB(255, 255, 255, 255);
        currentDay = const Color.fromARGB(255, 0, 255, 0);
        currentHour = const Color.fromARGB(255, 0, 255, 0);
        shadows = const Color.fromARGB(255, 0, 0, 0).withOpacity(0.3);
        live = const Color.fromARGB(255, 0, 255, 0);
        notLive = const Color.fromARGB(255, 255, 0, 0);
        break;
    }
  }
}
