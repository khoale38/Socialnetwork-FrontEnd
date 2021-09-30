import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:navsocial/constants/controller.dart';

class UpdateInfoController extends GetxController
    with SingleGetTickerProviderMixin {
  static UpdateInfoController instance = Get.find();

  final ImagePicker _picker = ImagePicker();

  Rx<Image> selectedImage = Image.network(
          'https://static.remove.bg/remove-bg-web/3661dd45c31a4ff23941855a7e4cedbbf6973643/assets/start-0e837dcc57769db2306d8d659f53555feb500b3c5d456879b9c843d1872e7baa.jpg')
      .obs;

  void getImage(ImageSource imageSource) async {
    final XFile image = await _picker.pickImage(source: imageSource);
    if (image != null) {
      selectedImage.value = Image.file(File(image.path));
    } else
      Get.snackbar("Error", "No picture picked");
  }
}
