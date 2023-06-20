import 'package:flutter/material.dart';

import 'Tessss.dart';
import 'TestApi.dart';

class HomeTest extends StatefulWidget {
  const HomeTest({super.key});

  @override
  State<HomeTest> createState() => _HomeTestState();
}

class _HomeTestState extends State<HomeTest> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(children: [
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TestAPI(),
                  ));
            },
            child: Container(
              child: Text('data'),
            )),
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainApp(
                      data: [],
                    ),
                  ));
            },
            child: Container(
              child: Text('data'),
            ))
      ]),
    ));
  }
}
