import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shop/models/cart_model.dart';

import '../../constants.dart';
import '../../screens/cart/controllers/cart_controller.dart';
import '../network_image_with_loader.dart';

class CartProduct extends StatelessWidget {
  const CartProduct(
      {Key? key,
      required this.image,
      required this.brandName,
      required this.title,
      required this.price,
      this.priceAfetDiscount,
      this.dicountpercent,
      this.press,
      this.style,
      required this.cartIndex})
      : super(key: key);
  final String image, brandName, title;
  final double price;
  final double? priceAfetDiscount;
  final int? dicountpercent;
  final VoidCallback? press;
  final ButtonStyle? style;
  final int cartIndex;

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.find();
    return Stack(
      children: [
        OutlinedButton(
          onPressed: () {},
          style: style ??
              OutlinedButton.styleFrom(
                  minimumSize: Size(MediaQuery.of(context).size.width * 0.90, 100),
                  maximumSize: Size(MediaQuery.of(context).size.width * 0.90, 100),
                  padding: const EdgeInsets.all(8)),
          child: Row(
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
                          child: Text(
                            "$dicountpercent% off",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      )
                  ],
                ),
              ),
              const SizedBox(width: defaultPadding / 4),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(defaultPadding / 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            brandName.toUpperCase(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(fontSize: 10),
                          ),
                        ],
                      ),
                      const SizedBox(height: defaultPadding / 4),
                      Text(
                        title ,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2!
                            .copyWith(fontSize: 12),
                      ),
                      Spacer(),
                      priceAfetDiscount != null
                          ? Row(
                              children: [
                                Text(
                                  "\$" + priceAfetDiscount.toString(),
                                  style: const TextStyle(
                                    color: primaryColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(width: defaultPadding / 4),
                                GetBuilder<CartController>(
                                  builder: (controller) => Text(
                                    "\$ ${price * myCart!.quantity.elementAt(cartIndex)}",
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .color,
                                      fontSize: 10,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : GetBuilder<CartController>(
                              builder: (controller) => Row(
                                children: [
                                  Text(
                                    "\$  ${(price * myCart!.quantity.elementAt(cartIndex)).toStringAsFixed(2)}",
                                    style: const TextStyle(
                                      color: primaryColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                    ),
                                  ),
                                    Spacer(),
                                  IconButton(
                                    padding: EdgeInsets.all(2),
                                    constraints: BoxConstraints(),
                                    splashRadius: 20,
                                    onPressed: () {
                                      cartController.removeQuantity(cartIndex);
                                    },
                                    icon: Center(
                                      child: Icon(
                                        Icons.remove_circle_outline_rounded,
                                        size: 18,
                                      ),
                                    ),
                                  ),
                                    SizedBox(width: defaultPadding,),
                                    GetBuilder<CartController>(
                                      builder: (controller) => Text(
                                        myCart!.quantity.elementAt(cartIndex).toString(),
                                        style: Theme.of(context).textTheme.titleSmall,
                                      ),
                                    ),
                                  SizedBox(width: defaultPadding,),
                                  IconButton(
                                    padding: EdgeInsets.all(2),
                                    splashRadius: 20,
                                    constraints: BoxConstraints(),
                                    onPressed: () {
                                      cartController.addQuantity(cartIndex);
                                    },
                                    icon: Center(
                                      child: Icon(
                                        Icons.add_circle_outline_rounded,
                                        size: 18,
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: defaultPadding/4,
          top: defaultPadding/4,
          child: IconButton(
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
            splashRadius: defaultPadding*1.5,
            onPressed: (){
              cartController.removeProduct(cartIndex);
            },
            icon: Icon(
              Icons.clear,
              color: Colors.black54,
              size: 22,
            ),
          ),
        ),
      ],
    );
  }
}
