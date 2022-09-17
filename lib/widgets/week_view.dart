import 'package:flutter/material.dart';
import 'package:spse_rozvrh/widgets/day.dart';

class WeekView extends StatelessWidget {
  Map data;
  int selected;
  Function callback;
  PageController pageController;

  WeekView(this.selected, this.data, this.callback, this.pageController);

  bool isPageAnimating = false;

  late List<Widget> days;

  void createDayWidgets() {
    days = [
      DayPage(data, 0),
      DayPage(data, 1),
      DayPage(data, 2),
      DayPage(data, 3),
      DayPage(data, 4)
    ];
  }

  @override
  Widget build(BuildContext context) {
    createDayWidgets();

    var cont = Expanded(
      child: Container(
        decoration: const BoxDecoration(color: Colors.transparent),
        child: PageView(
          controller: pageController,
          onPageChanged: (value) =>
              isPageAnimating ? null : callback(value),
          children: days,
        ),
      ),
    );

    if (pageController.hasClients) {
      isPageAnimating = true;
      pageController
          .animateToPage(selected,
              duration: const Duration(milliseconds: 250), curve: Curves.easeIn)
          .then((_) {
        isPageAnimating = false;
      });
    }
    return cont;
  }
}
