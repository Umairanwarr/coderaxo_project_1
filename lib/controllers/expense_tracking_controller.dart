import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ExpenseTrackingItem {
  final String title;
  final String property;
  final String date;
  final String amount;
  final String category;
  final IconData icon;

  ExpenseTrackingItem({
    required this.title,
    required this.property,
    required this.date,
    required this.amount,
    required this.category,
    required this.icon,
  });
}

class ExpenseTrackingController extends GetxController {
  // Total Expenses Card Stats
  var totalExpenses = '\$4,250.00'.obs;
  var percentageChange = '+5% vs last month'.obs;

  // AI Insight Message
  var aiInsightText =
      'Utilities are 15% higher than average this month. Consider checking for leaks at Sunset Villa.'.obs;

  // Selected Category Filter Index: 0 = All, 1 = Maintenance, 2 = Utilities, 3 = Tax
  var selectedCategoryIndex = 0.obs;

  final categories = ['All', 'Maintenance', 'Utilities', 'Tax'];

  // Expense Transactions List
  final transactions = <ExpenseTrackingItem>[
    ExpenseTrackingItem(
      title: 'HVAC Repair',
      property: 'Ocean View Apt',
      date: 'Oct 24',
      amount: '-\$ 150.00',
      category: 'Maintenance',
      icon: Icons.build_outlined,
    ),
    ExpenseTrackingItem(
      title: 'Water Bill',
      property: 'Sunset Villa',
      date: 'Oct 22',
      amount: '-\$ 85.50',
      category: 'Utilities',
      icon: Icons.water_drop_outlined,
    ),
    ExpenseTrackingItem(
      title: 'Repainting Hallway',
      property: 'Sunset Villa',
      date: 'Oct 20',
      amount: '-\$ 400.00',
      category: 'Renovation',
      icon: Icons.format_paint_outlined,
    ),
    ExpenseTrackingItem(
      title: 'Property Tax Q3',
      property: 'Multiple Properties',
      date: 'Oct 15',
      amount: '-\$ 1200.00',
      category: 'Tax',
      icon: Icons.description_outlined,
    ),
  ].obs;

  void addExpense() {
    Get.snackbar(
      'Add Expense',
      'Opening new expense form...',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFF2FC1BE),
      colorText: Colors.white,
    );
  }

  void sortTransactions() {
    Get.snackbar(
      'Sort',
      'Sorting transactions by date...',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFF2FC1BE),
      colorText: Colors.white,
    );
  }
}