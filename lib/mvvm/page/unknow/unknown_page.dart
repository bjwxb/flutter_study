import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UnknownPage extends StatelessWidget {
  const UnknownPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        color: Colors.blue,
        child: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Center(
            child: Text(
              "未知路由，单击返回",
              style: TextStyle(fontSize: 18, color: Colors.black87)
            ),
          ),
        ),
      ),
    );
  }
}
