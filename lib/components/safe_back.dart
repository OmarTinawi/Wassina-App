import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shop/screens/cart/controllers/cart_controller.dart';

import '../constants.dart';

class SafeBack extends StatelessWidget {
  SafeBack({Key? key,required this.child, this.onBack}) : super(key: key);
  DateTime timeBackPressed = DateTime.now();
  final Widget child;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
      final difference = DateTime.now().difference(timeBackPressed);
      final isExitWarning = difference >= Duration(seconds: 2);
      timeBackPressed = DateTime.now();

      if(isExitWarning){
        final message = 'Press back again to exit';
        Fluttertoast.showToast(msg: message, backgroundColor: blackColor80);
        return false;
      }
      else{
        onBack??
        Fluttertoast.cancel();
        return true;
      }
    },
    child: this.child
    );
  }
}
