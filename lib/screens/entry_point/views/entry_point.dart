import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:shop/components/safe_back.dart';
import 'package:shop/screens/cart/controllers/cart_controller.dart';
import 'package:shop/screens/entry_point/controllers/bottom_navigation_bar_controller.dart';
import 'package:shop/screens/search/views/search_screen.dart';

import '../../../constants.dart';
import '../../../models/cart_model.dart';
import '../model/pages.dart';
import 'notification.dart';

class EntryPoint extends StatelessWidget {
  EntryPoint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NotificationApi.init();

    SvgPicture svgIcon(String src, {Color? color}) {
      return SvgPicture.asset(
        src,
        height: 24,
        color: color ??
            Theme.of(context).iconTheme.color!.withOpacity(
                Theme.of(context).brightness == Brightness.dark ? 0.3 : 1),
      );
    }

    CartController cartController = Get.put(CartController());

    return SafeBack(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            // backgroundColor: Colors.red,
            leading: const SizedBox(),
            leadingWidth: 0,
            elevation: 1.1,
            centerTitle: false,
            title: Image.asset(
              "assets/logo/logo2-tittle.png",
              color: Theme.of(context).iconTheme.color,
              // height: 20,
              width: 105,
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Get.to(()=>SearchScreen(),duration: Duration(milliseconds: 500),transition: Transition.downToUp);
                },
                icon: SvgPicture.asset(
                  "assets/icons/Search.svg",
                  height: 24,
                  color: Theme.of(context).textTheme.bodyText1!.color,
                ),
              ),
              IconButton(
                onPressed: () =>
                  NotificationApi.showNotification(
                    title: 'Hey! Omar',
                    body: 'Do We have everything we need for lunch on friday',
                    payload: 'omar.abs'
                  )
                ,
                icon: SvgPicture.asset(
                  "assets/icons/Notification.svg",
                  height: 24,
                  color: Theme.of(context).textTheme.bodyText1!.color,
                ),
              ),
            ],
          ),

          body: GetBuilder <BottomNavigationBarController>(
            init: BottomNavigationBarController(),
            builder : (controller)=> PageTransitionSwitcher(
              duration: defaultDuration,
              transitionBuilder: (child, animation, secondAnimation) {
                return FadeThroughTransition(
                  child: child,
                  animation: animation,
                  secondaryAnimation: secondAnimation,
                );
              },
              child: pagesList[controller.currentIndex == 3 ? myCart!.products.isEmpty ? 3:4 : controller.currentIndex > 3 ? controller.currentIndex+1 : controller.currentIndex],
            ),
          ),

          bottomNavigationBar: GetBuilder<BottomNavigationBarController>(
            builder:(controller) =>  Container(
                padding: const EdgeInsets.only(top: defaultPadding / 2),
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.white
                    : const Color(0xFF101015),
                child: BottomNavigationBar(
                  currentIndex: controller.currentIndex,
                  onTap: (index) {
                    if (index != controller.currentIndex) {
                      controller.setIndex(index);
                    }
                  },
                  backgroundColor: Theme.of(context).brightness == Brightness.light
                      ? Colors.white
                      : const Color(0xFF101015),
                  type: BottomNavigationBarType.fixed,
                  // selectedLabelStyle: TextStyle(color: primaryColor),
                  selectedFontSize: 12,
                  selectedItemColor: primaryColor,
                  unselectedItemColor: Colors.transparent,
                  items: [
                    BottomNavigationBarItem(
                      icon: svgIcon("assets/icons/home.svg",),
                      activeIcon: svgIcon("assets/icons/home.svg", color: primaryColor),
                      label: "Home",
                    ),
                    BottomNavigationBarItem(
                      icon: svgIcon("assets/icons/Category.svg"),
                      activeIcon:
                      svgIcon("assets/icons/Category.svg", color: primaryColor),
                      label: "Discover",
                    ),
                    BottomNavigationBarItem(
                      icon: svgIcon("assets/icons/Bookmark.svg"),
                      activeIcon:
                      svgIcon("assets/icons/Bookmark.svg", color: primaryColor),
                      label: "Bookmark",
                    ),
                    BottomNavigationBarItem(
                      icon:GetBuilder<CartController>(
                        builder: (GetxController controller) => Stack(
                            alignment: AlignmentDirectional.center,
                              children:[
                                Text(" ${myCart!.length}",
                                style: TextStyle(
                                  fontSize: 8,
                                  fontWeight: FontWeight.w800,
                                  color: blackColor80
                                ),
                                ),
                                svgIcon("assets/icons/Bag.svg")
                              ]),
                      ),
                      activeIcon: svgIcon("assets/icons/Bag.svg", color: primaryColor),
                      label: "Cart",
                    ),
                    BottomNavigationBarItem(
                      icon: svgIcon("assets/icons/Profile.svg"),
                      activeIcon:
                      svgIcon("assets/icons/Profile.svg", color: primaryColor),
                      label: "Profile",
                    ),
                  ],
                )),
          )),
    );
  }
}
