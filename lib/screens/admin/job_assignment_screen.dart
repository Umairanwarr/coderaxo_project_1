// lib/screens/job_assignment_screen.dart
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class JobAssignmentScreen extends StatefulWidget {
  const JobAssignmentScreen({super.key});

  @override
  State<JobAssignmentScreen> createState() => _JobAssignmentScreenState();
}

class _JobAssignmentScreenState extends State<JobAssignmentScreen> {
  // Track expanded state for each job
  final Map<int, bool> _expandedStates = {0: false, 1: false, 2: false};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        title: const Text(
          'Job Assignment',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1E293B),
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.search_outlined, color: Color(0xFF64748B)),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.filter_list_outlined,
              color: Color(0xFF64748B),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with count
            _buildHeader(),
            const SizedBox(height: 20),

            // Job Cards
            _buildJobCard(
              index: 0,
              unit: 'Unit 4B - Leak Repair',
              priority: 'Urgent',
              priorityColor: Colors.red,
              location: 'Maple Heights',
              time: '2h ago',
              techName: 'Mike R.',
              techRole: 'Plumbing expert',
              techDistance: '0.5mi away',
              matchPercentage: '95%',
            ),
            const SizedBox(height: 16),

            _buildJobCard(
              index: 1,
              unit: 'Unit 12A - HVAC Maintenance',
              priority: 'Normal',
              priorityColor: Colors.blue,
              location: 'Oak Plaza',
              time: '5h ago',
              techName: 'Sarah L.',
              techRole: 'HVAC certified',
              techDistance: 'available now',
              matchPercentage: '88%',
            ),
            const SizedBox(height: 16),

            _buildJobCard(
              index: 2,
              unit: 'Unit 7C - Lock Replacement',
              priority: 'Normal',
              priorityColor: Colors.blue,
              location: 'Pine Court',
              time: '1d ago',
              techName: 'Tom K.',
              techRole: 'General maintenance',
              techDistance: 'nearby',
              matchPercentage: '82%',
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFF2563EB).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.assignment_outlined,
              color: Color(0xFF2563EB),
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Job Assignment',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1E293B),
                ),
              ),
              Text(
                '3 jobs need assignment',
                style: TextStyle(fontSize: 13, color: Color(0xFF64748B)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildJobCard({
    required int index,
    required String unit,
    required String priority,
    required Color priorityColor,
    required String location,
    required String time,
    required String techName,
    required String techRole,
    required String techDistance,
    required String matchPercentage,
  }) {
    final isExpanded = _expandedStates[index] ?? false;

    return GestureDetector(
      onTap: () {
        setState(() {
          _expandedStates[index] = !isExpanded;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    unit,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1E293B),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: priorityColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    priority,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: priorityColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Location & Time
            Row(
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  size: 16,
                  color: Color(0xFF64748B),
                ),
                const SizedBox(width: 4),
                Text(
                  location,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF64748B),
                  ),
                ),
                const SizedBox(width: 16),
                const Icon(
                  Icons.access_time_outlined,
                  size: 16,
                  color: Color(0xFF64748B),
                ),
                const SizedBox(width: 4),
                Text(
                  time,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF64748B),
                  ),
                ),
                const Spacer(),
                // Expand/Collapse Icon
                Icon(
                  isExpanded
                      ? Icons.keyboard_arrow_up_outlined
                      : Icons.keyboard_arrow_down_outlined,
                  color: const Color(0xFF64748B),
                  size: 20,
                ),
              ],
            ),

            // Expanded Content - AI Recommendation
            if (isExpanded) ...[
              const SizedBox(height: 16),

              // Divider
              Container(height: 1, color: Colors.grey.withOpacity(0.2)),
              const SizedBox(height: 16),

              // AI Recommendation Label
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF2563EB).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.auto_awesome_outlined,
                          size: 14,
                          color: Color(0xFF2563EB),
                        ),
                        SizedBox(width: 4),
                        Text(
                          'AI Recommendation',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF2563EB),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Tech Info Row
              Row(
                children: [
                  // Tech Avatar
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          _getAvatarColor(techName).withOpacity(0.2),
                          _getAvatarColor(techName).withOpacity(0.1),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        techName.split(' ').map((e) => e[0]).join(''),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: _getAvatarColor(techName),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),

                  // Tech Details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          techName,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1E293B),
                          ),
                        ),
                        Text(
                          '$techRole, $techDistance',
                          style: const TextStyle(
                            fontSize: 13,
                            color: Color(0xFF64748B),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Match Percentage & Assign Button
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        matchPercentage,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF1E293B),
                        ),
                      ),
                      const SizedBox(height: 4),
                      ElevatedButton(
                        onPressed: () {
                          _showAssignDialog(unit, techName);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2563EB),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 6,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: const Text(
                          'Assign',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  Color _getAvatarColor(String name) {
    final colors = [
      const Color(0xFF2563EB), // Blue
      const Color(0xFF7C3AED), // Purple
      const Color(0xFF059669), // Green
      const Color(0xFFD97706), // Amber
      const Color(0xFFDC2626), // Red
      const Color(0xFF0891B2), // Cyan
    ];
    final index = name.hashCode % colors.length;
    return colors[index];
  }

  void _showAssignDialog(String unit, String techName) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Text(
            'Assign Job',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Assign $unit to $techName?',
                style: const TextStyle(fontSize: 14, color: Color(0xFF1E293B)),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFEFF6FF),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      size: 16,
                      color: Color(0xFF2563EB),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'This action will assign the job to the selected technician.',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF64748B),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              style: TextButton.styleFrom(
                foregroundColor: const Color(0xFF64748B),
              ),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                _showSuccessSnackbar(unit, techName);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2563EB),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Confirm Assign'),
            ),
          ],
        );
      },
    );
  }

  void _showSuccessSnackbar(String unit, String techName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.check_circle, color: Colors.white, size: 20),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                'Assigned $unit to $techName',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(16),
      ),
    );
  }
}
