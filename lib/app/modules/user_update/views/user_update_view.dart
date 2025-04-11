import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:view_user/app/modules/reusable_widgets/text_form_field_reusable.dart';

import '../controllers/user_update_controller.dart';

class UserUpdateView extends GetView<UserUpdateController> {
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  UserUpdateView({super.key});
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return KeyboardDismisser(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('updateUser'.tr),
          centerTitle: false,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("firstName".tr),
                  SizedBox(height: 10),
                  TextFormFieldReusable(
                    hint: "enterFirstName".tr,
                    textEditingController: firstName,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'errorFirstName'.tr;
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  Text("lastName".tr),
                  SizedBox(height: 10),
                  TextFormFieldReusable(
                    hint: "enterLastName".tr,
                    textEditingController: lastName,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'errorLastName'.tr;
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  Text("email".tr),
                  SizedBox(height: 10),
                  TextFormFieldReusable(
                    hint: "enterEmail".tr,
                    textEditingController: email,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'errorEmail'.tr;
                      }
                      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(value)) {
                        return 'validEmail'.tr;
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  Text("uploadImage".tr),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    ),
                    child: Center(
                        child: Icon(
                      Icons.upload_file_outlined,
                      size: 100,
                    )),
                  ),
                  // ImageUploadContainer(),
                  SizedBox(height: 40),
                  GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        Get.snackbar(
                          'successful'.tr,
                          'successfullyUpdated'.tr,
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.green,
                          colorText: Colors.white,
                        );
                        firstName.clear();
                        lastName.clear();
                        email.clear();
                      } else {
                        Get.snackbar(
                          'error'.tr,
                          'errorDetail'.tr,
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                        );
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.green,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Center(
                          child: Text(
                            "submit".tr,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// class ImageUploadContainer extends StatefulWidget {
//   @override
//   _ImageUploadContainerState createState() => _ImageUploadContainerState();
// }

// class _ImageUploadContainerState extends State<ImageUploadContainer> {
//   XFile? _image;

//   // Function to pick an image from the gallery
//   Future<void> _pickImage() async {
//     final ImagePicker _picker = ImagePicker();
//     final XFile? pickedImage =
//         await _picker.pickImage(source: ImageSource.gallery);
//     if (pickedImage != null) {
//       setState(() {
//         _image = pickedImage;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: _pickImage,
//       child: Container(
//         width: double.infinity,
//         height: 200,
//         decoration: BoxDecoration(
//           color: Colors.grey[200],
//           borderRadius: BorderRadius.circular(12),
//           border: Border.all(color: Colors.grey),
//         ),
//         child: _image == null
//             ? Center(
//                 child: Icon(
//                   Icons.cloud_upload,
//                   color: Colors.blue,
//                   size: 40,
//                 ),
//               )
//             : ClipRRect(
//                 borderRadius: BorderRadius.circular(12),
//                 child: Image.file(
//                   File(_image!.path),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//       ),
//     );
//   }
// }
