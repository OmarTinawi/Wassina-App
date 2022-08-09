import 'package:get/get.dart';

class QuantityController extends GetxController{
  int quantity = 1;

  void increase(){
    quantity++;
    update();
  }

  void decrease(){
    if(quantity>1){
      quantity--;
      update();
    }
  }
}