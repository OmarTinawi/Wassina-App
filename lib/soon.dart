import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop/components/safe_back.dart';
import 'package:shop/constants.dart';

class Soon extends StatelessWidget {
  const Soon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeBack(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: SvgPicture.asset(
                    "assets/undraw/undraw_mobile_app.svg",
                    // height: MediaQuery.of(context).size.height*0.35,
                    width: MediaQuery.of(context).size.width * 0.8,
                  ),
                ),
                const SizedBox(height: defaultPadding * 3),
                Text(
                  "Soooon !",
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(height: defaultPadding / 2),
                Text(
                  "Omar Altinawi",
                  style: TextStyle(
                    fontSize: 14,
                    color: primaryColor,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
