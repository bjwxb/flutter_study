import 'package:flutter/material.dart';
import 'package:flutter_study/mvvm/commponets/title_bar.dart';
import 'package:flutter_study/mvvm/page/base/base_controller.dart';
import 'package:flutter_study/mvvm/page/base/load_state.dart';
import 'package:get/get.dart';

abstract class BasePage<T extends BaseController> extends GetView<T> {

  const BasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleBar(
        title: "base view",
      ),
      body: _buildBody(context, controller),
    );
  }

  Widget _buildBody(BuildContext context, BaseController controller) {
    return Obx(() {
      return LoadStateLayout(
        state: controller.state.value,
        errorRetry: (){
          controller.setLoading();
          retry();
        },
        emptyRetry: (){
          controller.setLoading();
          retry();
        },
        successWidget: buildWidget(context),
      );
    });
  }

  Widget buildWidget(BuildContext context);

  void retry() {
  }
}
