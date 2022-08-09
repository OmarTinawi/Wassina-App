import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../components/label.dart';
import '../../../constants.dart';
import '../controllers/quantity_controller.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails(
      {Key? key,
      required this.brandName,
      required this.title,
      required this.rating,
      required this.reviews,
      required this.price})
      : super(key: key);
  final String brandName, title;
  final double rating;
  final int reviews;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: defaultPadding / 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    brandName.toUpperCase(),
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: 15),
                  ),
                  const SizedBox(height: defaultPadding / 2),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.55,
                    child: Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2!
                          .copyWith(fontSize: 22, height: 1),
                    ),
                  ),
                  SizedBox(
                    height: defaultPadding / 4,
                  ),
                  Text(
                    "\$$price",
                    style: TextStyle(
                        fontSize: 22,
                        color: primaryColor,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              GetBuilder<QuantityController>(
                init: QuantityController(),
                builder: (controller) => Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        controller.decrease();
                      },
                      icon: Icon(Icons.remove_circle_outline_rounded, size: 22),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultPadding / 4),
                      child: Text(
                        "${controller.quantity}",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                              fontSize: 22,
                            ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        controller.increase();
                      },
                      icon: Icon(
                        Icons.add_circle_outline_rounded,
                        size: 22,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: defaultPadding),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Label(
                  color: successColor.withOpacity(0.9),
                  tittle: "Available in stock"),
              Row(
                children: [
                  const Icon(
                    Icons.star_rounded,
                    color: warningColor,
                    size: 24,
                  ),
                  Text(
                    "${rating} ",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  Text(
                    "(${reviews} Reviews)",
                    style: const TextStyle(letterSpacing: 0.1),
                  )
                ],
              )
            ],
          ),
          const SizedBox(height: defaultPadding),
          Row(
            children: [
              Text(
                "Product info",
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(fontSize: 19),
              ),
              SizedBox(width: defaultPadding/4,),
              SvgPicture.asset(
                "assets/icons/info.svg",
                height: 24,
                color: Theme.of(context).iconTheme.color!.withOpacity(
                    Theme.of(context).brightness == Brightness.dark ? 0.3 : 1),
              )
            ],
          ),
          const SizedBox(height: defaultPadding / 4),
          Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris volutpat consequat nibh ac congue. In vitae commodo enim. Pellentesque ultrices."),
          const SizedBox(height: defaultPadding),
          Row(
            children: [
              Text(
                "Delivery time",
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(fontSize: 19),
              ),
              const SizedBox(width: defaultPadding / 4),
              SvgPicture.asset(
                "assets/icons/calendar.svg",
                height: 20,
                color: Theme.of(context).iconTheme.color!.withOpacity(
                    Theme.of(context).brightness == Brightness.dark ? 0.3 : 1),
              )
            ],
          ),
          const SizedBox(height: defaultPadding / 4),
          const Text("Arrives in 2-4 business days")
        ],
      ),
    );
  }
}
