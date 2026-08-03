import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaypalPaymentController extends GetxController {
  // Payment Method Selection: 0 = Card, 1 = Wallet, 2 = PayPal, 3 = Stripe
  var selectedPaymentMethod = 2.obs; 

  // Saved PayPal account details
  var savedAccountName = 'Alex Hales'.obs;
  var savedAccountEmail = 'alex@gmail.com'.obs;

  void addPaypalAccount() {
    Get.snackbar(
      'PayPal',
      'Redirecting to PayPal authentication...',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFF2FC1BE),
      colorText: Colors.white,
    );
  }

  void processPayment() {
    Get.snackbar(
      'Payment Processing',
      'Processing payment of \$1,774,000 via PayPal...',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFF2FC1BE),
      colorText: Colors.white,
    );
  }
}