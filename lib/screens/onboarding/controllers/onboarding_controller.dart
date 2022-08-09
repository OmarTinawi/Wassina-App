import 'package:get/get.dart';
import 'package:flutter/material.dart';

class OnBoardingController extends GetxController{
  late PageController pageController;
  int index = 0;

  void changeIndex(int newIndex){
    index = newIndex;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    pageController = PageController(initialPage: 0);
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    pageController.dispose();
    super.onClose();
  }

  void nextPage(){
    pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease);
  }
}