
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:streamt/view/movie/mainpage.dart';


class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> login(String email, String password) async {
    if (email.isNotEmpty && password.isNotEmpty) {
      try {
        await _auth.signInWithEmailAndPassword(email: email, password: password);
       Get.offAll(() => mainpage());
      } catch (e) {
        Get.snackbar('Login Failed', e.toString(), snackPosition: SnackPosition.BOTTOM);
      }
    } else {
      Get.snackbar('Input Error', 'All fields are required.', snackPosition: SnackPosition.BOTTOM);
    }
  }
}