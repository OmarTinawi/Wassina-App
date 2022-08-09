import 'package:flutter/material.dart';
import 'package:shop/components/Banner/S/banner_s_style_1.dart';
import 'package:shop/components/Banner/S/banner_s_style_4.dart';
import 'package:shop/constants.dart';
import '../../../models/product_model.dart';
import 'components/flash_sale.dart';
import 'components/offer_carousel_and_categories.dart';
import '../../../components/product/products_group.dart';

class HomeScreen1 extends StatelessWidget {
  const HomeScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: OffersCarouselAndCategories()),
            SliverToBoxAdapter(child: GroupOfProducts(tittle: "Popular product",products: demoPopularProducts,)),
            const SliverPadding(
              padding: EdgeInsets.symmetric(vertical: defaultPadding * 1.5),
              sliver: SliverToBoxAdapter(child: FlashSale()),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  BannerSStyle1(
                    title: "New \narrival",
                    subtitle: "SPECIAL OFFER",
                    discountParcent: 50,
                    press: () {},
                  ),
                  const SizedBox(height: defaultPadding / 4),
                  BannerSStyle4(
                    title: "SUMMER \nSALE",
                    subtitle: "SPECIAL OFFER",
                    bottomText: "UP TO 80% OFF",
                    press: () {},
                  ),
                  const SizedBox(height: defaultPadding / 4),
                  BannerSStyle4(
                    image: "https://i.imgur.com/dBrsD0M.png",
                    title: "Black \nfriday",
                    subtitle: "50% off",
                    bottomText: "Collection".toUpperCase(),
                    press: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
