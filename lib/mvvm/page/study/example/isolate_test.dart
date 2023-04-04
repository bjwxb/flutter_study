import 'dart:isolate';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_study/mvvm/commponets/title_bar.dart';
import 'package:flutter_study/utils/log.dart';
import 'package:get/get.dart';

class IsolateTestPage extends GetView {
  IsolateTestPage({Key? key}) : super(key: key);

  var _content = "init content";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TitleBar(title: "Isolate test",),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context){
    return InkWell(
      onTap: () async {
        // Navigator.pop(context, "hello wrold");
        logD('>>>==== thread name is ${Isolate.current.debugName}');
        isolateTest();
      },
      child: Center(
        child: Text(_content),
      ),
    );
  }

  Isolate? _isolate;
  Future<dynamic> isolateTest() async {
    final rp = ReceivePort();
    _isolate = await Isolate.spawn(entryPoint, rp.sendPort);
    rp.listen((message) {
      _content = message;
      logD("--- ${Isolate.current.debugName} >> $message");
      // _isolate?.kill(priority: Isolate.immediate);
    });
  }
}

entryPoint(SendPort sendPort){
  logD(">> thread name is ${Isolate.current.debugName}");
  sendPort.send("Hello, I from Isolate ${Random().nextInt(10)}");
}
