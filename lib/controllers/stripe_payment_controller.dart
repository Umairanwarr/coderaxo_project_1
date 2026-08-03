import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StripePaymentController extends GetxController {
  // Payment Method Selection: 0 = Card, 1 = Wallet, 2 = PayPal, 3 = Stripe
  var selectedPaymentMethod = 3.obs;

  // Saved Stripe account details
  var savedAccountName = 'Alex Hales'.obs;
  var savedAccountEmail = 'alex@gmail.com'.obs;

  void addStripeAccount() {
    Get.snackbar(
      'Stripe',
      'Redirecting to Stripe authentication...',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFF2FC1BE),
      colorText: Colors.white,
    );
  }

  void processPayment() {
    Get.snackbar(
      'Payment Processing',
      'Processing payment of \$1,774,000 via Stripe...',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFF2FC1BE),
      colorText: Colors.white,
    );
  }
}