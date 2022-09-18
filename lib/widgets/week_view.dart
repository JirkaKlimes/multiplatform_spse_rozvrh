import 'package:flutter/material.dart';
import 'package:spse_rozvrh/utils/colorTheme.dart';
import 'package:spse_rozvrh/widgets/day.dart';

class WeekView extends StatefulWidget {
  Map data;
  int selected;
  Function callback;
  PageController pageController;

  WeekView(this.selected, this.data, this.callback, this.pageController,
      {super.key});

  @override
  State<WeekView> createState() => WeekViewState();
}

class WeekViewState extends State<WeekView> {
  bool isPageAnimating = false;

  late List<Widget> days;

  void createDayWidgets() {
    List<Widget> tempDays = List.empty(growable: true);
    for (int i = 0; i < 5; i++) {
      if (DateTime.now().weekday - 1 == i) {
        tempDays.add(DayPage(
          widget.data,
          i,
        ));
      }
      tempDays.add(DayPage(widget.data, i));
    }
    days = tempDays;
  }

  void onPageChanged(value) {
    isPageAnimating ? null : widget.callback(value);
  }

  @override
  Widget build(BuildContext context) {
    createDayWidgets();

    var cont = Expanded(
      child: Container(
        decoration: BoxDecoration(color: CustomColors().secondaryBkg),
        child: PageView(
          controller: widget.pageController,
          physics: const BouncingScrollPhysics(),
          onPageChanged: onPageChanged,
          children: days,
        ),
      ),
    );

    if (widget.pageController.hasClients) {
      isPageAnimating = true;
      widget.pageController
          .animateToPage(widget.selected,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut)
          .then(
        (_) {
          isPageAnimating = false;
        },
      );
    }
    return cont;
  }
}
