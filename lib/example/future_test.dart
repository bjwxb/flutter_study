import 'dart:async';

import 'package:flutter_study/utils/log.dart';

String getName() {
  logD('--- future vaule');
  return 'July';
}

void dartLoopTest() {
  Future x0 = Future(() => null);
  Future x = Future(() => print('1')); //6
  Future(() => print('2')); //9
  scheduleMicrotask(() => print('3')); //2
  x.then((value) {
    print('4'); //7
    Future(() => print('5')); //10
  }).then((value) => print('6')); //8
  print('7'); // 1
  x0.then((value) {
    print('8'); //3
    scheduleMicrotask(() {
      print('9'); //5
    });
    Future(() => print('11'));
  }).then((value) => print('10')); //4
}

void main() {
  dartLoopTest();
}

void main3() {
  final future = Future.delayed(const Duration(seconds: 1), () => 36);
  final stream = Stream.periodic(const Duration(seconds: 1), (_) => 77);
  future.then((value) => logD(">>>> $value"));
  stream.listen((event) {
    logW(">> $event");
  });
}

void main2() {
  logD(">>> main start <<<<");
  Future.sync(() => logD("---- future.sync >>"));
  Future.value(getName());
  Future.delayed(const Duration(seconds: 1), () {
    logD("**** future delayed 1s");
  });
  Future.sync(() => logD('>>>>>> sync 消息'));
  Future.wait([
    //wait表示多个任务都完成之后的回调
    // 2秒后返回结果
    Future.delayed(new Duration(seconds: 2), () {
      return "hello";
    }),
    // 4秒后返回结果
    Future.delayed(new Duration(seconds: 4), () {
      return " world";
    })
  ]).then((results) {
    logD(results[0] + results[1]);
  }).catchError((e) {
    logD(e);
  });

  //3. 执行事件队列中的消息
  Future(() {
    //sleep(Duration(seconds: 2));//会阻塞当前线程，延迟Future.delayed的执行
    logD('>>>> normal futuer <<<<<');
  });

  //2. 在执行微任务队列中的消息
  Future.microtask(() => logD('_+_+_+_+_+_+_+_+ microtask =='));

  //1. 先执行main isolate中的语句
  logD('------ main end -----');
}
