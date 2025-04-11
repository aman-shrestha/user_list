import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:view_user/app/data/api_url.dart';
import 'package:view_user/app/modules/user_list/model/user_list_model.dart';
import '../../../data/api_client.dart';

class UserListController extends GetxController {
  //TODO: Implement UserListController

  final count = 0.obs;
  var isNoticeLoading = true.obs;
  var noticeList = UserListModel().obs;
  @override
  void onInit() {
    getUser();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void getUser() async {
    try {
      var response = await ApiClient().getRequest(ApiUrls.BASE_URL);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        noticeList.value = UserListModel.fromJson(data);
      } else {
        // Optional: Show an error snackbar or log
        print("Failed to fetch users. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching user data: $e");
    } finally {
      isNoticeLoading.value = false;
    }
  }
}
