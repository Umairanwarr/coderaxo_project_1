import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SummaryController extends GetxController {
  late TextEditingController promoCodeController;

  // Pricing values matching design
  var purchasePrice = 1250000.00;
  var closingCostsEstimate = 18500.00;
  var agentFees = 37500.00;
  var downPaymentRequired = 1306000.00;
  var downPaymentPercentage = 20;

  var isPromoApplied = false.obs;

  @override
  void onInit() {
    super.onInit();
    promoCodeController = TextEditingController();
  }

  @override
  void onClose() {
    promoCodeController.dispose();
    super.onClose();
  }

  void applyPromoCode() {
    if (promoCodeController.text.isNotEmpty) {
      isPromoApplied.value = true;
      Get.snackbar(
        'Promo Code',
        'Promo code applied successfully!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color(0xFF2FC1BE),
        colorText: Colors.white,
      );
    }
  }

  void proceedToPayment() {
    Get.snackbar(
      'Payment',
      'Proceeding to payment gateway...',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFF2FC1BE),
      colorText: Colors.white,
    );
  }
}