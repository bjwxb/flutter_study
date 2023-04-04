import 'package:flutter/material.dart';
import 'package:flutter_study/mvvm/commponets/title_bar.dart';
import 'package:flutter_study/mvvm/page/home/detail/home_detail_controller.dart';
import 'package:get/get.dart';

class OtherPage extends GetView {
  const OtherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TitleBar(
        title: "other page",
      ),
      body: Center(
        child: InkWell(
          onTap: (){
            HomeDetailController c = Get.find();
            c.increaseCount();
            c.increaseCountByObs();
          },
          child: Container(
            width: 200,
            height: 100,
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            color: Colors.blueGrey,
            child: const Text(
              "通过controller点击调用其他页面的方法",
              textAlign: TextAlign.start,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
