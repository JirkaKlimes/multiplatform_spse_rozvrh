import 'package:flutter/material.dart';
import 'package:spse_rozvrh/utils/colorTheme.dart';
import 'package:spse_rozvrh/utils/shared_prefs.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Nastavení'),
          backgroundColor: CustomColors().primaryBkg,
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios)),
        ),
        body: Container(
          color: CustomColors().primaryBkg,
          child: SizedBox.expand(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                  color: CustomColors().secondaryBkg,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(28),
                    topRight: Radius.circular(28),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.person,
                          color: CustomColors().primaryText,
                          size: 100,
                        ),
                      ),
                      SizedBox(
                        width: 270,
                        child: TextFormField(
                          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: CustomColors().primaryText),
                          textAlign: TextAlign.left,
                          initialValue: SharedPrefs().username,
                          onChanged: (value) => {SharedPrefs().username = value},
                          decoration: InputDecoration.collapsed(
                            hintText: "Zadejte jméno na intranet...",
                            hintStyle: TextStyle(fontSize: 18, color: CustomColors().primaryText),
                          ),
                        ),
                      ),
                    ],
                  ),
                Container()
                ],
              ),
            ),
          ),
        ));
  }
}


//  onChanged: (value) => {SharedPrefs().username = value},