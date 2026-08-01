// lib/widgets/custom_navigation_bar.dart
// ignore_for_file: deprecated_member_use

import 'package:coderaxo_project_1/controllers/admin_navbar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NavigationController>();

    return Obx(
      () => Container(
        height: 75,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 15,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(controller.navItems.length, (index) {
            final isSelected = controller.currentIndex.value == index;
            final item = controller.navItems[index];
            return _buildNavItem(
              icon: item.icon,
              label: item.label,
              isSelected: isSelected,
              onTap: () => controller.changeIndex(index),
            );
          }),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: isSelected ? const Color(0xFFEFF6FF) : Colors.transparent,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected
                  ? const Color(0xFF2563EB)
                  : const Color(0xFF94A3B8),
              size: 26,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                color: isSelected
                    ? const Color(0xFF2563EB)
                    : const Color(0xFF94A3B8),
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                letterSpacing: 0.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
