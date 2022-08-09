import 'package:get/get.dart';

class SearchController extends GetxController {
  bool foucs = false;

  void setFoucs(bool f){
    foucs = f;
    update();
  }

}