import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shop/components/network_image_with_loader.dart';
import 'package:shop/components/product/product_card.dart';
import 'package:shop/components/safe_back.dart';
import 'package:shop/constants.dart';
import 'package:shop/screens/section/components/categories.dart';

class SectionScreen extends StatelessWidget {
  const SectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: true,
            pinned: true,
            title: Image.asset("assets/logo/logo.png", height: 45),
            elevation: 1,
            leading: IconButton(
              padding: EdgeInsets.all(0),
              onPressed: () {
                Get.back();
              },
              icon: SvgPicture.asset(
                "assets/icons/angle-left.svg",
                height: 20,
                color: Theme.of(context).iconTheme.color!.withOpacity(
                    Theme.of(context).brightness == Brightness.dark ? 0.3 : 1),
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  // barController.setIndex(3);
                  Get.toNamed('/entry_point');
                },
                icon: SvgPicture.asset(
                  "assets/icons/Bag.svg",
                  height: 24,
                  color: Theme.of(context).iconTheme.color!.withOpacity(
                      Theme.of(context).brightness == Brightness.dark ? 0.3 : 1),
                ),
              )
            ],
          ),
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.4,
            automaticallyImplyLeading: false,
            // stretch: true,
            flexibleSpace: const FlexibleSpaceBar(
              centerTitle: true,
              background: Padding(
                padding: EdgeInsets.all(defaultPadding / 2),
                child: NetworkImageWithLoader(
                  "https://scontent.famm10-1.fna.fbcdn.net/v/t31.18172-8/893509_567556673277751_1777489261_o.jpg?_nc_cat=111&ccb=1-7&_nc_sid=19026a&_nc_ohc=Tn3vHeIettMAX-_fdQG&_nc_oc=AQnqaw4HmgwfluRj_8IfAk-VGIjCut0HyDxCAf9MUY3FkJQRTf_Grtp_y57BJWXayeU&_nc_ht=scontent.famm10-1.fna&oh=00_AT8bojc3mZiBhDV3O7lvShmzyRbANr_fdPMaDqyZhLRxWg&oe=62CD98A1",
                  // fit: BoxFit.fitHeight,
                  radius: defaultBorderRadious / 1.5,
                ),
              ),
            ),
          ),
          SliverAppBar(
            pinned: true,
            automaticallyImplyLeading: false,
            centerTitle: true,
            elevation: 0,
            title: Text(
              "Al Farouk Restaurant",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 24, color: blackColor80),
            ),
          ),
          const SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            // floating: true,
            titleSpacing: 0,
            title: Categories(),
            elevation: 1.5,
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            sliver: SliverToBoxAdapter(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(bottom: defaultPadding),
                        child: ProductCard(
                            image:
                                "https://cdn.salla.sa/VDrKQ/LqH6WpMOaFKc1IwXbMoxZod021EqOb6BbRvPbsSM.jpg",
                            brandName: "Muhanna",
                            title: "Test product name",
                            price: 22.5,
                            press: () {}),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(bottom: defaultPadding),
                        child: ProductCard(
                            image:
                                "https://kitchen.sayidaty.net/uploads/small/fb/fb4773213b88553b88470d966fb147e1_w750_h750.jpg",
                            brandName: "Muhanna",
                            title: "Test product name",
                            price: 22.5,
                            press: () {}),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(bottom: defaultPadding),
                        child: ProductCard(
                            image:
                                "https://dlwaqty.com//storage/262303/%D8%B4%D8%A7%D9%88%D8%B1%D9%85%D8%A7-%D9%84%D8%AD%D9%85%D8%A9-%D8%A8%D8%A7%D9%84%D8%A8%D9%8A%D8%AA.jpg",
                            brandName: "Muhanna",
                            title: "Test product name",
                            price: 22.5,
                            press: () {}),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(bottom: defaultPadding),
                        child: ProductCard(
                            image:
                                "https://imgy.pro/foodtoday/800x816/editor/Image1_2202216143614633904638.jpg",
                            brandName: "Muhanna",
                            title: "Test product name",
                            price: 22.5,
                            press: () {}),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(bottom: defaultPadding),
                        child: ProductCard(
                            image:
                                "https://img-global.cpcdn.com/recipes/0306d14fd4e582c3/1200x630cq70/photo.jpg",
                            brandName: "Muhanna",
                            title: "Test product name",
                            price: 22.5,
                            press: () {}),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(bottom: defaultPadding),
                        child: ProductCard(
                            image:
                                "https://cdn.salla.sa/VDrKQ/LqH6WpMOaFKc1IwXbMoxZod021EqOb6BbRvPbsSM.jpg",
                            brandName: "Muhanna",
                            title: "Test product name",
                            price: 22.5,
                            press: () {}),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(bottom: defaultPadding),
                        child: ProductCard(
                            image:
                                "https://cdn.salla.sa/VDrKQ/LqH6WpMOaFKc1IwXbMoxZod021EqOb6BbRvPbsSM.jpg",
                            brandName: "Muhanna",
                            title: "Test product name",
                            price: 22.5,
                            press: () {}),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(bottom: defaultPadding),
                        child: ProductCard(
                            image:
                                "https://kitchen.sayidaty.net/uploads/small/fb/fb4773213b88553b88470d966fb147e1_w750_h750.jpg",
                            brandName: "Muhanna",
                            title: "Test product name",
                            price: 22.5,
                            press: () {}),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
