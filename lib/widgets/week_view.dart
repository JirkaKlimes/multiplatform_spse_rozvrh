import 'package:flutter/material.dart';
import 'package:spse_rozvrh/widgets/day.dart';

class WeekView extends StatelessWidget {
  Map data;
  int selected;
  Function callback;
  PageController pageController;

  WeekView(this.selected, this.data, this.callback, this.pageController);

  @override
  Widget build(BuildContext context) {
    Container cont = Container(
      height: 100,
      padding: const EdgeInsets.symmetric(vertical: 18),
      decoration: const BoxDecoration(color: Colors.white),
      child: PageView(
        controller: pageController,
        onPageChanged: (value) => callback(value),
        children: [
          DayPage(Colors.red),
          DayPage(Colors.blue),
          DayPage(Colors.green),
          DayPage(Colors.orange),
          DayPage(Colors.purple)
        ],
      ),);

    if (pageController.hasClients){
    pageController.animateToPage(selected, duration: Duration(milliseconds: 100), curve: Curves.easeIn);
    }
    return cont;
  }
}
