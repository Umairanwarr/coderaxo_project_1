// lib/screens/admin/jobs_screen.dart
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

// ============================================
// RESPONSIVE HELPER CLASS
// ============================================
class ResponsiveJobs {
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
// JOBS SCREEN (IoT DIAGNOSTIC)
// ============================================
class JobsScreen extends StatefulWidget {
  const JobsScreen({super.key});

  @override
  State<JobsScreen> createState() => _JobsScreenState();
}

class _JobsScreenState extends State<JobsScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedFilter = 'All';

  @override
  Widget build(BuildContext context) {
    final isSmall = ResponsiveJobs.isSmallScreen(context);
    final padding = ResponsiveJobs.padding(context);
    final spacing = ResponsiveJobs.spacing(context, 16.0);

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: _buildAppBar(context),
      body: Column(
        children: [
          // Device Count Header
          _buildDeviceHeader(context),
          SizedBox(height: spacing),

          // Filter Chips
          _buildFilterChips(context),
          SizedBox(height: spacing),

          // Device List
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: padding.left),
              children: [
                _buildDeviceCard(
                  context,
                  icon: Icons.thermostat_outlined,
                  iconColor: Colors.red,
                  title: 'Thermostat',
                  unit: 'Unit -4B',
                  location: 'Maple Heights',
                  time: '2h ago',
                  status: 'Urgent',
                  statusColor: Colors.red,
                ),
                SizedBox(height: ResponsiveJobs.spacing(context, 12.0)),

                _buildDeviceCard(
                  context,
                  icon: Icons.lock_outlined,
                  iconColor: Colors.blue,
                  title: 'Smart Lock',
                  unit: 'Unit -4B',
                  location: 'Oak Plaza',
                  time: '5h ago',
                  status: 'Normal',
                  statusColor: Colors.green,
                ),
                SizedBox(height: ResponsiveJobs.spacing(context, 12.0)),

                _buildDeviceCard(
                  context,
                  icon: Icons.vpn_key_outlined,
                  iconColor: Colors.orange,
                  title: isSmall
                      ? 'Unit 7C - Lock'
                      : 'Unit 7C - Lock Replacement',
                  unit: '',
                  location: 'Pine Court',
                  time: '1d ago',
                  status: 'Normal',
                  statusColor: Colors.green,
                ),
                SizedBox(height: ResponsiveJobs.spacing(context, 12.0)),

                _buildDeviceCard(
                  context,
                  icon: Icons.plumbing_outlined,
                  iconColor: Colors.red,
                  title: isSmall
                      ? 'Unit 3A - Plumbing'
                      : 'Unit 3A - Plumbing Fix',
                  unit: '',
                  location: 'Cedar Towers',
                  time: '1d ago',
                  status: 'Urgent',
                  statusColor: Colors.red,
                ),
                SizedBox(height: ResponsiveJobs.spacing(context, 12.0)),

                _buildDeviceCard(
                  context,
                  icon: Icons.ac_unit_outlined,
                  iconColor: Colors.blue,
                  title: isSmall ? 'Unit 9B - AC' : 'Unit 9B - AC Repair',
                  unit: '',
                  location: 'Maple Heights',
                  time: '2d ago',
                  status: 'Normal',
                  statusColor: Colors.green,
                ),
                SizedBox(height: ResponsiveJobs.spacing(context, 20.0)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    final isSmall = ResponsiveJobs.isSmallScreen(context);
    final iconSize = ResponsiveJobs.fontSize(context, 20.0);

    return AppBar(
      backgroundColor: Color(0xFF47D7D4),
      elevation: 0,
      foregroundColor: Colors.black,
      title: Text(
        isSmall ? 'IoT' : 'IoT Diagnostic',
        style: TextStyle(
          fontSize: ResponsiveJobs.fontSize(context, isSmall ? 16.0 : 20.0),
          fontWeight: FontWeight.w600,
          color: const Color(0xFF1E293B),
        ),
      ),
      centerTitle: false,
      actions: [
        IconButton(
          icon: Icon(
            Icons.search_outlined,
            color: const Color(0xFF64748B),
            size: iconSize,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(
            Icons.filter_list_outlined,
            color: const Color(0xFF64748B),
            size: iconSize,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildDeviceHeader(BuildContext context) {
    final isSmall = ResponsiveJobs.isSmallScreen(context);
    final padding = ResponsiveJobs.padding(context);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: padding.left),
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveJobs.spacing(context, 20.0),
        vertical: ResponsiveJobs.spacing(context, 16.0),
      ),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(ResponsiveJobs.spacing(context, 10.0)),
                decoration: BoxDecoration(
                  color: const Color(0xFF2563EB).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Icon(
                  Icons.devices_outlined,
                  color: const Color(0xFF2563EB),
                  size: ResponsiveJobs.fontSize(context, isSmall ? 20.0 : 24.0),
                ),
              ),
              SizedBox(width: ResponsiveJobs.spacing(context, 12.0)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isSmall ? 'Devices' : '5 Devices',
                    style: TextStyle(
                      fontSize: ResponsiveJobs.fontSize(
                        context,
                        isSmall ? 16.0 : 20.0,
                      ),
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF1E293B),
                    ),
                  ),
                  Text(
                    isSmall ? 'Monitored' : 'Connected & Monitored',
                    style: TextStyle(
                      fontSize: ResponsiveJobs.fontSize(
                        context,
                        isSmall ? 11.0 : 13.0,
                      ),
                      color: const Color(0xFF64748B),
                    ),
                  ),
                ],
              ),
            ],
          ),
          if (!isSmall)
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 6.0,
              ),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Row(
                children: [
                  Container(
                    width: 8.0,
                    height: 8.0,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 6.0),
                  const Text(
                    'Online',
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildFilterChips(BuildContext context) {
    final isSmall = ResponsiveJobs.isSmallScreen(context);
    final List<String> filters = isSmall
        ? ['All', 'Urgent', 'Normal']
        : ['All', 'Urgent', 'Normal', 'Critical'];

    return Container(
      height: ResponsiveJobs.fontSize(context, 40.0),
      margin: EdgeInsets.symmetric(
        horizontal: ResponsiveJobs.padding(context).left,
      ),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        separatorBuilder: (context, index) =>
            SizedBox(width: ResponsiveJobs.spacing(context, 8.0)),
        itemBuilder: (context, index) {
          final filter = filters[index];
          final isSelected = _selectedFilter == filter;

          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedFilter = filter;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: ResponsiveJobs.spacing(
                  context,
                  isSmall ? 12.0 : 16.0,
                ),
                vertical: ResponsiveJobs.spacing(context, 8.0),
              ),
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFF2563EB) : Colors.white,
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(
                  color: isSelected
                      ? const Color(0xFF2563EB)
                      : Colors.grey.withOpacity(0.3),
                ),
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: const Color(0xFF2563EB).withOpacity(0.2),
                          blurRadius: 8.0,
                          offset: const Offset(0, 2),
                        ),
                      ]
                    : [],
              ),
              child: Center(
                child: Text(
                  filter,
                  style: TextStyle(
                    fontSize: ResponsiveJobs.fontSize(
                      context,
                      isSmall ? 11.0 : 13.0,
                    ),
                    fontWeight: FontWeight.w500,
                    color: isSelected ? Colors.white : const Color(0xFF64748B),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDeviceCard(
    BuildContext context, {
    required IconData icon,
    required Color iconColor,
    required String title,
    required String unit,
    required String location,
    required String time,
    required String status,
    required Color statusColor,
  }) {
    final isSmall = ResponsiveJobs.isSmallScreen(context);
    ResponsiveJobs.padding(context);

    return Container(
      padding: EdgeInsets.all(
        ResponsiveJobs.spacing(context, isSmall ? 12.0 : 16.0),
      ),
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
        children: [
          // Icon
          Container(
            padding: EdgeInsets.all(
              ResponsiveJobs.spacing(context, isSmall ? 8.0 : 12.0),
            ),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: ResponsiveJobs.fontSize(context, isSmall ? 22.0 : 28.0),
            ),
          ),
          SizedBox(
            width: ResponsiveJobs.spacing(context, isSmall ? 10.0 : 14.0),
          ),

          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: ResponsiveJobs.fontSize(
                      context,
                      isSmall ? 14.0 : 16.0,
                    ),
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF1E293B),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: ResponsiveJobs.spacing(context, 4.0)),
                if (unit.isNotEmpty) ...[
                  Row(
                    children: [
                      Icon(
                        Icons.apartment_outlined,
                        size: ResponsiveJobs.fontSize(
                          context,
                          isSmall ? 12.0 : 14.0,
                        ),
                        color: const Color(0xFF64748B),
                      ),
                      SizedBox(width: ResponsiveJobs.spacing(context, 4.0)),
                      Text(
                        unit,
                        style: TextStyle(
                          fontSize: ResponsiveJobs.fontSize(
                            context,
                            isSmall ? 11.0 : 13.0,
                          ),
                          color: const Color(0xFF64748B),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: ResponsiveJobs.fontSize(
                        context,
                        isSmall ? 12.0 : 14.0,
                      ),
                      color: const Color(0xFF64748B),
                    ),
                    SizedBox(width: ResponsiveJobs.spacing(context, 4.0)),
                    Text(
                      isSmall ? _shortenLocation(location) : location,
                      style: TextStyle(
                        fontSize: ResponsiveJobs.fontSize(
                          context,
                          isSmall ? 11.0 : 13.0,
                        ),
                        color: const Color(0xFF64748B),
                      ),
                    ),
                    SizedBox(
                      width: ResponsiveJobs.spacing(
                        context,
                        isSmall ? 8.0 : 12.0,
                      ),
                    ),
                    Icon(
                      Icons.access_time_outlined,
                      size: ResponsiveJobs.fontSize(
                        context,
                        isSmall ? 12.0 : 14.0,
                      ),
                      color: const Color(0xFF64748B),
                    ),
                    SizedBox(width: ResponsiveJobs.spacing(context, 4.0)),
                    Text(
                      time,
                      style: TextStyle(
                        fontSize: ResponsiveJobs.fontSize(
                          context,
                          isSmall ? 11.0 : 13.0,
                        ),
                        color: const Color(0xFF64748B),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Status Badge
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: ResponsiveJobs.spacing(context, isSmall ? 8.0 : 12.0),
              vertical: ResponsiveJobs.spacing(context, isSmall ? 4.0 : 6.0),
            ),
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Text(
              isSmall ? _shortenStatus(status) : status,
              style: TextStyle(
                fontSize: ResponsiveJobs.fontSize(
                  context,
                  isSmall ? 10.0 : 12.0,
                ),
                fontWeight: FontWeight.w600,
                color: statusColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _shortenLocation(String location) {
    if (location == 'Maple Heights') return 'Maple Hts';
    if (location == 'Oak Plaza') return 'Oak Plz';
    if (location == 'Pine Court') return 'Pine Ct';
    if (location == 'Cedar Towers') return 'Cedar Twr';
    return location;
  }

  String _shortenStatus(String status) {
    if (status == 'Normal') return 'Norm';
    if (status == 'Urgent') return 'Urg';
    return status;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
