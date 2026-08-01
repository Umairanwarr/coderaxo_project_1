// lib/screens/admin/home_screen.dart
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

// ============================================
// RESPONSIVE HELPER CLASS
// ============================================
class ResponsiveHome {
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
// HOME SCREEN
// ============================================
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isSmall = ResponsiveHome.isSmallScreen(context);
    final padding = ResponsiveHome.padding(context);
    final spacing = ResponsiveHome.spacing(context, 16.0);

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        padding: padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Admin Dashboard Title
            Text(
              isSmall ? 'Dashboard' : 'Admin Dashboard',
              style: TextStyle(
                fontSize: ResponsiveHome.fontSize(
                  context,
                  isSmall ? 22.0 : 28.0,
                ),
                fontWeight: FontWeight.w700,
                color: const Color(0xFF1E293B),
              ),
            ),
            SizedBox(height: spacing + 4.0),

            // Search Bar
            _buildSearchBar(context),
            SizedBox(height: spacing + 8.0),

            // Stats Grid
            _buildStatsGrid(context),
            SizedBox(height: spacing + 8.0),

            // Job Assignment & Earnings Row
            _buildJobAndEarningsRow(context),
            SizedBox(height: spacing + 8.0),

            // Today's Tasks
            _buildTodayTasks(context),
            SizedBox(height: spacing),

            // IoT Diagnostic
            _buildIoTCard(context),
            SizedBox(height: spacing),

            // Job Assignment Card
            _buildJobAssignmentCard(context),
            SizedBox(height: spacing),

            // Today's Overview
            _buildTodayOverview(context),
            SizedBox(height: ResponsiveHome.spacing(context, 20.0)),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    final isSmall = ResponsiveHome.isSmallScreen(context);
    final iconSize = ResponsiveHome.fontSize(context, 20.0);

    return AppBar(
      backgroundColor: Color(0xFF47D7D4),
      elevation: 0,
      foregroundColor: Colors.black,
      title: Text(
        'Welcome back',
        style: TextStyle(
          fontSize: ResponsiveHome.fontSize(context, isSmall ? 16.0 : 18.0),
          fontWeight: FontWeight.w600,
          color: const Color(0xFF1E293B),
        ),
      ),
      centerTitle: false,
      actions: [
        IconButton(
          icon: Icon(
            Icons.notifications_outlined,
            color: const Color(0xFF64748B),
            size: iconSize,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    final isSmall = ResponsiveHome.isSmallScreen(context);
    ResponsiveHome.fontSize(context, 14.0);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveHome.spacing(context, 16.0),
      ),
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
        children: [
          Icon(
            Icons.search,
            color: const Color(0xFF64748B),
            size: ResponsiveHome.fontSize(context, 20.0),
          ),
          SizedBox(width: ResponsiveHome.spacing(context, 12.0)),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: isSmall
                    ? 'Search...'
                    : 'Ask anything... Discover a bounty, chat, or payment',
                border: InputBorder.none,
                hintStyle: TextStyle(
                  color: const Color(0xFF64748B),
                  fontSize: ResponsiveHome.fontSize(
                    context,
                    isSmall ? 12.0 : 14.0,
                  ),
                ),
              ),
              onChanged: (value) {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsGrid(BuildContext context) {
    final isSmall = ResponsiveHome.isSmallScreen(context);
    final spacing = ResponsiveHome.spacing(context, 12.0);
    final crossAxisCount = isSmall ? 2 : 3;
    final childAspectRatio = isSmall ? 0.95 : 1.1;

    return GridView.count(
      crossAxisCount: crossAxisCount,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: spacing,
      mainAxisSpacing: spacing,
      childAspectRatio: childAspectRatio,
      children: [
        _StatCard(
          title: isSmall ? 'Jobs' : 'Jobs Available',
          value: '12',
          color: Colors.blue,
          icon: Icons.work_outline,
          isSmall: isSmall,
        ),
        _StatCard(
          title: 'Pending',
          value: '5',
          color: Colors.orange,
          icon: Icons.pending_outlined,
          isSmall: isSmall,
        ),
        _StatCard(
          title: isSmall ? 'Complete' : 'Completed',
          value: '48',
          color: Colors.green,
          icon: Icons.check_circle_outline,
          isSmall: isSmall,
        ),
        _StatCard(
          title: isSmall ? 'Reviews' : 'Pending Reviews',
          value: '3',
          color: Colors.purple,
          icon: Icons.preview_outlined,
          isSmall: isSmall,
        ),
      ],
    );
  }

  Widget _buildJobAndEarningsRow(BuildContext context) {
    final isSmall = ResponsiveHome.isSmallScreen(context);
    final spacing = ResponsiveHome.spacing(context, 12.0);

    return Row(
      children: [
        Expanded(
          child: _ActionCard(
            title: isSmall ? 'Job Assign' : 'Job Assignment',
            subtitle: isSmall ? '\$1.5M' : '\$1.5 Million Awarded',
            badge: 'Pending',
            icon: Icons.assignment_turned_in_outlined,
            color: Colors.green,
            isSmall: isSmall,
            onTap: () {},
          ),
        ),
        SizedBox(width: spacing),
        Expanded(
          child: _ActionCard(
            title: 'Earnings',
            subtitle: isSmall ? '\$14M' : '\$14,000,000',
            badge: '',
            icon: Icons.attach_money,
            color: Colors.amber,
            isSmall: isSmall,
            onTap: () {},
          ),
        ),
      ],
    );
  }

  Widget _buildTodayTasks(BuildContext context) {
    final isSmall = ResponsiveHome.isSmallScreen(context);
    ResponsiveHome.fontSize(context, 18.0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Today's Tasks",
              style: TextStyle(
                fontSize: ResponsiveHome.fontSize(
                  context,
                  isSmall ? 16.0 : 18.0,
                ),
                fontWeight: FontWeight.w600,
                color: const Color(0xFF1E293B),
              ),
            ),
            Text(
              'See all',
              style: TextStyle(
                color: const Color(0xFF2563EB),
                fontWeight: FontWeight.w500,
                fontSize: ResponsiveHome.fontSize(
                  context,
                  isSmall ? 12.0 : 14.0,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: ResponsiveHome.spacing(context, 12.0)),
        _TaskCard(
          title: 'Villa Sunset',
          subtitle: isSmall ? 'Checkout: 4 Jan' : 'Checkout date: 4 Jan M.',
          dueTime: 'Tue 2:00 PM',
          isUrgent: true,
          isSmall: isSmall,
        ),
        SizedBox(height: ResponsiveHome.spacing(context, 8.0)),
        _TaskCard(
          title: 'Villa Sunset',
          subtitle: isSmall ? 'Checkout: 4 Jan' : 'Checkout date: 4 Jan M.',
          dueTime: 'Tue 2:00 PM',
          isUrgent: true,
          isSmall: isSmall,
        ),
        SizedBox(height: ResponsiveHome.spacing(context, 8.0)),
        _TaskCard(
          title: 'Villa Sunset',
          subtitle: isSmall ? 'Checkout: 4 Jan' : 'Checkout date: 4 Jan M.',
          dueTime: 'Tue 2:00 PM',
          isUrgent: false,
          isSmall: isSmall,
        ),
      ],
    );
  }

  Widget _buildIoTCard(BuildContext context) {
    final isSmall = ResponsiveHome.isSmallScreen(context);

    return _ActionCard(
      title: 'IoT Diagnostic',
      subtitle: isSmall ? 'Connected device' : 'Connected device',
      badge: '2 days',
      icon: Icons.devices_outlined,
      color: Colors.deepPurple,
      isSmall: isSmall,
      onTap: () {},
    );
  }

  Widget _buildJobAssignmentCard(BuildContext context) {
    final isSmall = ResponsiveHome.isSmallScreen(context);

    return _ActionCard(
      title: 'Job Assignment',
      subtitle: isSmall ? 'AI & Manual' : 'AI & Manual Assign',
      badge: '',
      icon: Icons.person_add_alt_1_outlined,
      color: Colors.blue,
      isSmall: isSmall,
      onTap: () {},
    );
  }

  Widget _buildTodayOverview(BuildContext context) {
    final isSmall = ResponsiveHome.isSmallScreen(context);

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
          Text(
            "Today's Overview",
            style: TextStyle(
              fontSize: ResponsiveHome.fontSize(context, isSmall ? 16.0 : 18.0),
              fontWeight: FontWeight.w600,
              color: const Color(0xFF1E293B),
            ),
          ),
          SizedBox(height: ResponsiveHome.spacing(context, 16.0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _OverviewStat(
                label: isSmall ? 'Completed' : 'Jobs Completed',
                value: '0',
                isSmall: isSmall,
              ),
              _OverviewStat(
                label: isSmall ? 'Closed' : 'Jobs Closed',
                value: '12',
                isSmall: isSmall,
              ),
              _OverviewStat(
                label: isSmall ? 'Avg. Res.' : 'Avg. Resolution',
                value: '4.2 hrs',
                isSmall: isSmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ============================================
// REUSABLE COMPONENTS
// ============================================

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;
  final IconData icon;
  final bool isSmall;

  const _StatCard({
    required this.title,
    required this.value,
    required this.color,
    required this.icon,
    this.isSmall = false,
  });

  @override
  Widget build(BuildContext context) {
    ResponsiveHome.fontSize(context, 20.0);
    final iconSize = ResponsiveHome.fontSize(context, isSmall ? 22.0 : 28.0);
    final labelSize = ResponsiveHome.fontSize(context, isSmall ? 10.0 : 11.0);
    final padding = isSmall ? 8.0 : 12.0;

    return Container(
      padding: EdgeInsets.all(padding),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: iconSize),
          SizedBox(height: ResponsiveHome.spacing(context, 4.0)),
          Text(
            value,
            style: TextStyle(
              fontSize: ResponsiveHome.fontSize(context, isSmall ? 18.0 : 20.0),
              fontWeight: FontWeight.w700,
              color: const Color(0xFF1E293B),
            ),
          ),
          SizedBox(height: ResponsiveHome.spacing(context, 2.0)),
          Text(
            title,
            style: TextStyle(
              fontSize: labelSize,
              color: const Color(0xFF64748B),
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _ActionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String badge;
  final IconData icon;
  final Color color;
  final bool isSmall;
  final VoidCallback onTap;

  const _ActionCard({
    required this.title,
    required this.subtitle,
    required this.badge,
    required this.icon,
    required this.color,
    required this.isSmall,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    ResponsiveHome.fontSize(context, 14.0);
    final iconSize = ResponsiveHome.fontSize(context, isSmall ? 20.0 : 24.0);
    final padding = isSmall ? 12.0 : 16.0;

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
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(icon, color: color, size: iconSize),
                if (badge.isNotEmpty)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 4.0,
                    ),
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Text(
                      badge,
                      style: TextStyle(
                        color: color,
                        fontSize: ResponsiveHome.fontSize(
                          context,
                          isSmall ? 9.0 : 10.0,
                        ),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(height: ResponsiveHome.spacing(context, 12.0)),
            Text(
              title,
              style: TextStyle(
                fontSize: ResponsiveHome.fontSize(
                  context,
                  isSmall ? 13.0 : 14.0,
                ),
                fontWeight: FontWeight.w600,
                color: const Color(0xFF1E293B),
              ),
            ),
            SizedBox(height: ResponsiveHome.spacing(context, 2.0)),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: ResponsiveHome.fontSize(
                  context,
                  isSmall ? 11.0 : 12.0,
                ),
                color: const Color(0xFF64748B),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TaskCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String dueTime;
  final bool isUrgent;
  final bool isSmall;

  const _TaskCard({
    required this.title,
    required this.subtitle,
    required this.dueTime,
    required this.isUrgent,
    this.isSmall = false,
  });

  @override
  Widget build(BuildContext context) {
    final padding = isSmall ? 10.0 : 14.0;
    ResponsiveHome.fontSize(context, 14.0);

    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: isUrgent
              ? Colors.red.withOpacity(0.2)
              : Colors.grey.withOpacity(0.1),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 4.0,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 4.0,
            height: isSmall ? 30.0 : 40.0,
            decoration: BoxDecoration(
              color: isUrgent ? Colors.red : const Color(0xFF2563EB),
              borderRadius: BorderRadius.circular(2.0),
            ),
          ),
          SizedBox(width: ResponsiveHome.spacing(context, 12.0)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: ResponsiveHome.fontSize(
                      context,
                      isSmall ? 13.0 : 14.0,
                    ),
                    color: const Color(0xFF1E293B),
                  ),
                ),
                SizedBox(height: ResponsiveHome.spacing(context, 2.0)),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: ResponsiveHome.fontSize(
                      context,
                      isSmall ? 11.0 : 12.0,
                    ),
                    color: const Color(0xFF64748B),
                  ),
                ),
                if (dueTime.isNotEmpty)
                  Text(
                    dueTime,
                    style: TextStyle(
                      fontSize: ResponsiveHome.fontSize(
                        context,
                        isSmall ? 10.0 : 11.0,
                      ),
                      color: const Color(0xFF64748B),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: ResponsiveHome.spacing(context, isSmall ? 8.0 : 12.0),
              vertical: ResponsiveHome.spacing(context, isSmall ? 4.0 : 6.0),
            ),
            decoration: BoxDecoration(
              color: const Color(0xFF2563EB),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Text(
              'Login',
              style: TextStyle(
                color: Colors.white,
                fontSize: ResponsiveHome.fontSize(
                  context,
                  isSmall ? 10.0 : 12.0,
                ),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _OverviewStat extends StatelessWidget {
  final String label;
  final String value;
  final bool isSmall;

  const _OverviewStat({
    required this.label,
    required this.value,
    this.isSmall = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: ResponsiveHome.fontSize(context, isSmall ? 18.0 : 22.0),
            fontWeight: FontWeight.w700,
            color: const Color(0xFF1E293B),
          ),
        ),
        SizedBox(height: ResponsiveHome.spacing(context, 2.0)),
        Text(
          label,
          style: TextStyle(
            fontSize: ResponsiveHome.fontSize(context, isSmall ? 10.0 : 12.0),
            color: const Color(0xFF64748B),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
