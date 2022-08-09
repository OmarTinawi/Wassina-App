import 'package:flutter/material.dart';
import 'package:shop/entry_point1.dart';
import 'package:shop/screens/onboarding/views/onboarding_screen.dart';

import 'screen_export.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {

    case onbordingScreenRoute:
      return MaterialPageRoute(
        builder: (context) => const OnBoardingScreen(),
      );

    case logInScreenRoute:
      return MaterialPageRoute(
        builder: (context) => LoginScreen(),
      );

    case homeScreenRoute:
      return MaterialPageRoute(
        builder: (context) => const HomeScreen1(),
      );

    case entryPointScreenRoute:
      return MaterialPageRoute(
        builder: (context) => const EntryPoint1(),
      );

    default:
      return MaterialPageRoute(
        // Make a screen for undefine
        builder: (context) =>  LoginScreen(),
      );
  }
}
