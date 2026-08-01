// lib/screens/analytics_screen.dart
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ============================================
// RESPONSIVE HELPER CLASS
// ============================================
class ResponsiveAnalytics {
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
      return size * 0.75;
    } else if (width < 480) {
      return size * 0.85;
    } else {
      return size;
    }
  }

  static double spacing(BuildContext context, double size) {
    final width = screenWidth(context);
    if (width < 360) {
      return size * 0.6;
    } else if (width < 480) {
      return size * 0.8;
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
// ANALYTICS SCREEN
// ============================================
class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  int _selectedTabIndex = 0;
  final List<String> _tabs = ['This Month', 'Last 3 Months', 'Year to Date'];

  @override
  Widget build(BuildContext context) {
    ResponsiveAnalytics.isSmallScreen(context);
    final padding = ResponsiveAnalytics.padding(context);
    final spacing = ResponsiveAnalytics.spacing(context, 16.0);

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        padding: padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Time Period Tabs
            _buildTimePeriodTabs(context),
            SizedBox(height: spacing),

            // Stats Grid
            _buildStatsGrid(context),
            SizedBox(height: spacing),

            // Occupancy Trends
            _buildOccupancyTrends(context),
            SizedBox(height: spacing),

            // Financial Breakdown
            _buildFinancialBreakdown(context),
            SizedBox(height: spacing),

            // Export Button
            _buildExportButton(context),
            SizedBox(height: ResponsiveAnalytics.spacing(context, 16.0)),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    final isSmall = ResponsiveAnalytics.isSmallScreen(context);
    final iconSize = ResponsiveAnalytics.fontSize(context, 20.0);

    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      foregroundColor: Colors.black,
      title: Text(
        'Property Analytics',
        style: TextStyle(
          fontSize: ResponsiveAnalytics.fontSize(
            context,
            isSmall ? 16.0 : 20.0,
          ),
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
    final isSmall = ResponsiveAnalytics.isSmallScreen(context);

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
                  vertical: ResponsiveAnalytics.spacing(
                    context,
                    isSmall ? 6.0 : 10.0,
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
                      fontSize: ResponsiveAnalytics.fontSize(
                        context,
                        isSmall ? 10.0 : 13.0,
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

  Widget _buildStatsGrid(BuildContext context) {
    final isSmall = ResponsiveAnalytics.isSmallScreen(context);
    final spacing = ResponsiveAnalytics.spacing(context, 8.0);

    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: spacing,
      mainAxisSpacing: spacing,
      childAspectRatio: 0.95,
      children: [
        _StatCard(
          title: 'Occupancy',
          value: '82%',
          subtitle: '+4%',
          color: Colors.blue,
          icon: Icons.home_outlined,
          isSmall: isSmall,
        ),
        _StatCard(
          title: 'Viewings',
          value: '12',
          subtitle: 'Month',
          color: Colors.orange,
          icon: Icons.visibility_outlined,
          isSmall: isSmall,
        ),
        _StatCard(
          title: 'Avg. Stay',
          value: '4.2',
          subtitle: '+0.5',
          color: Colors.green,
          icon: Icons.calendar_today_outlined,
          isSmall: isSmall,
        ),
      ],
    );
  }

  Widget _buildOccupancyTrends(BuildContext context) {
    final isSmall = ResponsiveAnalytics.isSmallScreen(context);
    final barWidth = isSmall ? 20.0 : 30.0;
    final barHeight = isSmall ? 40.0 : 60.0;

    return Container(
      padding: EdgeInsets.all(isSmall ? 10.0 : 16.0),
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
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Occupancy Trends',
            style: TextStyle(
              fontSize: ResponsiveAnalytics.fontSize(
                context,
                isSmall ? 14.0 : 18.0,
              ),
              fontWeight: FontWeight.w600,
              color: const Color(0xFF1E293B),
            ),
          ),
          SizedBox(height: ResponsiveAnalytics.spacing(context, 2.0)),
          Text(
            isSmall
                ? 'Daily occupancy rate'
                : 'Daily occupancy rate over selected period',
            style: TextStyle(
              fontSize: ResponsiveAnalytics.fontSize(
                context,
                isSmall ? 10.0 : 13.0,
              ),
              color: const Color(0xFF64748B),
            ),
          ),
          SizedBox(height: ResponsiveAnalytics.spacing(context, 16.0)),

          // Bar Chart
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _buildTrendBar(
                context,
                label: isSmall ? 'W1' : 'Week 1',
                value: 0.5,
                color: const Color(0xFF2563EB),
                barWidth: barWidth,
                barHeight: barHeight,
              ),
              _buildTrendBar(
                context,
                label: isSmall ? 'W2' : 'Week 2',
                value: 0.7,
                color: const Color(0xFF3B82F6),
                barWidth: barWidth,
                barHeight: barHeight,
              ),
              _buildTrendBar(
                context,
                label: isSmall ? 'W3' : 'Week 3',
                value: 0.4,
                color: const Color(0xFF60A5FA),
                barWidth: barWidth,
                barHeight: barHeight,
              ),
              _buildTrendBar(
                context,
                label: isSmall ? 'W4' : 'Week 4',
                value: 0.85,
                color: const Color(0xFF2563EB),
                barWidth: barWidth,
                barHeight: barHeight,
              ),
              _buildTrendBar(
                context,
                label: isSmall ? 'W5' : 'Week 5',
                value: 0.6,
                color: const Color(0xFF3B82F6),
                barWidth: barWidth,
                barHeight: barHeight,
              ),
            ],
          ),
          SizedBox(height: ResponsiveAnalytics.spacing(context, 12.0)),

          // Trend line indicator
          Container(
            padding: EdgeInsets.all(isSmall ? 6.0 : 12.0),
            decoration: BoxDecoration(
              color: const Color(0xFFEFF6FF),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildTrendIndicator(
                  context,
                  label: isSmall ? 'Rate' : 'Occupancy Rate',
                  value: '82%',
                  color: const Color(0xFF2563EB),
                  isSmall: isSmall,
                ),
                if (!isSmall) ...[
                  Container(
                    width: 1.0,
                    height: 25.0,
                    color: Colors.grey.withOpacity(0.2),
                  ),
                ],
                _buildTrendIndicator(
                  context,
                  label: isSmall ? 'Target' : 'vs Target',
                  value: '+5.4%',
                  color: Colors.green,
                  isSmall: isSmall,
                ),
                if (!isSmall) ...[
                  Container(
                    width: 1.0,
                    height: 25.0,
                    color: Colors.grey.withOpacity(0.2),
                  ),
                ],
                _buildTrendIndicator(
                  context,
                  label: isSmall ? 'Last' : 'vs Last Month',
                  value: '+4%',
                  color: Colors.green,
                  isSmall: isSmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTrendBar(
    BuildContext context, {
    required String label,
    required double value,
    required Color color,
    required double barWidth,
    required double barHeight,
  }) {
    final isSmall = ResponsiveAnalytics.isSmallScreen(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: barWidth,
          height: barHeight,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(6.0),
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
                borderRadius: BorderRadius.circular(6.0),
              ),
            ),
          ),
        ),
        SizedBox(height: ResponsiveAnalytics.spacing(context, 4.0)),
        Text(
          label,
          style: TextStyle(
            fontSize: ResponsiveAnalytics.fontSize(
              context,
              isSmall ? 8.0 : 11.0,
            ),
            fontWeight: FontWeight.w500,
            color: const Color(0xFF64748B),
          ),
        ),
      ],
    );
  }

  Widget _buildTrendIndicator(
    BuildContext context, {
    required String label,
    required String value,
    required Color color,
    required bool isSmall,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: ResponsiveAnalytics.fontSize(
              context,
              isSmall ? 13.0 : 16.0,
            ),
            fontWeight: FontWeight.w700,
            color: color,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: ResponsiveAnalytics.fontSize(
              context,
              isSmall ? 8.0 : 11.0,
            ),
            color: const Color(0xFF64748B),
          ),
        ),
      ],
    );
  }

  Widget _buildFinancialBreakdown(BuildContext context) {
    final isSmall = ResponsiveAnalytics.isSmallScreen(context);

    return Container(
      padding: EdgeInsets.all(isSmall ? 10.0 : 16.0),
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
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Financial Breakdown',
            style: TextStyle(
              fontSize: ResponsiveAnalytics.fontSize(
                context,
                isSmall ? 14.0 : 18.0,
              ),
              fontWeight: FontWeight.w600,
              color: const Color(0xFF1E293B),
            ),
          ),
          SizedBox(height: ResponsiveAnalytics.spacing(context, 12.0)),

          // Net Income
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Net Income',
                      style: TextStyle(
                        fontSize: ResponsiveAnalytics.fontSize(
                          context,
                          isSmall ? 10.0 : 14.0,
                        ),
                        color: const Color(0xFF64748B),
                      ),
                    ),
                    SizedBox(height: ResponsiveAnalytics.spacing(context, 2.0)),
                    Text(
                      '\$4,250',
                      style: TextStyle(
                        fontSize: ResponsiveAnalytics.fontSize(
                          context,
                          isSmall ? 18.0 : 28.0,
                        ),
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF1E293B),
                      ),
                    ),
                    SizedBox(height: ResponsiveAnalytics.spacing(context, 2.0)),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6.0,
                        vertical: 1.0,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.arrow_upward,
                            size: ResponsiveAnalytics.fontSize(context, 10.0),
                            color: Colors.green,
                          ),
                          SizedBox(
                            width: ResponsiveAnalytics.spacing(context, 2.0),
                          ),
                          Text(
                            '+12%',
                            style: TextStyle(
                              fontSize: ResponsiveAnalytics.fontSize(
                                context,
                                isSmall ? 9.0 : 12.0,
                              ),
                              fontWeight: FontWeight.w600,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: ResponsiveAnalytics.spacing(context, 12.0)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Margin',
                      style: TextStyle(
                        fontSize: ResponsiveAnalytics.fontSize(
                          context,
                          isSmall ? 10.0 : 14.0,
                        ),
                        color: const Color(0xFF64748B),
                      ),
                    ),
                    SizedBox(height: ResponsiveAnalytics.spacing(context, 2.0)),
                    Text(
                      '4.2%',
                      style: TextStyle(
                        fontSize: ResponsiveAnalytics.fontSize(
                          context,
                          isSmall ? 18.0 : 28.0,
                        ),
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF1E293B),
                      ),
                    ),
                    SizedBox(height: ResponsiveAnalytics.spacing(context, 2.0)),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6.0,
                        vertical: 1.0,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Text(
                        'Target: 4.0%',
                        style: TextStyle(
                          fontSize: ResponsiveAnalytics.fontSize(
                            context,
                            isSmall ? 9.0 : 11.0,
                          ),
                          fontWeight: FontWeight.w500,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: ResponsiveAnalytics.spacing(context, 12.0)),

          // Gross vs Net Bar
          Container(
            padding: EdgeInsets.all(isSmall ? 6.0 : 12.0),
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 7,
                      child: Container(
                        height: ResponsiveAnalytics.fontSize(
                          context,
                          isSmall ? 14.0 : 20.0,
                        ),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF2563EB), Color(0xFF3B82F6)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                    ),
                    SizedBox(width: ResponsiveAnalytics.spacing(context, 8.0)),
                    Text(
                      'Gross',
                      style: TextStyle(
                        fontSize: ResponsiveAnalytics.fontSize(
                          context,
                          isSmall ? 10.0 : 13.0,
                        ),
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF64748B),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: ResponsiveAnalytics.spacing(context, 6.0)),
                Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Container(
                        height: ResponsiveAnalytics.fontSize(
                          context,
                          isSmall ? 14.0 : 20.0,
                        ),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF059669), Color(0xFF34D399)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                    ),
                    SizedBox(width: ResponsiveAnalytics.spacing(context, 8.0)),
                    Text(
                      'Net',
                      style: TextStyle(
                        fontSize: ResponsiveAnalytics.fontSize(
                          context,
                          isSmall ? 10.0 : 13.0,
                        ),
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF64748B),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExportButton(BuildContext context) {
    final isSmall = ResponsiveAnalytics.isSmallScreen(context);

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {
          Get.snackbar(
            'Export Report',
            'Exporting full analytics report...',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: const Color(0xFF2563EB),
            colorText: Colors.white,
            duration: const Duration(seconds: 2),
          );
        },
        icon: Icon(
          Icons.file_download_outlined,
          size: ResponsiveAnalytics.fontSize(context, 20.0),
        ),
        label: Text(
          isSmall ? 'Export Report' : 'Export Full Report',
          style: TextStyle(
            fontSize: ResponsiveAnalytics.fontSize(
              context,
              isSmall ? 13.0 : 16.0,
            ),
            fontWeight: FontWeight.w600,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: const Color(0xFF2563EB),
          padding: EdgeInsets.symmetric(
            vertical: ResponsiveAnalytics.spacing(
              context,
              isSmall ? 10.0 : 16.0,
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

// ============================================
// REUSABLE STAT CARD - FIXED OVERFLOW
// ============================================
class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final String subtitle;
  final Color color;
  final IconData icon;
  final bool isSmall;

  const _StatCard({
    required this.title,
    required this.value,
    required this.subtitle,
    required this.color,
    required this.icon,
    this.isSmall = false,
  });

  @override
  Widget build(BuildContext context) {
    final fontSize = ResponsiveAnalytics.fontSize(
      context,
      isSmall ? 14.0 : 20.0,
    );
    final iconSize = ResponsiveAnalytics.fontSize(
      context,
      isSmall ? 14.0 : 18.0,
    );
    final labelSize = ResponsiveAnalytics.fontSize(
      context,
      isSmall ? 8.0 : 11.0,
    );
    final subtitleSize = ResponsiveAnalytics.fontSize(
      context,
      isSmall ? 7.0 : 9.0,
    );
    final padding = isSmall ? 6.0 : 12.0;
    final spacing = ResponsiveAnalytics.spacing(context, isSmall ? 2.0 : 4.0);

    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 6.0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(isSmall ? 3.0 : 6.0),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(6.0),
            ),
            child: Icon(icon, color: color, size: iconSize),
          ),
          SizedBox(height: spacing),
          Text(
            value,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
          SizedBox(height: spacing * 0.5),
          Text(
            title,
            style: TextStyle(
              fontSize: labelSize,
              color: const Color(0xFF64748B),
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: spacing * 0.5),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: subtitleSize,
              color: subtitle.contains('+')
                  ? Colors.green
                  : const Color(0xFF64748B),
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
