import 'package:flutter/material.dart';
import 'package:flutter_study/mvvm/commponets/title_bar.dart';
import 'package:get/get.dart';

class ScrollTestPage extends GetView {
  const ScrollTestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return Scaffold(
      appBar: const TitleBar(title: "scroll test",),
      body: SingleChildScrollView(
        child: Column(
          children: str.split("").map((e){
            return Container(
              color: Colors.black12,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 10),
              margin: const EdgeInsets.only(bottom: 1),
              child: Text(e, textScaleFactor: 2.0,),
            );
          }).toList(),
        ),
      ),
    );
  }
}
