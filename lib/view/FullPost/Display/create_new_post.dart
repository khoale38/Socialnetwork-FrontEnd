import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:navsocial/constants/controller.dart';

class CreateNewPostPage extends StatelessWidget {
  const CreateNewPostPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Colors.black,
              ),
              onPressed: () {
                Get.back();
              },
            ),
            backgroundColor: Colors.white),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
          child: Column(
            children: [
              TextField(
                  controller: createNewPostController.textController,
                  maxLength: 150,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                      hintText: "Write out something ...",
                      hintStyle: TextStyle(fontSize: 18),
                      border: OutlineInputBorder())),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.black87),
                      onPressed: () async {
                        createNewPostController.getImage(ImageSource.camera);
                      },
                      child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Icon(
                            Icons.camera,
                            color: Colors.white,
                          ))),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.black87),
                      onPressed: () async {
                        createNewPostController.getImage(ImageSource.gallery);
                      },
                      child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Icon(
                            Icons.add_photo_alternate_outlined,
                            color: Colors.white,
                          ))),
                ],
              ),
              Obx(
                ()=> createNewPostController.isLoadedImage.value==true ? Container(margin: EdgeInsets.symmetric(vertical: 15),
                  width: screenSize.width,
                  height: screenSize.height*0.55,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: createNewPostController.selectedImage.value.image,
                    fit: BoxFit.cover,
                  )),
                )
                    :Container(),

              ),
              Container(
                  width: double.infinity,
                  margin: EdgeInsets.all(10),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.black87),
                      onPressed: () async {
                        //this have to be multi options for diffences widget
                        Get.back();
                      },
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          "Post",
                          style: TextStyle(fontSize: 24),
                        ),
                      )))

            ],
          ),
        ),
      ),
    );
  }
}
