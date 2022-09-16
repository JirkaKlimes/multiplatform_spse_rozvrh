import 'package:flutter/material.dart';
import 'package:spse_rozvrh/pages/rozvrh.dart';
import 'package:spse_rozvrh/pages/settings.dart';

class HomePage extends StatelessWidget {

  final GlobalKey<RozvrhPageState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    RozvrhPage rozvrhpage = RozvrhPage(key: _key);
    return Scaffold(
        appBar: AppBar(
          title: const Text('SPŠE Rozvrh'),
          backgroundColor: Colors.black,
          toolbarHeight: 68,
          actions: [
            IconButton(
                onPressed: () => _key.currentState!.refresh(),
                icon: const Icon(
                  Icons.refresh,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: (() => {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => Settings()
                    ))}),
                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.white,
                )),
          ],
        ),
        backgroundColor: Colors.red,
        body: rozvrhpage
        );
  }
}
