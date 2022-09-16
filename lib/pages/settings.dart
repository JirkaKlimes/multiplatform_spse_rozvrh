import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spse_rozvrh/utils/colorTheme.dart';
import 'package:spse_rozvrh/utils/shared_prefs.dart';

class SettingsPage extends StatefulWidget {
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<StatefulWidget> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Nastavení'),
          backgroundColor: CustomColors().color1,
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios)),
        ),
        body: Container(
          color: CustomColors().color1,
          child: SizedBox.expand(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                  color: CustomColors().color3,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(28),
                    topRight: Radius.circular(28),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.person,
                          size: 100,
                        ),
                      ),
                      SizedBox(
                        width: 270,
                        child: TextFormField(
                          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                          initialValue: SharedPrefs().username,
                          onChanged: (value) => {SharedPrefs().username = value},
                          decoration: const InputDecoration.collapsed(
                            hintText: "Zadejte jméno na intranet...",
                            hintStyle: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}


//  onChanged: (value) => {SharedPrefs().username = value},