import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shop/components/product/cart_product.dart';
import 'package:shop/components/safe_back.dart';
import 'package:shop/models/cart_model.dart';
import 'package:shop/payment/PaypalPayment.dart';
import 'package:shop/screens/cart/controllers/cart_controller.dart';
import 'package:shop/screens/cart/views/empty_cart_screen.dart';

import '../../../constants.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      builder: (controller) => !myCart!.products.isEmpty
          ? Scaffold(
              body: SafeBack(
                child: SafeArea(
                  child: GestureDetector(
                    onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                    child: CustomScrollView(
                      slivers: [
                        SliverPadding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: defaultPadding,
                              vertical: defaultPadding ),
                          sliver: SliverToBoxAdapter(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Review your order",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  height: defaultPadding / 2,
                                ),
                                ...List.generate(
                                    myCart!.products.length,
                                    (index) => Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  vertical: defaultPadding / 4),
                                              child: CartProduct(
                                                  cartIndex: index,
                                                  image: myCart!
                                                      .products[index].image,
                                                  brandName: myCart!
                                                      .products[index].brandName,
                                                  title: myCart!
                                                      .products[index].title,
                                                  price: myCart!
                                                      .products[index].price),
                                            ),
                                          ],
                                        )),
                              ],
                            ),
                          ),
                        ),
                        SliverPadding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: defaultPadding,
                              vertical: defaultPadding / 2),
                          sliver: SliverToBoxAdapter(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Your Coupon code",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  height: defaultPadding / 2,
                                ),
                                TextFormField(
                                  controller: controller.coupon,
                                  validator: nameValidator,
                                  textInputAction: TextInputAction.done,
                                  keyboardType: TextInputType.text,
                                  cursorColor: primaryColor.withOpacity(0.1),
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(width: 1,color:myCart!.discount!>0 ? Colors.green : Colors.transparent),
                                      borderRadius: BorderRadius.circular(defaultBorderRadious)
                                    ),
                                    hintText: "Type coupon code",
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: defaultPadding * 0.75),
                                      child: SvgPicture.asset(
                                        "assets/icons/ticket.svg",
                                        height: 24,
                                        width: 24,
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .color!
                                            .withOpacity(0.3),
                                      ),
                                    ),
                                  ),
                                ),
                                GetX<CartController>(
                                  builder: (cartController) =>
                                      cartController.couponText.value.length > 2
                                          ? Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: defaultPadding),
                                              child: InkWell(
                                                onTap: () {
                                                  FocusManager.instance.primaryFocus?.unfocus();
                                                  if(cartController.couponText.value == "omar5")
                                                  controller.setDiscount(5);
                                                },
                                                child: Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                defaultBorderRadious),
                                                        border: Border.all(
                                                            color: blackColor10)),
                                                    child: Center(
                                                      child: Padding(
                                                        padding: const EdgeInsets
                                                                .symmetric(
                                                            vertical:
                                                                defaultPadding),
                                                        child: Text(
                                                          "Apply coupon code",
                                                          style: Theme.of(context)
                                                              .textTheme
                                                              .titleSmall,
                                                        ),
                                                      ),
                                                    )),
                                              ),
                                            )
                                          : SizedBox(),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SliverPadding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: defaultPadding,
                              vertical: defaultPadding / 2),
                          sliver: SliverToBoxAdapter(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Payment Method",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(fontWeight: FontWeight.w700),
                                ),
                                SizedBox(height: defaultPadding/2),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: primaryColor.withOpacity(1)),
                                        borderRadius: BorderRadius.circular(defaultBorderRadious),
                                      ),
                                      height: MediaQuery.of(context).size.height*0.045,
                                      width: MediaQuery.of(context).size.width*0.25,
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(defaultPadding/2),
                                          child: SvgPicture.asset(
                                            "assets/payment_logo/PayPal.svg",
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: (){
                                        Fluttertoast.showToast(msg: "Soon", backgroundColor: Colors.black87 , textColor: primaryColor);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(color: blackColor10),
                                          borderRadius: BorderRadius.circular(defaultBorderRadious),
                                        ),
                                        height: MediaQuery.of(context).size.height*0.045,
                                        width: MediaQuery.of(context).size.width*0.25,

                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(defaultPadding/2),
                                            child: Image.asset(
                                              "assets/payment_logo/Visa.png",
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),InkWell(
                                      onTap: (){
                                        Fluttertoast.showToast(msg: "Soon", backgroundColor: Colors.black87 , textColor: primaryColor);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(color: blackColor10),
                                          borderRadius: BorderRadius.circular(defaultBorderRadious),
                                        ),
                                        height: MediaQuery.of(context).size.height*0.045,
                                        width: MediaQuery.of(context).size.width*0.25,

                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(defaultPadding/2),
                                            child: Image.asset(
                                              "assets/payment_logo/Mastercard_logo.png",
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SliverPadding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: defaultPadding,
                              vertical: defaultPadding / 2),
                          sliver: SliverToBoxAdapter(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(defaultBorderRadious),
                                  border: Border.all(color: blackColor10)),
                              child: Padding(
                                padding: const EdgeInsets.all(defaultPadding),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Order Summary",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(
                                      height: defaultPadding,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Subtotal"),
                                        Text(
                                          "\$ ${num.parse(myCart!.sum.toStringAsFixed(2)).toDouble() }",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: defaultPadding / 2,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Shipping"),
                                        // Text("\$ ${myCart!.sum}" , style: Theme.of(context).textTheme.titleSmall ,),
                                        Text(
                                          "Free",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(color: successColor),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: defaultPadding / 2,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Discount"),
                                        Text(
                                          "- \$ ${myCart!.discount}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: defaultPadding,
                                    ),
                                    Container(
                                      color: blackColor10,
                                      height: 1,
                                      width: double.infinity,
                                    ),
                                    SizedBox(
                                      height: defaultPadding,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Payment Fee"),
                                        Text(
                                          "\$ ${myCart!.payPalFee}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: defaultPadding / 2,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Total"),
                                        Text(
                                          "\$ ${num.parse((myCart!.sum - myCart!.discount! + myCart!.payPalFee).toStringAsFixed(2)).toDouble()}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SliverPadding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: defaultPadding,
                              vertical: defaultPadding / 2),
                          sliver: SliverToBoxAdapter(
                            child: ElevatedButton(
                              onPressed: () {
                                Get.to(()=>PayPalPayment(
                                    onFinish: (number) async {
                                      print('order id: ' + number);
                                    }
                                ));
                              },
                              child: const Text("Checkout"),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          : EmptyCartScreen(),
    );
  }
}
