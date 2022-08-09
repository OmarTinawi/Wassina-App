import 'package:get/get.dart';

class BottomNavigationBarController extends GetxController {
  int currentIndex = 0;

  void setIndex(int index){
    currentIndex = index;
    update();
  }

}