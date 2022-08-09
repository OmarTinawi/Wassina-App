import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shop/components/safe_back.dart';
import 'package:shop/models/cart_model.dart';
import 'package:shop/screens/entry_point/controllers/bottom_navigation_bar_controller.dart';

import '../../../../constants.dart';

class EmptyCartScreen extends StatelessWidget {
  EmptyCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  final BottomNavigationBarController controller = Get.find();
  myCart!.emptyCart();
    return Scaffold(
      body: SafeBack(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(defaultPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: SvgPicture.asset(
                    "assets/undraw/undraw_empty_cart.svg",
                    // height: MediaQuery.of(context).size.height*0.35,
                    width: MediaQuery.of(context).size.width * 0.8,
                  ),
                ),
                const SizedBox(height: defaultPadding * 3),
                Text(
                  "Your cart is empty :(",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
                const SizedBox(height: defaultPadding),
                Text(
                  "You have no items in your shopping cart."
                      "\nLet's go buy something!",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: defaultPadding * 3),
                ElevatedButton(
                  onPressed: () {
                    controller.setIndex(0);
                  },
                  child: const Text("Shop now"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
