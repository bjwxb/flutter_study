import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_study/mvvm/commponets/title_bar.dart';
import 'package:flutter_study/mvvm/page/home/detail/counter.dart';
import 'package:flutter_study/mvvm/page/home/detail/home_detail_controller.dart';
import 'package:flutter_study/mvvm/page/home/detail/other_page.dart';
import 'package:flutter_study/utils/log.dart';
import 'package:flutter_study/utils/toast.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../base/load_state.dart';

class HomeDetailPage extends GetView<HomeDetailController> {
  HomeDetailPage({Key? key}) : super(key: key);

  final streamController = StreamController();

  @override
  Widget build(BuildContext context) {
    var data = Get.parameters;
    String? name;
    name = data['name'];

    controller.getData();
    return ChangeNotifierProvider(
      create: (_) => Counter(),
      child: Scaffold(
        appBar: const TitleBar(
          title: "home detail",
        ),
        body: _buildBody(context, controller, name ?? ""),
      ),
    );
  }

  Widget _buildBody(
      BuildContext context, HomeDetailController controller, String name) {
    return Obx(() {
      return LoadStateLayout(
        state: controller.state.value,
        errorRetry: () => controller.getSuccessData(),
        emptyRetry: () => controller.getData(),
        successWidget: _buildContentWidget(context, name),
      );
    });
  }

  Widget _buildContentWidget(BuildContext context, String name) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: GetBuilder<HomeDetailController>(
                    builder: (controller) {
                      return Container(
                        alignment: Alignment.center,
                        color: Colors.black38,
                        height: 50,
                        child: Text(
                          "getXBuilder update count = ${controller.count}",
                          style: const TextStyle(color: Colors.white),
                        ),
                      );
                    },
                  )),
              TextButton(
                onPressed: () {
                  controller.increaseCount();
                },
                // style: ButtonStyle(
                //   tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                //   //设置水波纹颜色
                //   // overlayColor: MaterialStateProperty.all(Colors.blue),
                //   //设置边框
                //   // side: MaterialStateProperty.all(
                //   //     const BorderSide(color: Colors.red, width: 1)),
                //   //外边框装饰 会覆盖 side 配置的样式
                //   shape: MaterialStateProperty.all(
                //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
                //   // shape: MaterialStateProperty.all(const StadiumBorder()),
                // ),
                child: const Text(
                  "计数器",
                  style: TextStyle(fontSize: 15, color: Colors.red),
                ),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Obx(() {
                  return Container(
                      color: Colors.red,
                      height: 50,
                      alignment: Alignment.center,
                      child: Text(
                        "obx update count = ${controller.count2.value}",
                        style: const TextStyle(color: Colors.white),
                      ));
                }),
              ),
              TextButton(
                onPressed: () {
                  controller.increaseCountByObs();
                },
                // style: ButtonStyle(
                //   tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                //   //设置水波纹颜色
                //   // overlayColor: MaterialStateProperty.all(Colors.blue),
                //   //设置边框
                //   // side: MaterialStateProperty.all(
                //   //     const BorderSide(color: Colors.red, width: 1)),
                //   //外边框装饰 会覆盖 side 配置的样式
                //   shape: MaterialStateProperty.all(
                //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
                //   // shape: MaterialStateProperty.all(const StadiumBorder()),
                // ),
                child: const Text(
                  "计数器obs",
                  style: TextStyle(fontSize: 15, color: Colors.blueGrey),
                ),
              )
            ],
          ),
          Consumer<Counter>(
            builder: (context, counter, child) => Container(
              padding: EdgeInsets.all(10),
              color: Colors.black26,
              child: Text(
                'provider update count = ${counter.count}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
          _buildButton("provider click event", () {
            logD("=-=-=-=-=");
            Provider.of<Counter>(context, listen: true).increment();
            logD("--------click ------");
          }),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              '获取传过来的参数: $name',
              style: const TextStyle(fontSize: 18, color: Colors.red),
            ),
          ),
          _buildButton("stream send value Int random", () {
            if (streamController.isClosed) {
              toast("stream closed!!!");
              return;
            }
            streamController.sink.add(Random().nextInt(100));
          }),
          _buildButton("stream send value: hello ", () {
            if (streamController.isClosed) {
              toast("stream closed!!!");
              return;
            }
            streamController.sink.add('hello ${Random().nextInt(10)}');
          }),
          _buildButton("send error, and closed stream ", () {
            if (streamController.isClosed) {
              toast("stream closed!!!");
              return;
            }
            streamController.sink.addError('error');
            streamController.sink.close();
          }),
          StreamBuilder(
              stream: streamController.stream,
              builder: (ctx, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return Text('stream none received: ${snapshot.data}');
                  case ConnectionState.waiting:
                    return Text('stream waitting received: ${snapshot.data}');
                  case ConnectionState.active:
                    return Text('stream active received: ${snapshot.data}');
                  case ConnectionState.done:
                    return Text('stream done received: ${snapshot.data}');
                }
                // return CircularProgressIndicator();
              }),
          _buildButton("带参数返回字符串-》哈哈大笑", () {
            Get.back(result: {"result": "哈哈大笑"});
          }),
          _buildButton("其他页面调用计数器方法", () {
            Navigator.push(context, MaterialPageRoute<void>(
              builder: (BuildContext context) {
                return const OtherPage();
              },
            ));
          }),
        ],
      ),
    );
  }

  Widget _buildButton(String text, VoidCallback calback) {
    return InkWell(
      onTap: calback,
      child: Container(
        alignment: Alignment.center,
        color: Colors.blueGrey,
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        height: 50,
        width: double.infinity,
        child: Text(
          text,
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }
}
