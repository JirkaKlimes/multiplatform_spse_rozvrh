import 'package:flutter/material.dart';
import 'package:spse_rozvrh/utils/colorTheme.dart';
import 'package:spse_rozvrh/widgets/day.dart';

class WeekView extends StatelessWidget {
  Map data;
  int selected;
  Function callback;
  PageController pageController;
  bool isPageAnimating = false;

  WeekView(this.selected, this.data, this.callback, this.pageController);

  @override
  Widget build(BuildContext context) {
    var cont = Expanded(
      child: Container(
        decoration: BoxDecoration(color: Colors.transparent),
        child: PageView(
          controller: pageController,
          onPageChanged: (value) => isPageAnimating ? null : callback(value),
          children: [
            DayPage(data, 0),
            DayPage(data, 1),
            DayPage(data, 2),
            DayPage(data, 3),
            DayPage(data, 4)
          ],
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
