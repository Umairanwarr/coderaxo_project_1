import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
  // Text Editing Controllers
  late TextEditingController usernameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;

  // Reactive state for image path (if updating dynamically)
  var profileImagePath = ''.obs;

  @override
  void onInit() {
    super.onInit();
    // Pre-populating values based on design UI
    usernameController = TextEditingController(text: 'Alex Hales');
    emailController = TextEditingController(text: 'alex@gmail.com');
    phoneController = TextEditingController(text: '+14987889999');
  }

  @override
  void onClose() {
    usernameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.onClose();
  }

  void changePicture() {
    // TODO: Implement image picker logic here
    Get.snackbar(
      'Profile Picture',
      'Change picture tapped',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void updateProfile() {
    // Implement API/update logic here
    String username = usernameController.text;
    String email = emailController.text;
    String phone = phoneController.text;

    Get.snackbar(
      'Success',
      'Profile updated successfully!',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.teal,
      colorText: Colors.white,
    );
  }
}