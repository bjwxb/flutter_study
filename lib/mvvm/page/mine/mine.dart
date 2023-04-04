import 'package:flutter/material.dart';
import 'package:flutter_study/mvvm/page/mine/mine_controller.dart';
import 'package:flutter_study/utils/log.dart';
import 'package:get/get.dart';

class MinePage extends GetView<MineController> {
  const MinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    logD("**** mine build *****");
    return const Scaffold(
      body: Center(
        child: Text('mine page'),
      ),
    );
  }
}
