import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UpdateInfoController extends GetxController
    with SingleGetTickerProviderMixin {
  static UpdateInfoController instance = Get.find();

  final ImagePicker _picker = ImagePicker();

  void getImage() async {
    final XFile image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
    } else
      Get.snackbar("Error", "No picture picked");
  }
}
