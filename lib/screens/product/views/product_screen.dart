import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shop/models/cart_model.dart';
import 'package:shop/models/product_model.dart';
import 'package:shop/screens/cart/controllers/cart_controller.dart';
import 'package:shop/screens/entry_point/controllers/bottom_navigation_bar_controller.dart';
import 'package:shop/screens/product/components/product_details.dart';
import '../../../components/product/products_group.dart';
import '../../../constants.dart';
import '../components/product_image.dart';
import '../components/reviews_stars.dart';
import '../controllers/quantity_controller.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key, required this.productModel}) : super(key: key);
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.find();
    BottomNavigationBarController barController = Get.find();
    QuantityController quantityController = Get.put(QuantityController());
    return Scaffold(
      appBar: AppBar(
        // leadingWidth: 12,
        centerTitle: true,
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
          GetBuilder <CartController>(
            builder: (GetxController controller) => IconButton(
              onPressed: () {
                barController.setIndex(3);
                Get.toNamed('/entry_point');
              },
              icon: Stack(alignment: AlignmentDirectional.center, children: [
                Text(" ${myCart!.length}",
                style: TextStyle(
                  fontSize: 8,
                  color: blackColor80,
                  fontWeight: FontWeight.w800
                ),),
                SvgPicture.asset(
                  "assets/icons/Bag.svg",
                  height: 24,
                  color: Theme.of(context).iconTheme.color!.withOpacity(
                      Theme.of(context).brightness == Brightness.dark ? 0.3 : 1),
                ),
              ]),
            ),
          )
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding, vertical: defaultPadding / 2),
            sliver: SliverToBoxAdapter(
                child: ProductImage(
              image: productModel.image,
            )),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding, vertical: defaultPadding / 2),
            sliver: SliverToBoxAdapter(
                child: ProductDetails(
              brandName: productModel.brandName,
              title: productModel.title,
              rating: productModel.rating,
              reviews: productModel.reviews,
              price: productModel.price, // info + time ( to do )
            )),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding, vertical: defaultPadding / 1.5),
              child: Row(
                children: [
                  Text(
                    "Reviews",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(fontSize: 19, height: 1),
                  ),
                  SizedBox(
                    width: defaultPadding / 4,
                  ),
                  SvgPicture.asset(
                    "assets/icons/Chat.svg",
                    height: 22,
                    color: Theme.of(context).iconTheme.color!.withOpacity(
                        Theme.of(context).brightness == Brightness.dark
                            ? 0.3
                            : 1),
                  ),
                  // Spacer(),
                  // IconButton(
                  //   onPressed: (){},
                  //   icon: Icon(Icons.keyboard_arrow_down , size: 30,),
                  // )
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(
              horizontal: defaultPadding,
            ),
            sliver: SliverToBoxAdapter(
                child: ReviewsStars(
              rating: productModel.rating,
              reviews: productModel.reviews,
              reviews2: productModel.reviews2,
            )),
          ),
          SliverToBoxAdapter(
            child: GroupOfProducts(
              tittle: "You may also like",
              products: demoPopularProducts,
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: InkWell(
          onTap: () {
            if (!cartController.contain(productModel)) {
              cartController.addProduct(
                  productModel, quantityController.quantity);
            }

            // Get.back();
            // Get.snackbar("Done!", "Successfully added to cart",backgroundColor: primaryColor ,colorText: Colors.black , padding: EdgeInsets.symmetric(vertical: defaultPadding , horizontal: defaultPadding/2),margin: EdgeInsets.symmetric(vertical: defaultPadding/2 , horizontal:  defaultPadding));
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding, vertical: defaultPadding / 2),
            child: GetBuilder<CartController>(
              builder: (controller) =>
                  Stack(alignment: Alignment.bottomCenter, children: [
                Positioned(
                  left: 0,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.075,
                    width: MediaQuery.of(context).size.width * 0.55,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          // topRight: Radius.circular(defaultBorderRadious),
                          // bottomRight: Radius.circular(defaultBorderRadious),
                          topLeft: Radius.circular(defaultBorderRadious),
                          bottomLeft: Radius.circular(defaultBorderRadious),
                        ),
                        color: primaryColor.withOpacity(0.9)),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: defaultPadding),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GetBuilder<QuantityController>(
                                  builder: (controller) => Text(
                                    "\$" +
                                        (productModel.price *
                                                controller.quantity)
                                            .toStringAsFixed(2),
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                Text("Total",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w800,
                                    ))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 400),
                    height: MediaQuery.of(context).size.height * 0.075,
                    width: !controller.contain(productModel)
                        ? MediaQuery.of(context).size.width * 0.4
                        : MediaQuery.of(context).size.width * 0.91,
                    decoration: BoxDecoration(
                      color: Color(0xFFFAB611),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(defaultBorderRadious),
                        bottomRight: Radius.circular(defaultBorderRadious),
                        topLeft: Radius.circular(
                            !controller.contain(productModel)
                                ? 0
                                : defaultBorderRadious),
                        bottomLeft: Radius.circular(
                            !controller.contain(productModel)
                                ? 0
                                : defaultBorderRadious),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        !controller.contain(productModel)
                            ? "Add to cart"
                            : "Added to cart!",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 18, fontWeight: FontWeight.w800),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.075,
                  ),
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
