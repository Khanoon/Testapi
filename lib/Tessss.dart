import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

import 'APItest/ConnecNetwork.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ConnecNetwork().HeroApi().then((data) {
    runApp(MainApp(data: data));
  });
}

class MainApp extends StatelessWidget {
  final List<dynamic> data;

  const MainApp({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic textData = (data).toString();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My App'),
        ),
        body: Column(
          children: [
            Center(
              child: Text(
                textData,
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  log(textData);
                },
                child: Text('data'))
          ],
        ),
      ),
    );
  }
}
