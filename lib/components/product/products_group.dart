import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/components/product/product_card.dart';
import 'package:shop/models/product_model.dart';
import 'package:shop/screens/product/views/product_screen.dart';

import '../../constants.dart';

class GroupOfProducts extends StatelessWidget {
  const GroupOfProducts({
    Key? key,this.tittle,required this.products,
  }) : super(key: key);
  final String? tittle;
  final List<ProductModel> products;


  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: tittle!=null ? defaultPadding : 0),
        tittle != null ? Padding(
          padding: const EdgeInsets.only(left: defaultPadding/2),
          child: Text(
            tittle!,
            style: Theme.of(context)
        .textTheme
        .subtitle2!
        .copyWith(fontSize: 19)
            ),
          ):SizedBox(),
        SizedBox(height: tittle!=null ? defaultPadding : defaultPadding/2),
        SizedBox(
          height: 232,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(
                left: defaultPadding/2,
                right: index == products.length - 1
                    ? defaultPadding /4
                    : 0,
              ),
              child: ProductCard(
                image: products[index].image,
                brandName: products[index].brandName,
                title: products[index].title,
                price: products[index].price,
                dicountpercent: products[index].discountPercent,
                press: () {
                  Get.to(()=>ProductScreen(productModel: products[index]) , transition: Transition.fadeIn ,duration: const Duration(milliseconds: 500) , preventDuplicates: false);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
