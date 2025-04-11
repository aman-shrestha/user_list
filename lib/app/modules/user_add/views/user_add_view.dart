import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import '../../reusable_widgets/text_form_field_reusable.dart';
import '../../user_update/views/user_update_view.dart';
import '../controllers/user_add_controller.dart';

class UserAddView extends GetView<UserAddController> {
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  UserAddView({super.key});
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return KeyboardDismisser(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('Add User'),
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
                          'SUCCESSFULLY ADDED THE USER.',
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
