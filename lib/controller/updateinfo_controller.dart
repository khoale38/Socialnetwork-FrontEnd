import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:navsocial/constants/controller.dart';

class UpdateInfoController extends GetxController
    with SingleGetTickerProviderMixin {
  static UpdateInfoController instance = Get.find();

  final ImagePicker _picker = ImagePicker();

  Rx<Image> selectedImage = Image
      .network(authController.auth.currentUser.photoURL)
      .obs;

  void getImage(ImageSource imageSource) async {
    final XFile image = await _picker.pickImage(source: imageSource);
    if (image != null) {
      selectedImage.value = Image.file(File(image.path));
    } else
      Get.snackbar("Error", "No picture picked");
  }
}
