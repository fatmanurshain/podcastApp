import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  final String podces_image = 'assets/images/podces_image.png';
  late PageController pageController;
  var currentPageIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  void onPageChanged(int index) {
    currentPageIndex.value = index;
  }

  void nextPage() {
    if (currentPageIndex.value < 2) {
      pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    } else {
      Get.offNamed('/home');
    }
  }
}
