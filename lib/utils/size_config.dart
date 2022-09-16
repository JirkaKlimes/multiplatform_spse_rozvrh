import 'package:flutter/widgets.dart';


class SizeConfig {
 static var _mediaQueryData = null;

 void init(BuildContext context) {
  _mediaQueryData = MediaQuery.of(context);
 }

  double get width => _mediaQueryData == null ? _mediaQueryData.size.width : 0;
  double get height => _mediaQueryData == null ? _mediaQueryData.size.height : 0;

}