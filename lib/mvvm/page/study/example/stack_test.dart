import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_study/mvvm/commponets/title_bar.dart';
import 'package:get/get.dart';

class StackTestPage extends GetView {
  const StackTestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TitleBar(title: "stack test",),
      body: Container(
        color: Colors.grey,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(//Stack的布局行为，根据child是positioned还是non-positioned来区分。
              alignment: Alignment.topCenter,//影响non-positioned的子节点
              children:const  <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage("https://xiuxiupro-material-center.meitudata.com/poster/8c98b88845630b4afc694e90ca81daa2.png"),
                  backgroundColor: Colors.blueGrey,
                  radius: 80,
                ),
                Text("哈哈",style: TextStyle(color: Colors.red, fontSize: 18),),
                Positioned(//根据left/right/top/bottom确定位置
                  top: 10,
                  right: 10,
                  child: Icon(Icons.delete, color: Colors.red,),
                )
              ],
            ),
            TextField(
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp("[0-9Xx]")),
                LengthLimitingTextInputFormatter(18)
              ],
              controller: TextEditingController(text: ''),
              textAlign: TextAlign.start,
              keyboardType: TextInputType.url,
              textInputAction: TextInputAction.next,
              // inputFormatters: [LengthLimitingTextInputFormatter(18)],
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 5),
                border: InputBorder.none,
                hintText: '请填写你的身份证号码',
              ),
              onChanged: (idNum) {},
              autofocus: false,
            ),
            Card(
              color: Colors.blueAccent,
              //z轴的高度，设置card的阴影
              elevation: 20.0,
              margin: const EdgeInsets.only(top: 50),
              //设置shape，这里设置成了R角
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),),
              //对Widget截取的行为，比如这里 Clip.antiAlias 指抗锯齿
              clipBehavior: Clip.antiAlias,
              semanticContainer: false,
              child: Container(
                color: Colors.deepPurpleAccent,
                width: 200,
                height: 150,
                alignment: Alignment.center,
                child: const Text(
                  "Card",
                  style: TextStyle(fontSize: 28, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
