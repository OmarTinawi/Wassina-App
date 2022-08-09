import 'package:flutter/material.dart';
import 'package:shop/components/Banner/M/banner_m_style_4.dart';
import 'package:shop/components/Banner/S/banner_s_style_2.dart';
import 'package:shop/components/Banner/S/banner_s_style_3.dart';
import 'package:shop/components/safe_back.dart';
import 'package:shop/screens/home/views/components/flash_sale.dart';

import '../../../components/Banner/M/banner_m_with_counter.dart';
import '../../../components/Banner/S/banner_s_style_1.dart';
import '../../../components/Banner/S/banner_s_style_4.dart';
import '../../../constants.dart';
import '../../../models/product_model.dart';
import 'components/offer_carousel_and_categories.dart';
import 'components/carousel.dart';
import '../../../components/product/products_group.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeBack(
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: defaultPadding/4,vertical: defaultPadding/4),
                sliver: SliverToBoxAdapter(
                  child: Carousel(),
                ),
              ),
              SliverToBoxAdapter(
                  child: GroupOfProducts(
                tittle: "Popular product",
                products: demoPopularProducts,
              )),
              SliverPadding(
                padding: EdgeInsets.symmetric(
                    horizontal: defaultPadding /2), // edit padding
                sliver: SliverToBoxAdapter(
                  child: BannerMWithCounter(
                    duration: const Duration(hours: 2),
                    text: "Eid Sale \n50% Off",
                    press: () {},
                  ),
                ),
              ),
              SliverToBoxAdapter(
                  child: GroupOfProducts(
                tittle: "New product",
                products: demoPopularProducts2,
              )),
              // SliverPadding(
              //   padding: EdgeInsets.symmetric(vertical: defaultPadding/2),
              //   sliver: SliverToBoxAdapter(
              //     child: Column(
              //       children: [
              //         BannerSStyle1(
              //           title: "New \narrival",
              //           subtitle: "SPECIAL OFFER",
              //           discountParcent: 50,
              //           press: () {},
              //         ),
              //         const SizedBox(height: defaultPadding / 4),
              //         BannerSStyle2(
              //           title: "SUMMER \nSALE",
              //           bottomText: "UP TO 80% OFF",
              //           press: () {},
              //         ),
              //         const SizedBox(height: defaultPadding / 4),
              //         BannerSStyle3(
              //           image: "https://i.imgur.com/dBrsD0M.png",
              //           title: "Black \nfriday",
              //           press: () {},
              //         ),
              //         const SizedBox(height: defaultPadding / 4),
              //         BannerSStyle4(
              //           image: "https://i.imgur.com/dBrsD0M.png",
              //           title: "Black \nfriday",
              //           subtitle: "50% off",
              //           press: () {},
              //
              //         ),
              //       ],
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
