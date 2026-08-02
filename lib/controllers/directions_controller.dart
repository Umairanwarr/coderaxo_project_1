import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DirectionsController extends GetxController {
  late TextEditingController startLocationController;
  late TextEditingController destinationController;

  // Asset path for your map screenshot/image
  
  var mapImagePath = 'assets/images/map_bg.png'.obs;

  @override
  void onInit() {
    super.onInit();
    startLocationController = TextEditingController(text: 'Your Location');
    destinationController = TextEditingController(text: 'Town Place Apartments');
  }

  @override
  void onClose() {
    startLocationController.dispose();
    destinationController.dispose();
    super.onClose();
  }
}