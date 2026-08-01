// lib/services/navigation_service.dart
import 'package:coderaxo_project_1/controllers/admin_navbar_controller.dart';
import 'package:coderaxo_project_1/screens/admin/home_screen.dart';
import 'package:coderaxo_project_1/screens/admin/jobs_screen.dart';
import 'package:coderaxo_project_1/screens/admin/pay_screen.dart';
import 'package:coderaxo_project_1/screens/admin/community_screen.dart';
import 'package:coderaxo_project_1/screens/admin/photo_screen.dart';
import 'package:coderaxo_project_1/screens/admin/qc_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationService {
  // Singleton
  static final NavigationService _instance = NavigationService._internal();
  factory NavigationService() => _instance;
  NavigationService._internal();

  // Get controller instance
  NavigationController get controller => Get.find<NavigationController>();

  // 5 Screens (Matching the navbar tabs)
  final List<Widget> screens = const [
    HomeScreen(), // Index 0: Home
    QCScreen(), // Index 1: QC
    JobsScreen(), // Index 2: Jobs
    PayScreen(), // Index 3: Pay
    CommunityScreen(), // Index 4: Community
    PhotoScreen(), // Index 5: Photos
  ];

  // Get screen by index
  Widget getScreen(int index) {
    return screens[index];
  }

  // Change index
  void changeIndex(int index) {
    controller.changeIndex(index);
  }

  // Get current index
  int get currentIndex => controller.currentIndex.value;

  // Get screen title
  String getScreenTitle(int index) {
    return controller.navItems[index].label;
  }

  // Navigate to specific screen
  void navigateTo(int index) {
    changeIndex(index);
  }
}
