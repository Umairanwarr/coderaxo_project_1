// lib/screens/dashboard_screen.dart
// ignore_for_file: deprecated_member_use

import 'package:coderaxo_project_1/screens/user/analysis_screen.dart';
import 'package:coderaxo_project_1/screens/user/earning_screen.dart';
import 'package:coderaxo_project_1/screens/user/expenses_screen.dart';
import 'package:coderaxo_project_1/screens/user/my_listing_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ============================================
// RESPONSIVE HELPER CLASS
// ============================================
class Responsive {
  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;
  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  // Responsive padding
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

  // Responsive font size
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

  // Responsive spacing
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

  // Check if small screen
  static bool isSmallScreen(BuildContext context) => screenWidth(context) < 360;

  // Check if medium screen
  static bool isMediumScreen(BuildContext context) =>
      screenWidth(context) >= 360 && screenWidth(context) < 480;

  // Check if large screen
  static bool isLargeScreen(BuildContext context) =>
      screenWidth(context) >= 480;
}

// ============================================
// DASHBOARD SCREEN
// ============================================
//

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive.isSmallScreen(context);
    Responsive.isMediumScreen(context);
    final padding = Responsive.padding(context);
    final spacing = Responsive.spacing(context, 16.0);

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        padding: padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Earnings Card
            _buildEarningsCard(context),
            SizedBox(height: spacing),

            // Stats Row
            _buildStatsRow(context),
            SizedBox(height: spacing + 8.0),

            // Management Tools Title
            Text(
              'Management Tools',
              style: TextStyle(
                fontSize: Responsive.fontSize(context, 18.0),
                fontWeight: FontWeight.w600,
                color: const Color(0xFF1E293B),
              ),
            ),
            SizedBox(height: spacing),

            // Management Grid
            _buildManagementGrid(context),
            SizedBox(height: spacing),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    final isSmall = Responsive.isSmallScreen(context);

    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      foregroundColor: Colors.black,
      title: Text(
        'View Report',
        style: TextStyle(
          fontSize: Responsive.fontSize(context, isSmall ? 16.0 : 20.0),
          fontWeight: FontWeight.w600,
          color: const Color(0xFF1E293B),
        ),
      ),
      centerTitle: false,
      actions: [
        IconButton(
          icon: Icon(
            Icons.calendar_today_outlined,
            color: const Color(0xFF64748B),
            size: Responsive.fontSize(context, 20.0),
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(
            Icons.more_vert_outlined,
            color: const Color(0xFF64748B),
            size: Responsive.fontSize(context, 20.0),
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildEarningsCard(BuildContext context) {
    final isSmall = Responsive.isSmallScreen(context);
    // ignore: unused_local_variable
    final width = Responsive.screenWidth(context);
    Responsive.padding(context);

    return Container(
      padding: EdgeInsets.all(
        isSmall ? 16.0 : Responsive.spacing(context, 20.0),
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
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(isSmall ? 6.0 : 8.0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Icon(
                  Icons.attach_money,
                  color: Colors.white,
                  size: Responsive.fontSize(context, isSmall ? 20.0 : 24.0),
                ),
              ),
              SizedBox(width: Responsive.spacing(context, 12.0)),
              Text(
                'Total Earnings',
                style: TextStyle(
                  fontSize: Responsive.fontSize(context, isSmall ? 14.0 : 16.0),
                  fontWeight: FontWeight.w500,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
          SizedBox(height: Responsive.spacing(context, 12.0)),
          Text(
            '\$12,450',
            style: TextStyle(
              fontSize: Responsive.fontSize(context, isSmall ? 28.0 : 36.0),
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          SizedBox(height: Responsive.spacing(context, 4.0)),
          Row(
            children: [
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
                      size: Responsive.fontSize(context, isSmall ? 12.0 : 14.0),
                      color: Colors.white,
                    ),
                    SizedBox(width: Responsive.spacing(context, 2.0)),
                    Text(
                      '+12%',
                      style: TextStyle(
                        fontSize: Responsive.fontSize(
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
              SizedBox(width: Responsive.spacing(context, 8.0)),
              Text(
                'This month',
                style: TextStyle(
                  fontSize: Responsive.fontSize(context, isSmall ? 12.0 : 14.0),
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatsRow(BuildContext context) {
    final isSmall = Responsive.isSmallScreen(context);
    final spacing = Responsive.spacing(context, 12.0);

    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            context,
            icon: Icons.list_alt_outlined,
            label: isSmall ? 'Listings' : 'Active Listings',
            value: '5',
            color: Colors.blue,
            onTap: () {
              Get.snackbar(
                'Active Listings',
                'Showing 5 active listings',
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: const Color(0xFF2563EB),
                colorText: Colors.white,
                duration: const Duration(seconds: 2),
              );
            },
          ),
        ),
        SizedBox(width: spacing),
        Expanded(
          child: _buildStatCard(
            context,
            icon: Icons.pending_outlined,
            label: isSmall ? 'Pending' : 'Pending Requests',
            value: '3',
            subtitle: 'Action needed',
            color: Colors.orange,
            onTap: () {
              Get.snackbar(
                'Pending Requests',
                'You have 3 pending requests',
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.orange,
                colorText: Colors.white,
                duration: const Duration(seconds: 2),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
    String subtitle = '',
    required Color color,
    required VoidCallback onTap,
  }) {
    final isSmall = Responsive.isSmallScreen(context);
    // ignore: unused_local_variable
    final fontSize = Responsive.fontSize(context, 16.0);

    return GestureDetector(
      onTap: onTap,
      child: Container(
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
              children: [
                Container(
                  padding: EdgeInsets.all(isSmall ? 6.0 : 8.0),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Icon(
                    icon,
                    color: color,
                    size: Responsive.fontSize(context, isSmall ? 16.0 : 20.0),
                  ),
                ),
                const Spacer(),
                if (subtitle.isNotEmpty)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6.0,
                      vertical: 2.0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Text(
                      '!',
                      style: TextStyle(
                        fontSize: Responsive.fontSize(context, 12.0),
                        fontWeight: FontWeight.w700,
                        color: Colors.red,
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(height: Responsive.spacing(context, 8.0)),
            Text(
              value,
              style: TextStyle(
                fontSize: Responsive.fontSize(context, isSmall ? 20.0 : 24.0),
                fontWeight: FontWeight.w700,
                color: const Color(0xFF1E293B),
              ),
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: Responsive.fontSize(context, isSmall ? 11.0 : 13.0),
                color: subtitle.isNotEmpty
                    ? Colors.orange
                    : const Color(0xFF64748B),
                fontWeight: subtitle.isNotEmpty
                    ? FontWeight.w600
                    : FontWeight.w400,
              ),
            ),
            if (subtitle.isNotEmpty)
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: Responsive.fontSize(context, isSmall ? 9.0 : 11.0),
                  color: Colors.red,
                  fontWeight: FontWeight.w500,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildManagementGrid(BuildContext context) {
    final isSmall = Responsive.isSmallScreen(context);
    final spacing = Responsive.spacing(context, 12.0);

    final List<Map<String, dynamic>> tools = [
      {
        'icon': Icons.home_work_outlined,
        'title': 'My Listings',
        'subtitle': isSmall ? '5 properties' : 'Manage 5 properties',
        'color': const Color(0xFF2563EB),
        'route': AppRoutes.listings,
      },
      {
        'icon': Icons.attach_money_outlined,
        'title': 'Earnings',
        'subtitle': isSmall ? 'Payouts' : 'Payouts & History',
        'color': const Color(0xFF059669),
        'route': AppRoutes.earnings,
      },
      {
        'icon': Icons.receipt_long_outlined,
        'title': 'Expenses',
        'subtitle': isSmall ? 'Maintenance' : 'Track maintenance',
        'color': const Color(0xFFD97706),
        'route': AppRoutes.expenses,
      },
      {
        'icon': Icons.analytics_outlined,
        'title': 'Analytics',
        'subtitle': isSmall ? 'Trends' : 'Insights & Trends',
        'color': const Color(0xFF7C3AED),
        'route': AppRoutes.analytics,
      },
    ];

    final crossAxisCount = 2;
    final childAspectRatio = isSmall ? 1.1 : 1.2;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: spacing,
        mainAxisSpacing: spacing,
        childAspectRatio: childAspectRatio,
      ),
      itemCount: tools.length,
      itemBuilder: (context, index) {
        final tool = tools[index];
        return _buildManagementItem(
          context,
          icon: tool['icon'],
          title: tool['title'],
          subtitle: tool['subtitle'],
          color: tool['color'],
          onTap: () {
            Get.toNamed(tool['route']);
          },
        );
      },
    );
  }

  Widget _buildManagementItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    final isSmall = Responsive.isSmallScreen(context);
    final padding = isSmall ? 12.0 : 16.0;
    // ignore: unused_local_variable
    final fontSize = Responsive.fontSize(context, 16.0);
    final iconSize = Responsive.fontSize(context, isSmall ? 24.0 : 28.0);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(padding),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(isSmall ? 8.0 : 10.0),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Icon(icon, color: color, size: iconSize),
            ),
            SizedBox(height: Responsive.spacing(context, isSmall ? 6.0 : 10.0)),
            Text(
              title,
              style: TextStyle(
                fontSize: Responsive.fontSize(context, isSmall ? 14.0 : 16.0),
                fontWeight: FontWeight.w600,
                color: const Color(0xFF1E293B),
              ),
            ),
            SizedBox(height: Responsive.spacing(context, 2.0)),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: Responsive.fontSize(context, isSmall ? 10.0 : 12.0),
                color: const Color(0xFF64748B),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================
// APP ROUTES
// ============================================
class AppRoutes {
  static const String listings = '/listings';
  static const String earnings = '/earnings';
  static const String expenses = '/expenses';
  static const String analytics = '/analytics';

  static final routes = [
    GetPage(
      name: listings,
      page: () => const ListingsScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: earnings,
      page: () => const EarningsScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: expenses,
      page: () => const ExpensesScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: analytics,
      page: () => const AnalyticsScreen(),
      transition: Transition.fadeIn,
    ),
  ];
}
