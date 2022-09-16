import 'package:flutter/material.dart';

class DayPage extends StatelessWidget {
  @override
  Color color;
  DayPage(this.color);

  Widget build(BuildContext context) {
    return Container(color: color);
  }
}
