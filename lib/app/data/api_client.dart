import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  //get method
  Future<http.Response> getRequest(String url) async {
    try {
      var response = await http.get(
        Uri.parse(url),
      );
      print("Response::::::::${response.body}");
      if (response.statusCode == 403) {
        // refreshToken();
        // Get.offAll(() => LoginView());
        Get.rawSnackbar(
          message: 'Token Expired Please Login Again',
          backgroundColor: Colors.grey,
          duration: Duration(seconds: 1),
          snackPosition: SnackPosition.BOTTOM,
        );
      } else if (response.statusCode != 200) {
        Get.rawSnackbar(
            message: "Error",
            backgroundColor: Colors.grey,
            duration: Duration(seconds: 2),
            animationDuration: Duration(milliseconds: 100),
            snackPosition: SnackPosition.BOTTOM);
      }
      return response;
    } catch (error, stackTrace) {
      print('An error occurred: $error');
      print('Stack trace: $stackTrace');
      throw error; // Rethrow the error to propagate it to the caller
    }
  }
}
