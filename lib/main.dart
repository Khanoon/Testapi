import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

import 'package:flutter_application_1/two.dart';

Future<List<dynamic>> getHeroRov() async {
  final dio = Dio();
  String url = "https://apirov.vercel.app/hero";
  try {
    final response = await dio.get(url);
    final data = response.data;
    return data;
  } catch (error) {
    print("Error: $error");
    return [];
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  getHeroRov().then((data) {
    runApp(MainApp(data: data));
  });
}

class MainApp extends StatelessWidget {
  final List<dynamic> data;

  const MainApp({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    jsonEncode(data);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My App'),
        ),
        body: Center(
            child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    String idHero = data[index]['name'];
                    return HeroName(data: idHero);
                  },
                ));
              },
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  color: Colors.white70,
                  child: Column(
                    children: [
                      Container(
                          width: 200,
                          height: 200,
                          child: Image.network(data[index]['image'])),
                      Text(
                        data[index]['name'],
                        textAlign: TextAlign.center,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            data[index]['role']['main'],
                          ),
                          Text(
                            data[index]['role']['sub'],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        )),
      ),
    );
  }
}
