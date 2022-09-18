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
  late Color shadows;

  CustomColors() {
    switch (SharedPrefs().theme) {
      case "dark":
        primaryBkg = const Color.fromARGB(255, 20, 24, 43);
        secondaryBkg = const Color.fromARGB(255, 9, 12, 28);
        normalHour = const Color.fromARGB(255, 20, 24, 43);
        changedHour = const Color.fromARGB(255, 226, 118, 74);
        freeHour = const Color.fromARGB(255, 91, 231, 154);
        droppedHour = const Color.fromARGB(255, 91, 231, 154);
        selectedDay = const Color.fromARGB(255, 66, 28, 255);
        primaryText = const Color.fromARGB(255, 255, 255, 255);
        secondaryText = const Color.fromARGB(255, 255, 255, 255);
        currentDay = const Color.fromARGB(255, 0, 255, 0);
        currentHour = const Color.fromARGB(255, 0, 255, 0);
        shadows = const Color.fromARGB(255, 65, 124, 255).withOpacity(0.3);
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
        shadows = const Color.fromARGB(255, 0, 0, 0).withOpacity(0.6);
        break;
    }
  }
}
