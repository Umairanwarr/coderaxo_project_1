import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/my_wallet_controller.dart';

class MyWalletScreen extends StatelessWidget {
  const MyWalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MyWalletController controller = Get.put(MyWalletController());

    const primaryColor = Color(0xFF2FC1BE);
    const backgroundColor = Color(0xFFF7F9F9);
    const greenCreditColor = Color(0xFF42C865);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: primaryColor),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'My Wallet',
          style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Total Balance Banner Card (Linear Gradient)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF47D7D4),
                      Color(0xFF2FC1BE),
                      Color(0xFF0CA9A6),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total Expenses (This Month)',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.account_balance_wallet_outlined,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Obx(() => Text(
                          controller.walletBalance.value,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.25),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.trending_up,
                            color: Colors.white,
                            size: 14,
                          ),
                          const SizedBox(width: 4),
                          Obx(() => Text(
                                controller.balanceGrowth.value,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // 2. Action Icons Bar (Top Up, Withdraw, Scan, More)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildActionButton(
                    icon: Icons.add,
                    label: 'Top Up',
                    isPrimary: true,
                    onTap: controller.topUp,
                    primaryColor: primaryColor,
                  ),
                  _buildActionButton(
                    icon: Icons.file_download_outlined,
                    label: 'Withdraw',
                    isPrimary: false,
                    onTap: controller.withdraw,
                    primaryColor: primaryColor,
                  ),
                  _buildActionButton(
                    icon: Icons.qr_code_scanner,
                    label: 'Scan',
                    isPrimary: false,
                    onTap: controller.scanQR,
                    primaryColor: primaryColor,
                  ),
                  _buildActionButton(
                    icon: Icons.grid_view,
                    label: 'More',
                    isPrimary: false,
                    onTap: controller.showMore,
                    primaryColor: primaryColor,
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // 3. Info Banner Container
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE5F7F6),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.info_outline,
                        color: primaryColor,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Ready for your next trip?',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Use your wallet balance to book hotels instantly without fees.',
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey.shade500,
                              height: 1.3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              // 4. Recent Transactions Header Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Recent Transactions',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  GestureDetector(
                    onTap: controller.seeAllTransactions,
                    child: const Text(
                      'See All',
                      style: TextStyle(
                        fontSize: 13,
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // 5. Recent Transactions List
              Obx(() => ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.transactions.length,
                    itemBuilder: (context, index) {
                      final item = controller.transactions[index];
                      return _buildWalletTransactionRow(item, greenCreditColor);
                    },
                  )),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required bool isPrimary,
    required VoidCallback onTap,
    required Color primaryColor,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              color: isPrimary ? primaryColor : Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: isPrimary ? null : Border.all(color: Colors.grey.shade200),
            ),
            child: Icon(
              icon,
              color: isPrimary ? Colors.white : Colors.black87,
              size: 24,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWalletTransactionRow(
    WalletTransaction item,
    Color creditColor,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Transaction Icon Box
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFF0F4F4),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              item.icon,
              color: item.isCredit ? creditColor : Colors.black87,
              size: 22,
            ),
          ),
          const SizedBox(width: 14),

          // Title & Time Text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  item.time,
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey.shade400,
                  ),
                ),
              ],
            ),
          ),

          // Amount & Category Tag
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                item.amount,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: item.isCredit ? creditColor : Colors.black87,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                item.category,
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.grey.shade400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}