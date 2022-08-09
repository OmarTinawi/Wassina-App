import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop/route/route_constants.dart';
import 'package:shop/route/router.dart' as router;
import 'package:shop/screens/auth/views/sign_up_screen.dart';
import 'package:shop/screens/onboarding/views/onboarding_screen.dart';
import 'entry_point1.dart';
import 'middleware/auth_middleware.dart';
import 'screens/auth/views/login_screen.dart';
import 'screens/entry_point/views/entry_point.dart';
import 'screens/forget_password/views/forget_password_screen.dart';
import 'theme/light_theme.dart';
import 'package:get/get.dart';


SharedPreferences? sharedPreferences;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Wassina Project2',
      theme: lightTheme(context),
      themeMode: ThemeMode.light,
      onGenerateRoute: router.generateRoute,
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page:()=> OnBoardingScreen() , middlewares: [AuthMiddleWare()]),
        GetPage(name: "/login", page:()=> LoginScreen() ),
        GetPage(name: "/sign_up", page:()=> SignUp()),
        GetPage(name: "/entry_point", page:()=> EntryPoint()),
        GetPage(name: "/forget_password", page:()=> ForgetPassword()),
      ],

    );
  }
}
