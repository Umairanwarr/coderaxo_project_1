// lib/screens/listings_screen.dart
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ============================================
// RESPONSIVE HELPER CLASS
// ============================================
class ResponsiveWallet {
  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;
  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static EdgeInsets padding(BuildContext context) {
    final width = screenWidth(context);
    if (width < 360) {
      return const EdgeInsets.all(12.0);
    } else if (width < 480) {
      return const EdgeInsets.all(16.0);
    } else {
      return const EdgeInsets.all(20.0);
    }
  }

  static double fontSize(BuildContext context, double size) {
    final width = screenWidth(context);
    if (width < 360) {
      return size * 0.8;
    } else if (width < 480) {
      return size * 0.9;
    } else {
      return size;
    }
  }

  static double spacing(BuildContext context, double size) {
    final width = screenWidth(context);
    if (width < 360) {
      return size * 0.7;
    } else if (width < 480) {
      return size * 0.85;
    } else {
      return size;
    }
  }

  static bool isSmallScreen(BuildContext context) => screenWidth(context) < 360;
  static bool isMediumScreen(BuildContext context) =>
      screenWidth(context) >= 360 && screenWidth(context) < 480;
  static bool isLargeScreen(BuildContext context) =>
      screenWidth(context) >= 480;
}

// ============================================
// LISTINGS SCREEN (WALLET)
// ============================================
class ListingsScreen extends StatefulWidget {
  const ListingsScreen({super.key});

  @override
  State<ListingsScreen> createState() => _ListingsScreenState();
}

class _ListingsScreenState extends State<ListingsScreen> {
  @override
  Widget build(BuildContext context) {
    ResponsiveWallet.isSmallScreen(context);
    final padding = ResponsiveWallet.padding(context);
    final spacing = ResponsiveWallet.spacing(context, 20.0);

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        padding: padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Balance Card
            _buildBalanceCard(context),
            SizedBox(height: spacing),

            // Quick Actions
            _buildQuickActions(context),
            SizedBox(height: spacing + 4.0),

            // Promotion Banner
            _buildPromotionBanner(context),
            SizedBox(height: spacing + 4.0),

            // Recent Transactions
            _buildRecentTransactions(context),
            SizedBox(height: spacing),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    final isSmall = ResponsiveWallet.isSmallScreen(context);
    ResponsiveWallet.fontSize(context, 20.0);

    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      foregroundColor: Colors.black,
      title: Text(
        'My Wallet',
        style: TextStyle(
          fontSize: ResponsiveWallet.fontSize(context, isSmall ? 16.0 : 20.0),
          fontWeight: FontWeight.w600,
          color: const Color(0xFF1E293B),
        ),
      ),
      centerTitle: false,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_new_outlined,
          size: ResponsiveWallet.fontSize(context, 20.0),
        ),
        onPressed: () => Get.back(),
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.notifications_outlined,
            color: const Color(0xFF64748B),
            size: ResponsiveWallet.fontSize(context, 20.0),
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(
            Icons.more_vert_outlined,
            color: const Color(0xFF64748B),
            size: ResponsiveWallet.fontSize(context, 20.0),
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildBalanceCard(BuildContext context) {
    final isSmall = ResponsiveWallet.isSmallScreen(context);
    ResponsiveWallet.fontSize(context, 32.0);

    return Container(
      padding: EdgeInsets.all(
        isSmall ? 16.0 : ResponsiveWallet.spacing(context, 20.0),
      ),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF2563EB), Color(0xFF3B82F6)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF2563EB).withOpacity(0.3),
            blurRadius: 12.0,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Total Expenses (This Month)',
            style: TextStyle(
              fontSize: ResponsiveWallet.fontSize(
                context,
                isSmall ? 12.0 : 14.0,
              ),
              fontWeight: FontWeight.w500,
              color: Colors.white70,
            ),
          ),
          SizedBox(height: ResponsiveWallet.spacing(context, 8.0)),
          Row(
            children: [
              Text(
                '\$4,250.00',
                style: TextStyle(
                  fontSize: ResponsiveWallet.fontSize(
                    context,
                    isSmall ? 24.0 : 32.0,
                  ),
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: ResponsiveWallet.spacing(context, 12.0)),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 2.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_upward,
                      size: ResponsiveWallet.fontSize(
                        context,
                        isSmall ? 12.0 : 14.0,
                      ),
                      color: Colors.white,
                    ),
                    SizedBox(width: 2.0),
                    Text(
                      '+5% vs last month',
                      style: TextStyle(
                        fontSize: ResponsiveWallet.fontSize(
                          context,
                          isSmall ? 10.0 : 12.0,
                        ),
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    final isSmall = ResponsiveWallet.isSmallScreen(context);
    final actionSize = isSmall ? 20.0 : 24.0;
    final labelSize = ResponsiveWallet.fontSize(context, isSmall ? 11.0 : 13.0);

    final List<Map<String, dynamic>> actions = [
      {
        'icon': Icons.arrow_upward_outlined,
        'label': 'Top Up',
        'color': const Color(0xFF2563EB),
      },
      {
        'icon': Icons.arrow_downward_outlined,
        'label': 'Withdraw',
        'color': const Color(0xFF059669),
      },
      {
        'icon': Icons.qr_code_scanner_outlined,
        'label': 'Scan',
        'color': const Color(0xFFD97706),
      },
      {
        'icon': Icons.more_horiz_outlined,
        'label': 'More',
        'color': const Color(0xFF7C3AED),
      },
    ];

    return Container(
      padding: EdgeInsets.all(isSmall ? 12.0 : 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8.0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: actions.map((action) {
          return _buildActionItem(
            context,
            icon: action['icon'],
            label: action['label'],
            color: action['color'],
            iconSize: actionSize,
            labelSize: labelSize,
            onTap: () {
              Get.snackbar(
                action['label'],
                '${action['label']} feature coming soon!',
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: action['color'],
                colorText: Colors.white,
                duration: const Duration(seconds: 2),
              );
            },
          );
        }).toList(),
      ),
    );
  }

  Widget _buildActionItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    required Color color,
    required double iconSize,
    required double labelSize,
    required VoidCallback onTap,
  }) {
    final isSmall = ResponsiveWallet.isSmallScreen(context);

    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(isSmall ? 10.0 : 12.0),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Icon(icon, color: color, size: iconSize),
          ),
          SizedBox(height: ResponsiveWallet.spacing(context, 6.0)),
          Text(
            label,
            style: TextStyle(
              fontSize: labelSize,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF1E293B),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPromotionBanner(BuildContext context) {
    final isSmall = ResponsiveWallet.isSmallScreen(context);
    // ignore: unused_local_variable
    final fontSize = ResponsiveWallet.fontSize(context, 16.0);

    return Container(
      padding: EdgeInsets.all(isSmall ? 12.0 : 16.0),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF7C3AED), Color(0xFF8B5CF6)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(isSmall ? 8.0 : 10.0),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Icon(
              Icons.flight_takeoff_outlined,
              color: Colors.white,
              size: ResponsiveWallet.fontSize(context, isSmall ? 24.0 : 28.0),
            ),
          ),
          SizedBox(width: ResponsiveWallet.spacing(context, 14.0)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isSmall
                      ? 'Ready for your trip?'
                      : 'Ready for your next trip?',
                  style: TextStyle(
                    fontSize: ResponsiveWallet.fontSize(
                      context,
                      isSmall ? 14.0 : 16.0,
                    ),
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 2.0),
                Text(
                  isSmall
                      ? 'Use wallet balance to book hotels.'
                      : 'Use your wallet balance to book hotels instantly without fees.',
                  style: TextStyle(
                    fontSize: ResponsiveWallet.fontSize(
                      context,
                      isSmall ? 11.0 : 13.0,
                    ),
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentTransactions(BuildContext context) {
    final isSmall = ResponsiveWallet.isSmallScreen(context);

    final List<Map<String, dynamic>> transactions = [
      {
        'title': 'Hotel Grand Stay',
        'time': 'Today, 10:23 AM',
        'amount': '- \$120.00',
        'type': 'Booking',
        'color': Colors.red,
        'isPositive': false,
      },
      {
        'title': 'Wallet Top Up',
        'time': 'Yesterday, 4:00 PM',
        'amount': '+ \$500.00',
        'type': 'Top Up',
        'color': Colors.green,
        'isPositive': true,
      },
      {
        'title': 'Refund: Property Viewing',
        'time': 'Nov 12, 09:30 AM',
        'amount': '+ \$50.00',
        'type': 'Refund',
        'color': Colors.green,
        'isPositive': true,
      },
    ];

    return Container(
      padding: EdgeInsets.all(isSmall ? 12.0 : 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8.0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recent Transactions',
                style: TextStyle(
                  fontSize: ResponsiveWallet.fontSize(
                    context,
                    isSmall ? 16.0 : 18.0,
                  ),
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF1E293B),
                ),
              ),
              TextButton(
                onPressed: () {
                  Get.snackbar(
                    'All Transactions',
                    'Viewing all transactions...',
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: const Color(0xFF2563EB),
                    colorText: Colors.white,
                    duration: const Duration(seconds: 2),
                  );
                },
                style: TextButton.styleFrom(
                  foregroundColor: const Color(0xFF2563EB),
                ),
                child: Text(
                  'See All',
                  style: TextStyle(
                    fontSize: ResponsiveWallet.fontSize(
                      context,
                      isSmall ? 12.0 : 14.0,
                    ),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: ResponsiveWallet.spacing(context, 12.0)),
          ...transactions.map((transaction) {
            return _buildTransactionItem(
              context,
              title: transaction['title'],
              time: transaction['time'],
              amount: transaction['amount'],
              type: transaction['type'],
              color: transaction['color'],
              isPositive: transaction['isPositive'],
            );
          }),
        ],
      ),
    );
  }

  Widget _buildTransactionItem(
    BuildContext context, {
    required String title,
    required String time,
    required String amount,
    required String type,
    required Color color,
    required bool isPositive,
  }) {
    final isSmall = ResponsiveWallet.isSmallScreen(context);
    // ignore: unused_local_variable
    final fontSize = ResponsiveWallet.fontSize(context, 14.0);

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: ResponsiveWallet.spacing(context, 12.0),
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.withOpacity(0.1), width: 1.0),
        ),
      ),
      child: Row(
        children: [
          // Icon
          Container(
            padding: EdgeInsets.all(isSmall ? 8.0 : 10.0),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Icon(
              isPositive ? Icons.arrow_downward : Icons.arrow_upward,
              color: color,
              size: ResponsiveWallet.fontSize(context, isSmall ? 16.0 : 20.0),
            ),
          ),
          SizedBox(width: ResponsiveWallet.spacing(context, 12.0)),

          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: ResponsiveWallet.fontSize(
                      context,
                      isSmall ? 13.0 : 14.0,
                    ),
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF1E293B),
                  ),
                ),
                SizedBox(height: 2.0),
                Text(
                  time,
                  style: TextStyle(
                    fontSize: ResponsiveWallet.fontSize(
                      context,
                      isSmall ? 10.0 : 12.0,
                    ),
                    color: const Color(0xFF64748B),
                  ),
                ),
              ],
            ),
          ),

          // Amount & Type
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amount,
                style: TextStyle(
                  fontSize: ResponsiveWallet.fontSize(
                    context,
                    isSmall ? 13.0 : 15.0,
                  ),
                  fontWeight: FontWeight.w700,
                  color: isPositive ? Colors.green : Colors.red,
                ),
              ),
              SizedBox(height: 2.0),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 2.0,
                ),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Text(
                  type,
                  style: TextStyle(
                    fontSize: ResponsiveWallet.fontSize(
                      context,
                      isSmall ? 9.0 : 10.0,
                    ),
                    fontWeight: FontWeight.w600,
                    color: color,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
