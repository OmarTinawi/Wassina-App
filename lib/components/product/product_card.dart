import 'package:flutter/material.dart';

import '../../constants.dart';
import '../network_image_with_loader.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.image,
    required this.brandName,
    required this.title,
    required this.price,
    this.dicountpercent,
    required this.press,
  }) : super(key: key);
  final String image, brandName, title;
  final double price;
  final int? dicountpercent;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    double? priceAfterDiscount;
    if(dicountpercent!= null){
      priceAfterDiscount = price - (dicountpercent! * price / 100) ;
    }
    return OutlinedButton(
      onPressed: press,
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.white,
          // fixedSize: const Size(140, 220),
          minimumSize: const Size(150, 230),
          maximumSize: const Size(150, 230),
          padding: const EdgeInsets.all(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Stack(
              children: [
                NetworkImageWithLoader(image, radius: defaultBorderRadious),
                if (dicountpercent != null)
                  Positioned(
                    right: defaultPadding / 2,
                    top: defaultPadding / 2,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultPadding / 2),
                      height: 16,
                      decoration: const BoxDecoration(
                        color: errorColor,
                        borderRadius: BorderRadius.all(
                            Radius.circular(defaultBorderRadious)),
                      ),
                      child: SingleChildScrollView(
                        // scrollDirection: Axis.horizontal,
                        child: Text(
                          "$dicountpercent% off",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding / 2, vertical: defaultPadding / 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    brandName.toUpperCase(),
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: 10),
                  ),
                  const SizedBox(height: defaultPadding / 4),
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(fontSize: 12),
                  ),
                  const Spacer(flex: 2,),
                  dicountpercent!= null
                      ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "\$" + priceAfterDiscount!.toStringAsFixed(2),
                              style: const TextStyle(
                                color: Color(0xFFFFBE21),
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              "\$" + price.toStringAsFixed(2),
                              style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .color,
                                fontSize: 10,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          ],
                        )
                      : Text(
                          "\$" + price.toStringAsFixed(2),
                          style: const TextStyle(
                            color: Color(0xFFFFBE21),
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                  Spacer(flex: 1,)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
