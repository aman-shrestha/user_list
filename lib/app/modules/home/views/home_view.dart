import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:view_user/app/modules/user_list/views/user_list_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  var index = 0.obs;
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Make scaffold background transparent
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Transparent to see the gradient
        elevation: 0,
        title: const Text('Language Selection'),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity, // ensure full height
        decoration: const BoxDecoration(
            // gradient: LinearGradient(
            //   colors: [
            //     Color(0xFFADD8E6),
            //     Color(0x000000ff),
            //   ], // You can choose any colors
            //   begin: Alignment.topCenter,
            //   end: Alignment.bottomCenter,
            // ),
            ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text(
            //   "Language Selection",
            //   style: TextStyle(
            //       fontSize: 30,
            //       color: Colors.black,
            //       fontWeight: FontWeight.bold),
            // ),
            // SizedBox(height: 40),
            Obx(
              () => GestureDetector(
                onTap: () {
                  index.value = 0;
                  Get.updateLocale(const Locale('ne', 'NP'));
                },
                child: Container(
                  padding: EdgeInsets.all(18),
                  width: MediaQuery.of(context).size.width * 0.7,
                  decoration: BoxDecoration(
                    color: index.value == 0
                        ? Colors.blueAccent
                        : Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('नेपाली'),
                        Image.network(
                          width: 20,
                          "https://static-00.iconduck.com/assets.00/nepal-icon-461x512-no7dj88n.png",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
            Obx(
              () => GestureDetector(
                onTap: () {
                  index.value = 1;
                  Get.updateLocale(const Locale('en', 'US'));
                },
                child: Container(
                  padding: EdgeInsets.all(18),
                  width: MediaQuery.of(context).size.width * 0.7,
                  decoration: BoxDecoration(
                    color: index.value == 1
                        ? Colors.blueAccent
                        : Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('English'),
                        Image.network(
                          width: 20,
                          "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Flag_of_the_United_States_%28DoS_ECA_Color_Standard%29.svg/1920px-Flag_of_the_United_States_%28DoS_ECA_Color_Standard%29.svg.png",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
            GestureDetector(
              onTap: () {
                Get.to(UserListView());
              },
              child: Container(
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width * 0.7,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey.withOpacity(0.1)),
                child: Center(
                  child: Text(
                    "Go To App",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
