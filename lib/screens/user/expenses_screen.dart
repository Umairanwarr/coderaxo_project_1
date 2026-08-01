// lib/screens/expenses_screen.dart
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ============================================
// RESPONSIVE HELPER CLASS
// ============================================
class ResponsiveExpenses {
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
// EXPENSES SCREEN
// ============================================
class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});

  @override
  State<ExpensesScreen> createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  int _selectedTabIndex = 0;
  final List<String> _tabs = ['This Month', 'Last 3 Months', 'Year to Date'];

  @override
  Widget build(BuildContext context) {
    ResponsiveExpenses.isSmallScreen(context);
    final padding = ResponsiveExpenses.padding(context);
    final spacing = ResponsiveExpenses.spacing(context, 20.0);

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        padding: padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Time Period Tabs
            _buildTimePeriodTabs(context),
            SizedBox(height: spacing),

            // Total Expenses Card
            _buildTotalExpensesCard(context),
            SizedBox(height: spacing + 4.0),

            // Expense Trend
            _buildExpenseTrend(context),
            SizedBox(height: spacing + 4.0),

            // Recent Transactions
            _buildRecentTransactions(context),
            SizedBox(height: spacing),

            // Export Button
            _buildExportButton(context),
            SizedBox(height: ResponsiveExpenses.spacing(context, 16.0)),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    final isSmall = ResponsiveExpenses.isSmallScreen(context);
    final iconSize = ResponsiveExpenses.fontSize(context, 20.0);

    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      foregroundColor: Colors.black,
      title: Text(
        'Expenses',
        style: TextStyle(
          fontSize: ResponsiveExpenses.fontSize(context, isSmall ? 16.0 : 20.0),
          fontWeight: FontWeight.w600,
          color: const Color(0xFF1E293B),
        ),
      ),
      centerTitle: false,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_new_outlined, size: iconSize),
        onPressed: () => Get.back(),
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.calendar_today_outlined,
            color: const Color(0xFF64748B),
            size: iconSize,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(
            Icons.more_vert_outlined,
            color: const Color(0xFF64748B),
            size: iconSize,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildTimePeriodTabs(BuildContext context) {
    final isSmall = ResponsiveExpenses.isSmallScreen(context);

    return Container(
      padding: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8.0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: List.generate(_tabs.length, (index) {
          final isActive = index == _selectedTabIndex;
          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedTabIndex = index;
                });
                Get.snackbar(
                  _tabs[index],
                  'Showing ${_tabs[index].toLowerCase()} data',
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: const Color(0xFF2563EB),
                  colorText: Colors.white,
                  duration: const Duration(seconds: 2),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: ResponsiveExpenses.spacing(
                    context,
                    isSmall ? 8.0 : 10.0,
                  ),
                ),
                decoration: BoxDecoration(
                  color: isActive
                      ? const Color(0xFF2563EB)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Center(
                  child: Text(
                    isSmall ? _getShortTabLabel(_tabs[index]) : _tabs[index],
                    style: TextStyle(
                      fontSize: ResponsiveExpenses.fontSize(
                        context,
                        isSmall ? 11.0 : 13.0,
                      ),
                      fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                      color: isActive ? Colors.white : const Color(0xFF64748B),
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  String _getShortTabLabel(String tab) {
    switch (tab) {
      case 'This Month':
        return 'Month';
      case 'Last 3 Months':
        return '3 Months';
      case 'Year to Date':
        return 'YTD';
      default:
        return tab;
    }
  }

  Widget _buildTotalExpensesCard(BuildContext context) {
    final isSmall = ResponsiveExpenses.isSmallScreen(context);

    return Container(
      padding: EdgeInsets.all(
        isSmall ? 16.0 : ResponsiveExpenses.spacing(context, 20.0),
      ),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFDC2626), Color(0xFFEF4444)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFDC2626).withOpacity(0.3),
            blurRadius: 12.0,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'TOTAL EXPENSES',
            style: TextStyle(
              fontSize: ResponsiveExpenses.fontSize(
                context,
                isSmall ? 12.0 : 14.0,
              ),
              fontWeight: FontWeight.w500,
              color: Colors.white70,
              letterSpacing: 1.0,
            ),
          ),
          SizedBox(height: ResponsiveExpenses.spacing(context, 8.0)),
          Row(
            children: [
              Text(
                '\$2,540.00',
                style: TextStyle(
                  fontSize: ResponsiveExpenses.fontSize(
                    context,
                    isSmall ? 26.0 : 34.0,
                  ),
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: ResponsiveExpenses.spacing(context, 12.0)),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 4.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_downward,
                      size: ResponsiveExpenses.fontSize(
                        context,
                        isSmall ? 12.0 : 14.0,
                      ),
                      color: Colors.white,
                    ),
                    SizedBox(width: 4.0),
                    Text(
                      '-8% vs last month',
                      style: TextStyle(
                        fontSize: ResponsiveExpenses.fontSize(
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

  Widget _buildExpenseTrend(BuildContext context) {
    final isSmall = ResponsiveExpenses.isSmallScreen(context);
    final barWidth = isSmall ? 24.0 : 30.0;
    final barHeight = isSmall ? 60.0 : 80.0;

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
                'Expense Trend',
                style: TextStyle(
                  fontSize: ResponsiveExpenses.fontSize(
                    context,
                    isSmall ? 16.0 : 18.0,
                  ),
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF1E293B),
                ),
              ),
              Text(
                isSmall ? 'Oct 1-31' : 'Oct 1 - Oct 31',
                style: TextStyle(
                  fontSize: ResponsiveExpenses.fontSize(
                    context,
                    isSmall ? 11.0 : 13.0,
                  ),
                  color: const Color(0xFF64748B),
                ),
              ),
            ],
          ),
          SizedBox(height: ResponsiveExpenses.spacing(context, 20.0)),

          // Bar Chart
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _buildBarItem(
                context,
                label: 'W1',
                value: 0.4,
                color: const Color(0xFFDC2626),
                barWidth: barWidth,
                barHeight: barHeight,
              ),
              _buildBarItem(
                context,
                label: 'W2',
                value: 0.7,
                color: const Color(0xFFEF4444),
                barWidth: barWidth,
                barHeight: barHeight,
              ),
              _buildBarItem(
                context,
                label: 'W3',
                value: 0.3,
                color: const Color(0xFFF87171),
                barWidth: barWidth,
                barHeight: barHeight,
              ),
              _buildBarItem(
                context,
                label: 'W4',
                value: 0.9,
                color: const Color(0xFFDC2626),
                barWidth: barWidth,
                barHeight: barHeight,
              ),
              _buildBarItem(
                context,
                label: 'W5',
                value: 0.5,
                color: const Color(0xFFEF4444),
                barWidth: barWidth,
                barHeight: barHeight,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBarItem(
    BuildContext context, {
    required String label,
    required double value,
    required Color color,
    required double barWidth,
    required double barHeight,
  }) {
    final isSmall = ResponsiveExpenses.isSmallScreen(context);

    return Column(
      children: [
        Container(
          width: barWidth,
          height: barHeight,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: barHeight * value,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [color, color.withOpacity(0.6)],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
        ),
        SizedBox(height: ResponsiveExpenses.spacing(context, 8.0)),
        Text(
          label,
          style: TextStyle(
            fontSize: ResponsiveExpenses.fontSize(
              context,
              isSmall ? 10.0 : 12.0,
            ),
            fontWeight: FontWeight.w500,
            color: const Color(0xFF64748B),
          ),
        ),
      ],
    );
  }

  Widget _buildRecentTransactions(BuildContext context) {
    final isSmall = ResponsiveExpenses.isSmallScreen(context);

    final List<Map<String, dynamic>> transactions = [
      {
        'title': 'Grocery Shopping',
        'date': 'Oct 24',
        'invoice': '#EX-4321',
        'amount': '\$156.80',
        'color': Colors.orange,
      },
      {
        'title': 'Electric Bill',
        'date': 'Oct 22',
        'invoice': '#EX-4518',
        'amount': '\$89.50',
        'color': Colors.blue,
      },
      {
        'title': 'Gas Station',
        'date': 'Oct 20',
        'invoice': '#EX-4515',
        'amount': '\$65.00',
        'color': Colors.green,
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
                  fontSize: ResponsiveExpenses.fontSize(
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
                  'View All',
                  style: TextStyle(
                    fontSize: ResponsiveExpenses.fontSize(
                      context,
                      isSmall ? 12.0 : 14.0,
                    ),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: ResponsiveExpenses.spacing(context, 12.0)),
          ...transactions.map((transaction) {
            return _buildTransactionItem(
              context,
              title: transaction['title'],
              date: transaction['date'],
              invoice: transaction['invoice'],
              amount: transaction['amount'],
              color: transaction['color'],
            );
          }),
        ],
      ),
    );
  }

  Widget _buildTransactionItem(
    BuildContext context, {
    required String title,
    required String date,
    required String invoice,
    required String amount,
    required Color color,
  }) {
    final isSmall = ResponsiveExpenses.isSmallScreen(context);

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: ResponsiveExpenses.spacing(context, 12.0),
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
              Icons.receipt_long_outlined,
              color: color,
              size: ResponsiveExpenses.fontSize(context, isSmall ? 16.0 : 20.0),
            ),
          ),
          SizedBox(width: ResponsiveExpenses.spacing(context, 12.0)),

          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isSmall ? _getShortTitle(title) : title,
                  style: TextStyle(
                    fontSize: ResponsiveExpenses.fontSize(
                      context,
                      isSmall ? 13.0 : 14.0,
                    ),
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF1E293B),
                  ),
                ),
                SizedBox(height: 2.0),
                Row(
                  children: [
                    Text(
                      date,
                      style: TextStyle(
                        fontSize: ResponsiveExpenses.fontSize(
                          context,
                          isSmall ? 10.0 : 12.0,
                        ),
                        color: const Color(0xFF64748B),
                      ),
                    ),
                    SizedBox(width: ResponsiveExpenses.spacing(context, 12.0)),
                    Text(
                      invoice,
                      style: TextStyle(
                        fontSize: ResponsiveExpenses.fontSize(
                          context,
                          isSmall ? 10.0 : 12.0,
                        ),
                        color: const Color(0xFF64748B),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Amount
          Text(
            amount,
            style: TextStyle(
              fontSize: ResponsiveExpenses.fontSize(
                context,
                isSmall ? 14.0 : 16.0,
              ),
              fontWeight: FontWeight.w700,
              color: const Color(0xFFDC2626),
            ),
          ),
        ],
      ),
    );
  }

  String _getShortTitle(String title) {
    if (title == 'Grocery Shopping') return 'Grocery';
    if (title == 'Electric Bill') return 'Electric';
    if (title == 'Gas Station') return 'Gas';
    return title;
  }

  Widget _buildExportButton(BuildContext context) {
    final isSmall = ResponsiveExpenses.isSmallScreen(context);

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {
          Get.snackbar(
            'Export Report',
            'Exporting full report...',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: const Color(0xFF2563EB),
            colorText: Colors.white,
            duration: const Duration(seconds: 2),
          );
        },
        icon: Icon(
          Icons.file_download_outlined,
          size: ResponsiveExpenses.fontSize(context, 20.0),
        ),
        label: Text(
          isSmall ? 'Export Report' : 'Export Full Report',
          style: TextStyle(
            fontSize: ResponsiveExpenses.fontSize(
              context,
              isSmall ? 14.0 : 16.0,
            ),
            fontWeight: FontWeight.w600,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: const Color(0xFF2563EB),
          padding: EdgeInsets.symmetric(
            vertical: ResponsiveExpenses.spacing(
              context,
              isSmall ? 12.0 : 16.0,
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
            side: BorderSide(color: const Color(0xFF2563EB).withOpacity(0.3)),
          ),
        ),
      ),
    );
  }
}
