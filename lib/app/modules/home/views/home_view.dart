import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:view_user/app/modules/user_list/views/user_list_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  var index = 0.obs;
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            width: size.width,
            height: size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  "https://img.freepik.com/free-photo/abstract-background-made-with-numbers_1160-206.jpg?t=st=1744368562~exp=1744372162~hmac=50131bdc08f65c3bb5548140506b14f888bb651d997fb2ba6f78fee120404813&w=1800",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Overlay
          Container(
            width: size.width,
            height: size.height,
            color: Colors.black.withOpacity(0.4),
          ),
          // Main Content
          SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Select Language",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 50),
                  Obx(() => _buildLanguageOption(
                        context,
                        isSelected: index.value == 0,
                        title: 'नेपाली',
                        imageUrl:
                            "https://static-00.iconduck.com/assets.00/nepal-icon-461x512-no7dj88n.png",
                        onTap: () {
                          index.value = 0;
                          Get.updateLocale(const Locale('ne', 'NP'));
                        },
                      )),
                  const SizedBox(height: 30),
                  Obx(() => _buildLanguageOption(
                        context,
                        isSelected: index.value == 1,
                        title: 'English',
                        imageUrl:
                            "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Flag_of_the_United_States_%28DoS_ECA_Color_Standard%29.svg/1920px-Flag_of_the_United_States_%28DoS_ECA_Color_Standard%29.svg.png",
                        onTap: () {
                          index.value = 1;
                          Get.updateLocale(const Locale('en', 'US'));
                        },
                      )),
                  const SizedBox(height: 60),
                  GestureDetector(
                    onTap: () => Get.to(UserListView()),
                    child: Container(
                      width: size.width * 0.6,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          )
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          "Continue",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageOption(
    BuildContext context, {
    required bool isSelected,
    required String title,
    required String imageUrl,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        width: MediaQuery.of(context).size.width * 0.7,
        decoration: BoxDecoration(
          color:
              isSelected ? Colors.blueAccent : Colors.white.withOpacity(0.85),
          borderRadius: BorderRadius.circular(10),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.blueAccent.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  )
                ]
              : [],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black87,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            Image.network(
              imageUrl,
              width: 26,
              height: 26,
            ),
          ],
        ),
      ),
    );
  }
}
