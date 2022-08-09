import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shop/main.dart';
import 'package:shop/models/cart_model.dart';
import 'package:shop/models/product_model.dart';

class CartController extends GetxController {
  final coupon = TextEditingController() ;
  RxString couponText = ''.obs;

  void addProduct(ProductModel productModel , int quantity) {
    if (myCart!.products.contains(productModel)) {
      int index = myCart!.products.indexOf(productModel);
      myCart!.quantity[index]+= quantity;
    }
    else {
      myCart!.products.add(productModel);
      myCart!.quantity.add(quantity);
    }
    double tmp = productModel.price * quantity;
    myCart!.sum = myCart!.sum + tmp;
    update();
    sharedPreferences!.setString("cart", json.encode(myCart!));
  }

  void removeProduct(int index) {
    myCart!.sum -= myCart!.products.elementAt(index).price * myCart!.quantity.elementAt(index);
    myCart!.products.removeAt(index);
    myCart!.quantity.removeAt(index);
    update();
    sharedPreferences!.setString("cart", json.encode(myCart!));
  }

  void addQuantity(int index) {
    myCart!.quantity[index]++;
    myCart!.sum= myCart!.sum + myCart!.products[index].price;
    myCart!.sum = num.parse(myCart!.sum.toStringAsFixed(2)).toDouble()  ;
    update();
    sharedPreferences!.setString("cart", json.encode(myCart!));
  }

  void removeQuantity(int index) {
    if (myCart!.quantity[index] > 1) {
      myCart!.quantity[index]--;
      myCart!.sum-= myCart!.products[index].price;
      myCart!.sum = num.parse(myCart!.sum.toStringAsFixed(2)).toDouble()  ;
      update();
      sharedPreferences!.setString("cart", json.encode(myCart!));
    }
  }

  bool contain(ProductModel productModel){
    return myCart!.products.contains(productModel);
  }

  void setDiscount(double value){
    myCart!.discount = value;
    update();
  }

  @override
  void onInit() {
    myCart = CartModel(
      products: [
      ],
      quantity: [
      ],
      sum: 0,
      discount: 0,
    );
    if (sharedPreferences!.getString("cart") != null) {
      myCart = CartModel.fromJson(jsonDecode(sharedPreferences!.getString("cart")!));
    }
    coupon.addListener(() {
      couponText.value = coupon.text;
    });

    // debounce(couponText, (_) {
    //   print("debouce$_");
    // }, time: Duration(seconds: 1));

    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    sharedPreferences!.setString("cart", json.encode(myCart!));
    // TODO: implement onClose
    super.onClose();
  }
}
