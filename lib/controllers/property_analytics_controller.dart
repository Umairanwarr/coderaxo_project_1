import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PropertyAnalyticsController extends GetxController {
  // Time period filter: 0 = This Month, 1 = Last 3 Months, 2 = Year to Date
  var selectedPeriodIndex = 0.obs;

  // Analytics Metrics Data
  var occupancyRate = '82%'.obs;
  var occupancyChange = '+4%'.obs;

  var yieldRate = '5.4%'.obs;
  var yieldChange = '+0.2%'.obs;

  var viewingsCount = '12'.obs;

  var avgStayNights = '4.2'.obs;
  var avgStayChange = '+0.5'.obs;

  // Financial Summary
  var netIncome = '\$4,250'.obs;
  var incomeChange = '+12%'.obs;

  void exportReport() {
    Get.snackbar(
      'Export Report',
      'Exporting full analytics report as PDF...',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFF2FC1BE),
      colorText: Colors.white,
    );
  }
}