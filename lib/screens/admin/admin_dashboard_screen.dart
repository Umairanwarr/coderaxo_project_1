// lib/screens/user/dashboard_screen.dart
import 'package:coderaxo_project_1/controllers/admin_navbar_controller.dart';
import 'package:coderaxo_project_1/services/admin_navigation_services.dart';
import 'package:coderaxo_project_1/widgets/custom_admin_navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NavigationController>();
    final navService = NavigationService();

    return Scaffold(
      body: Obx(() => navService.getScreen(controller.currentIndex.value)),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}
