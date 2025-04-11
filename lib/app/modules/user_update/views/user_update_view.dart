import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
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
          title: const Text('Update User'),
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
                  Text("First Name: "),
                  SizedBox(height: 10),
                  TextFormFieldReusable(
                    hint: "Enter First Name",
                    textEditingController: firstName,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'First name is required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  Text("Last Name: "),
                  SizedBox(height: 10),
                  TextFormFieldReusable(
                    hint: "Enter Last Name",
                    textEditingController: lastName,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Last name is required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  Text("Email Address: "),
                  SizedBox(height: 10),
                  TextFormFieldReusable(
                    hint: "Enter Email Address",
                    textEditingController: email,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Email is required';
                      }
                      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(value)) {
                        return 'Enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  Text("Upload Image:"),
                  SizedBox(height: 10),
                  ImageUploadContainer(),
                  SizedBox(height: 40),
                  GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        Get.snackbar(
                          'Successful',
                          'SUCCESSFULLY UPDATED THE USER.',
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.green,
                          colorText: Colors.white,
                        );
                        firstName.clear();
                        lastName.clear();
                        email.clear();
                      } else {
                        Get.snackbar(
                          'Error',
                          'Please fill all required fields correctly.',
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
                            "SUBMIT",
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

class ImageUploadContainer extends StatefulWidget {
  @override
  _ImageUploadContainerState createState() => _ImageUploadContainerState();
}

class _ImageUploadContainerState extends State<ImageUploadContainer> {
  XFile? _image;

  // Function to pick an image from the gallery
  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = pickedImage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
      child: Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey),
        ),
        child: _image == null
            ? Center(
                child: Icon(
                  Icons.cloud_upload,
                  color: Colors.blue,
                  size: 40,
                ),
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.file(
                  File(_image!.path),
                  fit: BoxFit.cover,
                ),
              ),
      ),
    );
  }
}
