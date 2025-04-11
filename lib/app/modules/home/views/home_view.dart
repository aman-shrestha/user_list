import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:view_user/app/modules/user_list/views/user_list_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Language Selection'),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.updateLocale(const Locale('ne', 'NP'));
                Get.to(UserListView());
              },
              child: Text('नेपाली'),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Get.updateLocale(const Locale('en', 'US'));
                Get.to(UserListView());
              },
              child: Text('English'),
            ),
          ],
        ),
      ),
    );
  }
}
