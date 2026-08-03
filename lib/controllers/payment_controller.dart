import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController {
  // Payment Method Selection: 0 = Card, 1 = Wallet, 2 = PayPal, 3 = Stripe
  var selectedPaymentMethod = 0.obs;

  // Form Field Controllers
  late TextEditingController cardNumberController;
  late TextEditingController expiryDateController;
  late TextEditingController cvvController;
  late TextEditingController cardHolderNameController;

  @override
  void onInit() {
    super.onInit();
    cardNumberController = TextEditingController();
    expiryDateController = TextEditingController();
    cvvController = TextEditingController();
    cardHolderNameController = TextEditingController();
  }

  @override
  void onClose() {
    cardNumberController.dispose();
    expiryDateController.dispose();
    cvvController.dispose();
    cardHolderNameController.dispose();
    super.onClose();
  }

  void saveCard() {
    Get.snackbar(
      'Card Saved',
      'Your card details have been saved securely.',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFF2FC1BE),
      colorText: Colors.white,
    );
  }

  void processPayment() {
    Get.snackbar(
      'Payment Processing',
      'Processing payment of \$1,306,000...',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFF2FC1BE),
      colorText: Colors.white,
    );
  }
}