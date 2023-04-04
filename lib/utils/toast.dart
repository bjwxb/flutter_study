import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void toast(String content, {var duration = Toast.LENGTH_LONG, var gravity = ToastGravity.CENTER}) {
  Fluttertoast.showToast(
    msg: content,
    toastLength: duration,
    gravity: gravity,
    backgroundColor: const Color(0x99000000),
    textColor: Colors.white,
    fontSize: 15,
  );
}
