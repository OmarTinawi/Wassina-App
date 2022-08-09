import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';
import '../../../models/product_model.dart';
import '../../blur_container.dart';
import '../../product/products_group.dart';
import 'banner_m.dart';

// class BannerMWithCounter extends StatelessWidget {
//   const BannerMWithCounter({
//     Key? key,
//     // this.image = "https://i.imgur.com/pRgcbpS.png",
//     this.image = "https://media.istockphoto.com/photos/ramadan-kareem-lantern-and-dates-fruit-with-city-light-background-picture-id1305026622?b=1&k=20&m=1305026622&s=170667a&w=0&h=EEqBsXLytjJGv5oQaxnGB19SnFhgj-c7z30FLgmwZiQ=",
//     required this.text,
//     required this.duration,
//     required this.press,
//   }) : super(key: key);
//
//   final String image, text;
//   final Duration duration;
//   final VoidCallback press;
//
//   @override
//   Widget build(BuildContext context) {
//     return BannerM(
//       image: image,
//       press: press,
//       children: [
//         Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               text,
//               textAlign: TextAlign.center,
//               style: const TextStyle(
//                 fontFamily: grandisExtendedFont,
//                 fontSize: 24,
//                 fontWeight: FontWeight.w500,
//                 color: Colors.white,
//               ),
//             ),
//             const SizedBox(height: defaultPadding),
//             GetBuilder <TimerController>(
//               builder:(controller) => Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   BlurContainer(
//                     text: duration.inHours.toString().padLeft(2, "0"),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: defaultPadding / 4),
//                     child: SvgPicture.asset("assets/icons/dot.svg"),
//                   ),
//                   BlurContainer(
//                     text: duration.inMinutes
//                         .remainder(60)
//                         .toString()
//                         .padLeft(2, "0"),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: defaultPadding / 4),
//                     child: SvgPicture.asset("assets/icons/dot.svg"),
//                   ),
//                   BlurContainer(
//                     text: duration.inSeconds
//                         .remainder(60)
//                         .toString()
//                         .padLeft(2, "0"),
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ],
//     );
//   }
// }
//
//
class BannerMWithCounter extends StatefulWidget {
  const BannerMWithCounter({
    Key? key,
    // this.image = "https://i.imgur.com/pRgcbpS.png",
    this.image = "https://wassina.net/ecdata/stores/YFSVMV7478/image/data/9780971B-895C-48CC-B491-1044A8AD6BB9.jpeg",
    required this.text,
    required this.duration,
    required this.press,
  }) : super(key: key);

  final String image, text;
  final Duration duration;
  final VoidCallback press;

  @override
  State<BannerMWithCounter> createState() => _BannerMWithCounterState();
}

class _BannerMWithCounterState extends State<BannerMWithCounter> {
  late Duration _duration;
  late Timer _timer;

  @override
  void initState() {
    _duration = widget.duration;
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        _duration = Duration(seconds: _duration.inSeconds - 1);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: defaultPadding),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultBorderRadious),
          border: Border.all(color: blackColor20 , width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding/2),
          child: Column(
            children: [
              BannerM(
                image: widget.image,
                press: widget.press,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.text,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: grandisExtendedFont,
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: defaultPadding),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BlurContainer(
                            text: _duration.inHours.toString().padLeft(2, "0"),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: defaultPadding / 4),
                            child: SvgPicture.asset("assets/icons/dot.svg"),
                          ),
                          BlurContainer(
                            text: _duration.inMinutes
                                .remainder(60)
                                .toString()
                                .padLeft(2, "0"),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: defaultPadding / 4),
                            child: SvgPicture.asset("assets/icons/dot.svg"),
                          ),
                          BlurContainer(
                            text: _duration.inSeconds
                                .remainder(60)
                                .toString()
                                .padLeft(2, "0"),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              GroupOfProducts(
                products: demoFlashSaleProducts,
              )
            ],
          ),
        ),
      ),
    );
  }
}
