// For demo only
import 'package:shop/constants.dart';

class ProductModel {
  final String image, brandName, title;
  final double price;
  final int? discountPercent;
  final double rating;
  final int reviews;
  final List<int> reviews2;

  ProductModel({
    required this.image,
    required this.brandName,
    required this.title,
    required this.price,
    this.discountPercent,
    required this.rating,
    required this.reviews,
    required this.reviews2,
  });

  Map<String, dynamic> toJson() => {
        'image': image,
        'brandName': brandName,
        'title': title,
        'price': price,
        'discountPercent': discountPercent,
        'rating': rating,
        'reviews': reviews,
        'reviews2': reviews2,
      };

  ProductModel.fromJson(Map<String, dynamic> json)
      : image = json['image'],
        brandName = json['brandName'],
        title = json['title'],
        price = json['price'],
        discountPercent = json['discountPercent'],
        rating = json['rating'],
        reviews = json['reviews'],
        reviews2 = List.generate(json['reviews2'].length,
            (index) => json['reviews2'][index].toInt());
}

List<ProductModel> demoPopularProducts = [
  ProductModel(
      image: productDemoImg1,
      title: "Eid sweet package",
      brandName: "Muhanna",
      price: 57.78,
      rating: 4.2,
      reviews: 126,
      reviews2: [90, 16, 15, 5, 30]),
  ProductModel(
      image: productDemoImg2,
      title: "Mountain Beta Warehouse",
      brandName: "Lipsy london",
      price: 42,
      rating: 3.1,
      reviews: 126,
      reviews2: [90, 16, 15, 5, 0]),
  ProductModel(
      image: productDemoImg3,
      title: "FS - Nike Air Max 270 Really React",
      brandName: "Lipsy london",
      price: 43.04,
      rating: 2.6,
      reviews: 126,
      reviews2: [90, 16, 15, 5, 0]),
  ProductModel(
      image: productDemoImg4,
      title: "Green Poplin Ruched Front",
      brandName: "Lipsy london",
      price: 31.5,
      rating: 1,
      reviews: 126,
      reviews2: [90, 16, 15, 5, 0]),
  ProductModel(
      image: productDemoImg5,
      title: "white satin corset top",
      brandName: "Lipsy london",
      price: 99,
      rating: 0,
      reviews: 0,
      reviews2: [90, 16, 15, 5, 0]),
];

List<ProductModel> demoPopularProducts2 = [
  ProductModel(
      image: productDemoImg11,
      title: "GLISS Hair Repair",
      brandName: "Schwarzkopf",
      price: 11.5,
      rating: 4.8,
      reviews: 126,
      reviews2: [90, 16, 15, 5, 30]),
  ProductModel(
      image: productDemoImg12,
      title: "Mountain Beta Warehouse",
      brandName: "Lipsy london",
      price: 42,
      rating: 3.1,
      reviews: 126,
      reviews2: [90, 16, 15, 5, 0]),
  ProductModel(
      image: productDemoImg3,
      title: "FS - Nike Air Max 270 Really React",
      brandName: "Lipsy london",
      price: 43.04,
      rating: 2.6,
      reviews: 126,
      reviews2: [90, 16, 15, 5, 0]),
  ProductModel(
      image: productDemoImg4,
      title: "Green Poplin Ruched Front",
      brandName: "Lipsy london",
      price: 31.5,
      rating: 1,
      reviews: 126,
      reviews2: [90, 16, 15, 5, 0]),
  ProductModel(
      image: productDemoImg5,
      title: "white satin corset top",
      brandName: "Lipsy london",
      price: 99,
      rating: 0,
      reviews: 0,
      reviews2: [90, 16, 15, 5, 0]),
];

List<ProductModel> demoSaleProducts = [
  ProductModel(
      image: productDemoImg1,
      title: "Mountain Warehouse for Women",
      brandName: "Lipsy london",
      price: 540,
      discountPercent: 20,
      rating: 4.4,
      reviews: 126,
      reviews2: [90, 16, 15, 5, 0]),
  ProductModel(
      image: productDemoImg2,
      title: "Mountain Beta Warehouse",
      brandName: "Lipsy london",
      price: 800,
      rating: 4.4,
      reviews: 126,
      reviews2: [90, 16, 15, 5, 0]),
  ProductModel(
      image: productDemoImg3,
      title: "FS - Nike Air Max 270 Really React",
      brandName: "Lipsy london",
      price: 650.62,
      discountPercent: 40,
      rating: 4.4,
      reviews: 126,
      reviews2: [90, 16, 15, 5, 0]),
  ProductModel(
      image: productDemoImg4,
      title: "Green Poplin Ruched Front",
      brandName: "Lipsy london",
      price: 1264,
      discountPercent: 5,
      rating: 4.4,
      reviews: 126,
      reviews2: [90, 16, 15, 5, 0]),
  ProductModel(
      image: productDemoImg5,
      title: "white satin corset top",
      brandName: "Lipsy london",
      price: 1264,
      discountPercent: 5,
      rating: 4.4,
      reviews: 126,
      reviews2: [90, 16, 15, 5, 0]),
];

List<ProductModel> demoFlashSaleProducts = [
  ProductModel(
      image: productDemoImg6,
      title: "white satin corset top",
      brandName: "Lipsy london",
      price: 29.5,
      discountPercent: 10,
      rating: 4.4,
      reviews: 126,
      reviews2: [90, 16, 15, 5, 0]),
  ProductModel(
      image: productDemoImg7,
      title: "FS - Nike Air Max 270 Really React",
      brandName: "Lipsy london",
      price: 36.1,
      discountPercent: 20,
      rating: 4.4,
      reviews: 126,
      reviews2: [90, 16, 15, 5, 0]),
  ProductModel(
      image: productDemoImg8,
      title: "Green Poplin Ruched Front",
      brandName: "Lipsy london",
      price: 94.5,
      discountPercent: 5,
      rating: 4.4,
      reviews: 126,
      reviews2: [90, 16, 15, 5, 0]),
  ProductModel(
      image: productDemoImg9,
      title: "Mountain Beta Warehouse",
      brandName: "Lipsy london",
      price: 81.5,
      discountPercent: 25,
      rating: 4.4,
      reviews: 126,
      reviews2: [90, 16, 15, 5, 0]),
];
