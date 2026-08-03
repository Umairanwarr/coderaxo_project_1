import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpenseTransaction {
  final String title;
  final String date;
  final String refNumber;
  final String amount;
  final IconData icon;

  ExpenseTransaction({
    required this.title,
    required this.date,
    required this.refNumber,
    required this.amount,
    required this.icon,
  });
}

class ExpensesController extends GetxController {
  // Time Period Filter: 0 = This Month, 1 = Last 3 Months, 2 = Year to Date
  var selectedPeriodIndex = 0.obs;

  // Total Expenses
  var totalExpenses = '\$2,540.00'.obs;
  var comparisonText = '-8% vs last month'.obs;

  // Active Bar Chart Index (W2 selected in design)
  var activeBarIndex = 1.obs;

  // Recent Transactions Data
  final transactions = <ExpenseTransaction>[
    ExpenseTransaction(
      title: 'Grocery Shopping',
      date: 'Oct 24',
      refNumber: '#EX-4521',
      amount: '-\$ 156.80',
      icon: Icons.shopping_bag_outlined,
    ),
    ExpenseTransaction(
      title: 'Electric Bill',
      date: 'Oct 22',
      refNumber: '#EX-4518',
      amount: '-\$ 89.50',
      icon: Icons.flash_on_outlined,
    ),
    ExpenseTransaction(
      title: 'Gas Station',
      date: 'Oct 20',
      refNumber: '#EX-4515',
      amount: '-\$ 65.00',
      icon: Icons.directions_car_outlined,
    ),
  ].obs;

  void exportReport() {
    Get.snackbar(
      'Export Report',
      'Exporting expense report as PDF...',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFF2FC1BE),
      colorText: Colors.white,
    );
  }

  void viewAllTransactions() {
    Get.snackbar(
      'Transactions',
      'Navigating to all transactions history...',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFF2FC1BE),
      colorText: Colors.white,
    );
  }
}