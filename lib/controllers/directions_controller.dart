import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DirectionsController extends GetxController {
  final TextEditingController yourLocationController =
  TextEditingController(text: 'Your Location');
  final TextEditingController destinationController =
  TextEditingController(text: 'Heden golf Hotel');

  @override
  void onClose() {
    yourLocationController.dispose();
    destinationController.dispose();
    super.onClose();
  }
}