// lib/screens/qc_screen.dart
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class QCScreen extends StatelessWidget {
  const QCScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Color(0xFF47D7D4),
        elevation: 0,
        foregroundColor: Colors.black,
        title: const Text(
          'Quality Control',
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
            // Subtitle
            const Text(
              'Review and approve completed jobs',
              style: TextStyle(fontSize: 14, color: Color(0xFF64748B)),
            ),
            const SizedBox(height: 20),

            // Status Tabs
            _buildStatusTabs(),
            const SizedBox(height: 24),

            // Job Cards
            _buildJobCard(
              title: 'Villa Sunset',
              status: 'Awaiting Review',
              statusColor: Colors.orange,
              person: 'Ana M.',
              task: 'Checkout clean',
              time: 'Completed 35 min ago',
              badge: '+3',
              showProgress: false,
              progressValue: 0.0,
            ),
            const SizedBox(height: 12),

            _buildJobCard(
              title: 'Apartment 204',
              status: 'In Progress',
              statusColor: Colors.blue,
              person: 'Marko K.',
              task: 'Deep clean',
              time: 'Started 1 hr ago',
              badge: '',
              showProgress: true,
              progressValue: 0.65,
            ),
            const SizedBox(height: 12),

            _buildJobCard(
              title: 'Seaside Villa',
              status: 'Awaiting Review',
              statusColor: Colors.orange,
              person: 'Ivana S.',
              task: 'Standard turnover',
              time: 'Completed 2 hrs ago',
              badge: '',
              showProgress: true,
              progressValue: 0.65,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusTabs() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
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
          _buildTabItem(label: 'Pending (5)', isActive: true),
          _buildTabItem(label: 'Reviewed', isActive: false),
          _buildTabItem(label: 'Flagged', isActive: false),
        ],
      ),
    );
  }

  Widget _buildTabItem({required String label, required bool isActive}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF2563EB) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
              color: isActive ? Colors.white : const Color(0xFF64748B),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildJobCard({
    required String title,
    required String status,
    required Color statusColor,
    required String person,
    required String task,
    required String time,
    required String badge,
    required bool showProgress,
    required double progressValue,
  }) {
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1E293B),
                ),
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: statusColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      status,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: statusColor,
                      ),
                    ),
                  ),
                  if (badge.isNotEmpty) ...[
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        badge,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Task & Person
          Row(
            children: [
              Icon(
                Icons.person_outline,
                size: 16,
                color: const Color(0xFF64748B),
              ),
              const SizedBox(width: 6),
              Text(
                person,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF1E293B),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 12),
              Icon(
                Icons.work_outline,
                size: 16,
                color: const Color(0xFF64748B),
              ),
              const SizedBox(width: 6),
              Text(
                task,
                style: const TextStyle(fontSize: 14, color: Color(0xFF64748B)),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Time
          Row(
            children: [
              Icon(
                Icons.access_time_outlined,
                size: 16,
                color: const Color(0xFF64748B),
              ),
              const SizedBox(width: 6),
              Text(
                time,
                style: const TextStyle(fontSize: 13, color: Color(0xFF64748B)),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Progress Bar (if shown)
          if (showProgress) ...[
            Row(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: LinearProgressIndicator(
                      value: progressValue,
                      minHeight: 8,
                      backgroundColor: Colors.grey.withOpacity(0.2),
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        Color(0xFF2563EB),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  '${(progressValue * 100).toInt()}%',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1E293B),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
          ],

          // Action Buttons
          if (status == 'Awaiting Review') ...[
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2563EB),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Approve',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0xFFEF4444),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      side: const BorderSide(
                        color: Color(0xFFEF4444),
                        width: 1.5,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Request Redo',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],

          // In Progress Status
          if (status == 'In Progress') ...[
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFFEFF6FF),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Text(
                  'In Progress',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2563EB),
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
