import 'package:flutter/material.dart';
import 'package:spse_rozvrh/utils/shared_prefs.dart';

class CustomColors {
  late Color primaryBkg;
  late Color normalHour;
  late Color secondaryBkg;
  late Color changedHour;
  late Color selectedDay;
  late Color freeHour;
  late Color droppedHour;
  late Color primaryText;
  late Color secondaryText;
  late Color currentDay;
  late Color currentHour;

  CustomColors() {
    switch (SharedPrefs().theme) {
      case "dark":
        primaryBkg = const Color.fromARGB(255, 32, 44, 57);
        secondaryBkg = const Color.fromARGB(255, 184, 176, 141);
        normalHour = const Color.fromARGB(255, 40, 56, 69);
        changedHour = const Color.fromARGB(255, 242, 149, 89);
        freeHour = const Color.fromARGB(255, 88, 77, 53);
        droppedHour = const Color.fromARGB(255, 88, 77, 53);
        selectedDay = const Color.fromARGB(255, 154, 148, 118);
        primaryText = const Color.fromARGB(255, 255, 255, 255);
        secondaryText = const Color.fromARGB(255, 0, 0, 0);
        currentDay = const Color.fromARGB(255, 0, 255, 0);
        currentHour = const Color.fromARGB(255, 0, 255, 0);
        break;

      case "light":
      
        primaryBkg = const Color.fromARGB(255, 155, 193, 188);
        secondaryBkg = const Color.fromARGB(255, 230, 235, 224);
        normalHour = const Color.fromARGB(255, 92, 164, 169);
        changedHour = const Color.fromARGB(255, 237, 106, 90);
        freeHour = const Color.fromARGB(255, 244, 241, 187);
        droppedHour = const Color.fromARGB(255, 244, 241, 187);
        selectedDay = const Color.fromARGB(255, 155, 158, 151);
        primaryText = const Color.fromARGB(255, 0, 0, 0);
        secondaryText = const Color.fromARGB(255, 0, 0, 0);
        currentDay = const Color.fromARGB(255, 0, 255, 0);
        currentHour = const Color.fromARGB(255, 0, 255, 0);
        break;
    }
  }
}
