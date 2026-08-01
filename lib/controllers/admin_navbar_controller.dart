// lib/controllers/navigation_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  // Observable current index - Default: Home (index 0)
  var currentIndex = 0.obs;

  // 6 Navigation items for bottom bar (Based on your image)
  final List<NavItem> navItems = const [
    NavItem(label: 'Home', icon: Icons.home_outlined),
    NavItem(label: 'QC', icon: Icons.check_circle_outline),
    NavItem(label: 'Jobs', icon: Icons.work_outline),
    NavItem(label: 'Pay', icon: Icons.payment_outlined),
    NavItem(label: 'Community', icon: Icons.people_outline),
    NavItem(label: 'Photos', icon: Icons.photo_library_outlined),
  ];

  // Change index
  void changeIndex(int index) {
    if (currentIndex.value != index) {
      currentIndex.value = index;
    }
  }

  // Get screen title
  String getScreenTitle(int index) {
    return navItems[index].label;
  }

  // Navigation shortcuts
  void goToHome() => currentIndex.value = 0;
  void goToQC() => currentIndex.value = 1;
  void goToJobs() => currentIndex.value = 2;
  void goToPay() => currentIndex.value = 3;
  void goToCommunity() => currentIndex.value = 4;
  void goToPhotos() => currentIndex.value = 5;
}

// Navigation Item Model
class NavItem {
  final String label;
  final IconData icon;

  const NavItem({required this.label, required this.icon});
}
