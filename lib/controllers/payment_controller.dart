import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController {
  // Selected payment method: 'card', 'wallet', 'apple'
  var selectedMethod = 'apple'.obs;

  // Card form controllers
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();
  final TextEditingController cardholderNameController = TextEditingController();

  // Switch payment method
  void selectMethod(String method) {
    selectedMethod.value = method;
  }

  // Save Card action
  void saveCard() {
    // Placeholder logic
    Get.snackbar(
      'Saved',
      'Card details saved successfully!',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  // Pay action
  void pay() {
    Get.snackbar(
      'Processing',
      'Payment initiated...',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  @override
  void onClose() {
    cardNumberController.dispose();
    expiryDateController.dispose();
    cvvController.dispose();
    cardholderNameController.dispose();
    super.onClose();
  }
}