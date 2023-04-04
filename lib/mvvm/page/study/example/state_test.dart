import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_study/mvvm/commponets/title_bar.dart';

class StateTestPae extends StatefulWidget {
  const StateTestPae({Key? key}) : super(key: key);

  @override
  State<StateTestPae> createState() => _StateTestPaeState();
}

class _StateTestPaeState extends State<StateTestPae> {
  var i = 1;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const TitleBar(title: "state test",),
      body: Center(
        child: InkWell(
          onTap: (){
            setState(() {
              i++;
            });
          },
          child: Container(
            width: 200,
            height: 100,
            color: Colors.blueGrey,
            alignment: Alignment.center,
            child: Text("state test >> $i", style: TextStyle(color: Colors.white),),
          ),
        ),
      ),
    );
  }
}
