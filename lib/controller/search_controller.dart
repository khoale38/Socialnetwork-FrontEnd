import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SearchController extends GetxController with SingleGetTickerProviderMixin{

  static SearchController instance = Get.find();
  final textController = TextEditingController();

  final scrollController = ScrollController();


}