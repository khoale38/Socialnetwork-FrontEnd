import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CreateNewPostController extends GetxController with SingleGetTickerProviderMixin
{
static CreateNewPostController instance = Get.find();

final textController = TextEditingController();

final ImagePicker _picker = ImagePicker();
Rx<bool> isLoadedImage = false.obs;

Rx<Image> selectedImage =Image.asset("assets/logo/1.png").obs;

void getImage(ImageSource imageSource) async {
  final XFile image = await _picker.pickImage(source: imageSource);
  if (image != null) {
    isLoadedImage.value= true;
    selectedImage.value= Image.file(File(image.path));
  } else
    Get.snackbar("Error", "No picture picked");
}

}