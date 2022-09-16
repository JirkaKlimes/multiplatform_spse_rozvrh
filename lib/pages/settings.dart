import 'package:flutter/material.dart';
import 'package:spse_rozvrh/utils/shared_prefs.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Nastavení'),
          backgroundColor: Colors.black,
          leading:
            IconButton(
                
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_ios))
          ,
        ),
        body: Container(
            color: Colors.grey,
            // ignore: prefer_const_literals_to_create_immutables
            child: Column(children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                    textAlign: TextAlign.center,
                    initialValue: SharedPrefs().username,
                    onChanged: (value) => {SharedPrefs().username = value},
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Zadejte jméno na intranet...')),
              ),
            ])));
  }
}
