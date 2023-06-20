// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'api_controller.dart';

class NestedDataPage extends StatefulWidget {
  @override
  _NestedDataPageState createState() => _NestedDataPageState();
}

class _NestedDataPageState extends State<NestedDataPage> {
  List<dynamic>? data; // เปลี่ยนจาก Map<String, dynamic> เป็น List<dynamic>

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final nestedData = await ApiController.fetchData();
      setState(() {
        data = nestedData.toList();
      });
    } catch (error) {
      // จัดการกรณีเกิดข้อผิดพลาดในการเรียก API ตรงนี้
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    final level4_1Data = data != null ? data![1]['name'] : null;
    // final level4_2Data =
    //     data != null ? data![0]['skills']['passiveSkill']['name'] : null;

    return Scaffold(
      appBar: AppBar(
        title: Text('Nested Data Page'),
      ),
      body: data == null
          ? Center(child: CircularProgressIndicator())
          : ListView(
              children: [
                Text('Nested Data 1: $level4_1Data'),
                // Text('Nested Data 2: $level4_2Data'),
                // เพิ่มตัวอย่างการแสดงผลอื่น ๆ ที่คุณต้องการ
              ],
            ),
    );
  }
}
