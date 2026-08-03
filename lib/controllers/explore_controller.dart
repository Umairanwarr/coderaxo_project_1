import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExploreController extends GetxController {
  // Search text field controller
  final TextEditingController searchController = TextEditingController();

  // View mode: 'grid' or 'map'
  var viewMode = 'grid'.obs;

  void switchToGrid() => viewMode.value = 'grid';
  void switchToMap() => viewMode.value = 'map';

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}