import 'package:flutter/material.dart';

import '../../../components/network_image_with_loader.dart';
import '../../../constants.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({Key? key,required this.image}) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return AspectRatio( // image of product
      aspectRatio: 1,
      child: Stack(
        children: [
          Hero(
            tag: "product${image}",
            child: NetworkImageWithLoader(image,
                radius: defaultBorderRadious),
          ),
        ],
      ),
    );
  }
}
