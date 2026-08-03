import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WalletPaymentController extends GetxController {
  // Payment Method Selection: 0 = Card, 1 = Wallet, 2 = PayPal, 3 = Stripe
  var selectedPaymentMethod = 1.obs;

  // Wallet Balances
  var walletBalance = 2950000.00.obs;
  var totalAmount = 1306000.00.obs;

  // Computed remaining balance
  double get remainingBalance => walletBalance.value - totalAmount.value;

  void processWalletPayment() {
    Get.snackbar(
      'Payment Processing',
      'Processing payment of \$1,306,000 from your Wallet...',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFF2FC1BE),
      colorText: Colors.white,
    );
  }
}