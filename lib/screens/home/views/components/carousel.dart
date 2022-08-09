import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/components/Banner/M/banner_m.dart';
import 'package:shop/components/Banner/M/banner_m_style_1.dart';
import 'package:shop/components/Banner/M/banner_m_style_2.dart';
import 'package:shop/components/Banner/M/banner_m_style_3.dart';
import 'package:shop/components/Banner/M/banner_m_style_4.dart';
import 'package:shop/components/dot_indicators.dart';

import '../../../../constants.dart';
import '../../../section/views/section_screen.dart';

class Carousel extends StatefulWidget {
  const
  Carousel({
    Key? key,
  }) : super(key: key);

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int _selectedIndex = 0;
  late PageController _pageController;
  late Timer _timer;

  // Offers List
  List offers = [
    BannerMStyle1(
      text: "New items with \nFree shipping",
      image: "https://wassina.net/ecdata/stores/YFSVMV7478/image/data/cover%20photo%20[258with%20logo%20super%20market%20.jpg",
      buttonText: "Shop now",
      press: () {},
    ),
    BannerM(
      image: "https://i.ibb.co/L8KRpQg/photo-2022-05-07-00-08-03.jpg",
      onlyImage: true,
      press: () {
        Get.to(() => SectionScreen(),
            transition: Transition.fadeIn,
            duration: const Duration(milliseconds: 500),
            preventDuplicates: false);
      },
    ),
    BannerMStyle2(
      title: "Black \nfriday",
      subtitle: "Collection",
      discountParcent: 50,
      press: () {},
    ),
    BannerMStyle3(
      title: "Grab \nyours now",
      discountParcent: 50,
      press: () {},
    ),
    BannerMStyle4(
      // image: , user your image
      title: "SUMMER \nSALE",
      subtitle: "SPECIAL OFFER",
      discountParcent: 75,
      press: () {},
    ),

  ];

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_selectedIndex < offers.length - 1) {
        _selectedIndex++;
      } else {
        _selectedIndex = 0;
      }

      _pageController.animateToPage(
        _selectedIndex,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOutCubic,
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.87,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultBorderRadious)
        ),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: offers.length,
              onPageChanged: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              itemBuilder: (context, index) => offers[index],
            ),
            FittedBox(
              child: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: SizedBox(
                  height: 16,
                  child: Row(
                    children: List.generate(
                      offers.length,
                      (index) {
                        return Padding(
                          padding:
                              const EdgeInsets.only(left: defaultPadding / 4),
                          child: DotIndicator(
                            isActive: index == _selectedIndex,
                            activeColor: Colors.white70,
                            inActiveColor: Colors.white54,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
