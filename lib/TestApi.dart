import 'dart:developer';

import 'package:flutter/material.dart';

import 'APItest/ConnecNetwork.dart';
import 'APItest/ModleRov.dart';

class TestAPI extends StatefulWidget {
  const TestAPI({super.key});

  @override
  State<TestAPI> createState() => _TestAPIState();
}

class _TestAPIState extends State<TestAPI> {
  @override
  // void initState() {
  //   log('${ConnecNetwork().getRov}');
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    dynamic dataXD = ConnecNetwork().getRov;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: Text('data')),
      body: Column(children: [
        ElevatedButton(
            onPressed: () {
              log('${dataXD}');
            },
            child: Container(
              child: Text('data'),
            ))
      ]),
    ));
  }
}
