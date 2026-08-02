import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SummaryController extends GetxController {
  // Promo Code TextField Controller
  final TextEditingController promoCodeController = TextEditingController();

  // Reactive counters for number of adults
  var adultsCount = 2.obs;   // Ages 12+
  var childrenCount = 1.obs; // Ages 0-11

  // Increment / Decrement for Adults (12+)
  void incrementAdults() {
    adultsCount.value++;
  }

  void decrementAdults() {
    if (adultsCount.value > 0) {
      adultsCount.value--;
    }
  }

  // Increment / Decrement for Children (0-11)
  void incrementChildren() {
    childrenCount.value++;
  }

  void decrementChildren() {
    if (childrenCount.value > 0) {
      childrenCount.value--;
    }
  }

  // Apply Promo Code (placeholder logic)
  void applyPromoCode() {
    final code = promoCodeController.text.trim();
    if (code.isEmpty) {
      Get.snackbar(
        'Oops',
        'Please enter a promo code',
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      Get.snackbar(
        'Applied',
        'Promo code "$code" applied successfully!',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  void onClose() {
    promoCodeController.dispose();
    super.onClose();
  }
}