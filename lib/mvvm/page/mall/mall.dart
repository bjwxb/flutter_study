import 'package:flutter/material.dart';
import 'package:flutter_study/mvvm/page/mine/mine_controller.dart';
import 'package:get/get.dart';

import '../../../utils/log.dart';

class MallPage extends GetView<MineController> {
  const MallPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    logD("----- mall build ------");
    return const Scaffold(
      backgroundColor: Colors.black12,
      body: Center(
        child: Text('mall page'),
      ),
    );
  }
}
