import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shop/components/safe_back.dart';
import 'package:shop/main.dart';
import 'package:shop/models/address_model.dart';
import 'package:shop/screens/account/components/option.dart';
import 'package:shop/screens/account/components/options_list.dart';
import 'package:shop/screens/addresses/views/address_screen.dart';
import 'package:shop/screens/addresses/views/no_address_screen.dart';

import '../../../constants.dart';
import '../../../models/cart_model.dart';
import '../../FAQ/views/faq.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      body: SafeBack(
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.symmetric(
                    horizontal: defaultPadding / 2, vertical: defaultPadding),
                sliver: SliverToBoxAdapter(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(defaultBorderRadious)
                    ),
                    child: InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(0),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/Profile.svg",
                              height: 42,
                              color:
                                  Theme.of(context).iconTheme.color!.withOpacity(1),
                            ),
                            SizedBox(
                              width: defaultPadding / 4,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Hi, Omar",
                                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontSize: 18
                                  ),
                                ),
                                const Text("omar.tnbo@gmail.com")
                              ],
                            ),
                            Spacer(),
                            const Icon(
                              Icons.arrow_forward_ios_rounded,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // SliverPadding(
              //   padding: const EdgeInsets.symmetric(
              //       horizontal: defaultPadding / 2,
              //       vertical: defaultPadding / 4),
              //   sliver: SliverToBoxAdapter(
              //     child: InkWell(onTap: () {}, child: UpgradeCard()),
              //   ),
              // ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(
                    horizontal: defaultPadding,
                    vertical: defaultPadding / 2),
                sliver: SliverToBoxAdapter(
                  child: OptionList(
                    listTitle: "Account",
                    Options: [
                      Option(
                        icon: "assets/icons/receipt.svg",
                        title: "Orders",
                        press: () {},
                      ),
                      Option(
                        icon: "assets/icons/home-location.svg",
                        title: "Addresses",
                        press: () {
                          Get.to(()=> Address(), transition: Transition.fadeIn ,duration: const Duration(milliseconds: 500));
                        },
                      ),
                      Option(
                        icon: "assets/icons/heart.svg",
                        title: "Wishlist",
                        press: () {},
                      )
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: defaultPadding * 0.25,
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(
                    horizontal: defaultPadding ,
                    vertical: defaultPadding / 2),
                sliver: SliverToBoxAdapter(
                  child: OptionList(
                    listTitle: "Settings",
                    Options: [
                      Option(
                        icon: "assets/icons/bell.svg",
                        title: "Notification",
                        press: () {},
                      ),
                      Option(
                        icon: "assets/icons/globe.svg",
                        title: "Language",
                        press: () {},
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: defaultPadding * 0.25,
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(
                    horizontal: defaultPadding ,
                    vertical: defaultPadding / 2),
                sliver: SliverToBoxAdapter(
                  child: OptionList(
                    listTitle: "Help & Support",
                    Options: [
                      Option(
                        icon: "assets/icons/headset.svg",
                        title: "Get Help",
                        press: () {},
                      ),
                      Option(
                        icon: "assets/icons/interrogation.svg",
                        title: "FAQ",
                        press: () {
                          Get.to(()=> FAQ() , transition: Transition.fadeIn ,duration: const Duration(milliseconds: 250));
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: defaultPadding /2,
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(
                    horizontal: defaultPadding ,
                    vertical: defaultPadding / 2),
                sliver: SliverToBoxAdapter(
                  child: InkWell(
                    onTap: () {
                      myCart = CartModel(
                        products: [
                        ],
                        quantity: [
                        ],
                        sum: 0,
                        discount: 0,
                      );
                      sharedPreferences!.clear();
                      Get.offAllNamed("/");
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: defaultPadding / 1.5),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/sign-out.svg",
                            height: 22,
                            color: errorColor,
                          ),
                          Spacer(),
                          Text(
                            "Log Out",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: errorColor),
                          ),
                          Spacer(flex: 20,)
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
