import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../main.dart';

class AuthMiddleWare extends GetMiddleware {

  @override
  int? get priority => 1;

  RouteSettings? redirect(String? route) {
    if (sharedPreferences!.getInt("id") != null) {
      return const RouteSettings(
          name: "/entry_point"
      );
    }

    if (sharedPreferences!.getInt("skip") != null) {
      return const RouteSettings(
          name: "/login"
      );
    }

  }
}