import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WalletTransaction {
  final String title;
  final String time;
  final String amount;
  final String category;
  final IconData icon;
  final bool isCredit;

  WalletTransaction({
    required this.title,
    required this.time,
    required this.amount,
    required this.category,
    required this.icon,
    this.isCredit = false,
  });
}

class MyWalletController extends GetxController {
  // Wallet Balance Data
  var walletBalance = '\$4,250.00'.obs;
  var balanceGrowth = '+5% vs last month'.obs;

  // Recent Transactions List
  final transactions = <WalletTransaction>[
    WalletTransaction(
      title: 'Hotel Grand Stay',
      time: 'Today, 10:23 AM',
      amount: '- \$ 120.00',
      category: 'Booking',
      icon: Icons.domain,
      isCredit: false,
    ),
    WalletTransaction(
      title: 'Wallet Top Up',
      time: 'Yesterday, 4:00 PM',
      amount: '+ \$ 500.00',
      category: 'Top Up',
      icon: Icons.south_west,
      isCredit: true,
    ),
    WalletTransaction(
      title: 'Refund: Property Viewing',
      time: 'Nov 12, 09:30 AM',
      amount: '+ \$ 50.00',
      category: 'Refund',
      icon: Icons.attach_money,
      isCredit: true,
    ),
  ].obs;

  void topUp() {
    Get.snackbar(
      'Top Up',
      'Opening Top Up options...',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFF2FC1BE),
      colorText: Colors.white,
    );
  }

  void withdraw() {
    Get.snackbar(
      'Withdraw',
      'Opening withdrawal flow...',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFF2FC1BE),
      colorText: Colors.white,
    );
  }

  void scanQR() {
    Get.snackbar(
      'Scan',
      'Opening QR scanner...',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFF2FC1BE),
      colorText: Colors.white,
    );
  }

  void showMore() {
    Get.snackbar(
      'More',
      'Opening extra wallet services...',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFF2FC1BE),
      colorText: Colors.white,
    );
  }

  void seeAllTransactions() {
    Get.snackbar(
      'Transactions',
      'Opening complete transaction history...',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFF2FC1BE),
      colorText: Colors.white,
    );
  }
}   