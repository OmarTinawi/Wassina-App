import 'dart:convert';

import 'package:shop/models/product_model.dart';

import '../constants.dart';

class CartModel {
  List<ProductModel> products;
  List<int> quantity;
  double sum;
  double? discount;


  CartModel({
    required this.products,
    required this.quantity,
    required this.sum,
    this.discount
  });

  int get length => products.length;
  double get payPalFee => num.parse((myCart!.sum * 0.045).toStringAsFixed(2)).toDouble();

  Map<String, dynamic> toJson() => {
    'products': List.generate(products.length, (index) => products.elementAt(index).toJson()),
    'quantity': quantity,
    'sum' : sum,
    'discount': discount??0,
  };

  CartModel.fromJson(Map<String, dynamic> jsonMap)
      :

        products = List.generate(jsonMap['products'].length , (index) =>ProductModel.fromJson(jsonMap['products'][index]) ),
        quantity = List.generate(jsonMap['quantity'].length, (index) => jsonMap['quantity'][index].toInt())  ,
        sum = jsonMap['sum'],
        discount = jsonMap['discount'];

  void emptyCart(){
    myCart = CartModel(
      products: [
      ],
      quantity: [
      ],
      sum: 0,
      discount: 0,
    );
  }

}

CartModel? myCart = CartModel(
  products: [
  ],
  quantity: [
  ],
  sum: 0,
  discount: 0,
);
