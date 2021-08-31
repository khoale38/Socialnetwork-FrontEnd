import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FullPostController extends GetxController
    with SingleGetTickerProviderMixin {

  static FullPostController instance = Get.find();

  final controller = ScrollController();

  void scrollUp() {
    final double start = 0;
    controller.animateTo(start,
        duration: Duration(milliseconds: 800), curve: Curves.easeIn);
  }
}
