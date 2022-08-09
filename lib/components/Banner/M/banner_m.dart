import 'package:flutter/material.dart';
import 'package:shop/constants.dart';

import '../../network_image_with_loader.dart';

class BannerM extends StatelessWidget {
  const BannerM(
      {Key? key,
      required this.image,
      required this.press,
        this.onlyImage = false,
        this.children})
      : super(key: key);

  final String image;
  final VoidCallback press;
  final List<Widget>? children;
  final bool onlyImage ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding/4),
      child: AspectRatio(
        aspectRatio: 1.87,
        child: GestureDetector(
          onTap: press,
          child: Stack(
            children: [
              NetworkImageWithLoader(image, radius: defaultBorderRadious),
              Container(decoration: BoxDecoration(
                  color:onlyImage?Colors.transparent : Colors.black38,
                  borderRadius: BorderRadius.circular(defaultBorderRadious)
              ), ),
              ...children??[SizedBox()],
            ],
          ),
        ),
      ),
    );
  }
}
