import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  // Dashboard Stat Variables
  var totalEarnings = '\$12,450'.obs;
  var earningsGrowth = '+12%'.obs;
  var activeListingsCount = 5.obs;
  var pendingRequestsCount = 3.obs;

  void viewReport() {
    Get.snackbar(
      'Report',
      'Opening detailed earnings report...',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFF2FC1BE),
      colorText: Colors.white,
    );
  }

  void openMyListings() {
    Get.toNamed('/explore'); // Or your dedicated listings route
  }

  void openEarnings() {
    Get.toNamed('/summary');
  }

  void openExpenses() {
    Get.snackbar(
      'Expenses',
      'Opening expenses manager...',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFF2FC1BE),
      colorText: Colors.white,
    );
  }

  void openAnalytics() {
    Get.toNamed('/property-analytics');
  }
}