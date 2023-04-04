import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialTelDialog extends Dialog {
  final double cornerRadius = 8; //背景圆角半径
  final String phone = '010-888888';

  const DialTelDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(cornerRadius), color: Colors.white),
          // constraints: const BoxConstraints(
          //   minHeight: 100,
          // ),
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 30, bottom: 30),
                padding: const EdgeInsets.all(12),
                alignment: Alignment.center,
                child: Text(
                  phone,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 16, color: Colors.black, decoration: TextDecoration.none, fontWeight: FontWeight.bold),
                ),
              ),
              Divider(
                color: Colors.grey.withOpacity(0.5),
                height: 0.5,
              ),
              Material(
                borderRadius: BorderRadius.circular(cornerRadius),
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        style: ButtonStyle(
                          //背景颜色
                          backgroundColor: MaterialStateProperty.resolveWith((states) {
                            //设置按下时的背景颜色
                            if (states.contains(MaterialState.pressed)) {
                              return Colors.grey.withOpacity(0.2);
                            }
                            return Colors.white;
                          }),
                          //设置水波纹颜色
                          overlayColor: MaterialStateProperty.all(Colors.white70),
                          //设置按钮内边距
                          padding: MaterialStateProperty.all(EdgeInsets.all(5)),
                          //设置按钮的大小
                          minimumSize: MaterialStateProperty.all(Size(200, 50)),
                          //设置边框
                          // side: MaterialStateProperty.all(BorderSide(color: Colors.grey, width: 1)),
                          //外边框装饰 会覆盖 side 配置的样式
                          // shape: MaterialStateProperty.all(StadiumBorder()),
                        ),
                        child: const Text(
                          '取消',
                          style: TextStyle(fontSize: 15, color: Colors.red),
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.grey.withOpacity(0.5),
                      width: 0.5,
                      height: 44,
                    ),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          height: 44,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(cornerRadius)),
                          ),
                          child: const Text(
                            '呼叫',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.blue,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
