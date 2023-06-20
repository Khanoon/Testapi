import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'ModleRov.dart';

class ConnecNetwork {
  //บรรทัด 9-15 เป็นการจองพื้นที่ของมือถือ
  ConnecNetwork._internal();

  static final ConnecNetwork _instance = ConnecNetwork._internal();

  factory ConnecNetwork() {
    return _instance;
  }

  static final _dio =
      Dio(); //เเพ็ค เอาไวยิงApi ศึกษาได้ Dio ใช้พวก get post del phat

  Future<List<ModleRov>> getRov() async {
    //async คือ จะบอกว่าในฟังชันนี้จะมีการโหลดข้อมูล
    const uri =
        'https://apirov-imteammy.vercel.app/hero/'; // const หลังจากตัวนี้ จะไม่มีการเปลี่ยนเเค่เเล้ว
    final Response response = await _dio.get(
        uri); // Response ไทร์ ระบุ ตอบกลับของข้อมูล ใช้ในพวกฐานข้อมูล await คือ โหลดข้อมูลเสร็จก่อนค่อยทำต่อ
    if (response.statusCode == 200) {
      //เช็คสถานะ 200 ผ่าน statusCode คือสถานะ
      log("${modleRovFromJson(jsonEncode(response.data))}"); // log เเสดงค่าออก Terminal
      return response.data;
      // return modleRovFromJson(jsonEncode(response.data)); //
    }
    throw Exception("แตก function get"); //throw เช็คฟังชันพัง
  }

  Future<List<ModleRov>> getRov1() async {
    const uri = 'https://apirov-imteammy.vercel.app/hero/';
    final Response response = await _dio.get(uri);
    if (response.statusCode == 200) {
      log("${modleRovFromJson(jsonEncode(response.data))}");
      return modleRovFromJson(jsonEncode(response.data));
    }
    throw Exception("แตก function get");
  }

  Future<List<dynamic>> getHeroByName(name) async {
    final dio = Dio();
    final Heroname = name;
    String url = "https://apirov.vercel.app/hero/name";
    try {
      final response = await dio.post(url, data: {'name': Heroname});
      final data = response.data;
      return data;
    } catch (error) {
      print("Error: $error");
      return [];
    }
  }

  Future<List<dynamic>> HeroApi() async {
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
}
