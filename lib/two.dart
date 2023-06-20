import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HeroName extends StatefulWidget {
  final dynamic data;

  const HeroName({Key? key, required this.data}) : super(key: key);

  @override
  State<HeroName> createState() => _HeroNameState();
}

class _HeroNameState extends State<HeroName> {
  String? data;
  dynamic heroData;
  @override
  void initState() {
    super.initState();

    if (widget.data != null) {
      data = widget.data.toString(); // Convert the index to a string
    } else {
      data = null; // Set data to null if widget.data is null
    }
  }

  @override
  Widget build(BuildContext context) {
    log(data!);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('data')),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                log(data!);

                getHeroByName(data).then((value) {
                  setState(() {
                    heroData = value;
                  });
                });
              },
              child: Text('text'),
            ),
            Text('${heroData.toString()}')
          ],
        ),
      ),
    );
  }
}

Future<List<dynamic>> getHeroByName(name) async {
  final dio = Dio();
  final Heroname = name;
  String url = "https://apirov.vercel.app/hero/name";
  try {
    final response =
        await dio.post(url, data: {'name': Heroname, 'token': '12345'});
    final data = response.data;
    print(data);
    return data;
  } catch (error) {
    print("Error: $error");
    return [];
  }
}
