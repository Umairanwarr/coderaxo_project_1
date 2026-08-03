import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/dashboard_controller.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DashboardController controller = Get.put(DashboardController());

    const primaryColor = Color(0xFF2FC1BE);
    const backgroundColor = Color(0xFFF7F9F9);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Top Bar / View Report Link
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: controller.viewReport,
                  child: const Text(
                    'View Report',
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 4),

              // 2. Total Earnings Card with 3-Stop Linear Gradient
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
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.attach_money,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.trending_up,
                                color: Colors.white,
                                size: 12,
                              ),
                              const SizedBox(width: 4),
                              Obx(() => Text(
                                    controller.earningsGrowth.value,
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
                    const SizedBox(height: 20),
                    const Text(
                      'Total Earnings',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Obx(() => Text(
                          controller.totalEarnings.value,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    const SizedBox(height: 12),
                    const Text(
                      'This month',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // 3. Status Summary Cards (Active Listings & Pending Requests)
              Row(
                children: [
                  // Active Listings Card
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey.shade200),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: const Color(0xFFE5F7F6),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.home_outlined,
                              color: primaryColor,
                              size: 20,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Active Listings',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Obx(() => Text(
                                '${controller.activeListingsCount.value}',
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(width: 14),

                  // Pending Requests Card (with action needed badge & corner accent)
                  Expanded(
                    child: Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.grey.shade200),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFFF2E5),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Icon(
                                  Icons.calendar_today_outlined,
                                  color: Color(0xFFFF9500),
                                  size: 20,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Pending\nRequests',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.w500,
                                  height: 1.2,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Row(
                                children: [
                                  Obx(() => Text(
                                        '${controller.pendingRequestsCount.value}',
                                        style: const TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87,
                                        ),
                                      )),
                                  const SizedBox(width: 8),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFFFEBD5),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: const Text(
                                      'Action\nneeded',
                                      style: TextStyle(
                                        fontSize: 9,
                                        color: Color(0xFFFF6B00),
                                        fontWeight: FontWeight.bold,
                                        height: 1.1,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // Corner Accent Background Shape
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                              color: Color(0xFFFFF2E5),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(50),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 28),

              // 4. Management Tools Title Section
              const Text(
                'Management Tools',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 16),

              // 5. Management Tools Grid (2x2 Layout)
              Row(
                children: [
                  Expanded(
                    child: _buildToolCard(
                      title: 'My Listings',
                      subtitle: 'Manage 5\nproperties',
                      icon: Icons.home_outlined,
                      iconBg: const Color(0xFFE5F7F6),
                      iconColor: primaryColor,
                      onTap: controller.openMyListings,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: _buildToolCard(
                      title: 'Earnings',
                      subtitle: 'Payouts &\nHistory',
                      icon: Icons.assignment_outlined,
                      iconBg: const Color(0xFFE5F8ED),
                      iconColor: const Color(0xFF27AE60),
                      onTap: controller.openEarnings,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 14),

              Row(
                children: [
                  Expanded(
                    child: _buildToolCard(
                      title: 'Expenses',
                      subtitle: 'Track\nmaintenance',
                      icon: Icons.receipt_long_outlined,
                      iconBg: const Color(0xFFFFECEE),
                      iconColor: const Color(0xFFFF5252),
                      onTap: controller.openExpenses,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: _buildToolCard(
                      title: 'Analytics',
                      subtitle: 'Insights &\nTrends',
                      icon: Icons.bar_chart_outlined,
                      iconBg: const Color(0xFFF3E8FF),
                      iconColor: const Color(0xFF9C27B0),
                      onTap: controller.openAnalytics,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),

      // 6. Bottom Navigation Bar
      bottomNavigationBar: _buildBottomNavigationBar(primaryColor),
    );
  }

  Widget _buildToolCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: iconBg,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: iconColor, size: 22),
            ),
            const SizedBox(height: 14),
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 11,
                color: Colors.grey.shade400,
                height: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar(Color primaryColor) {
    return Container(
      height: 65,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: const Icon(Icons.home_outlined, color: Colors.grey),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.explore_outlined, color: Colors.grey),
            onPressed: () {},
          ),
          // Active Dashboard Center Tab Button
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: primaryColor,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.grid_view, color: Colors.white, size: 20),
              ),
              Text(
                'Dashboard',
                style: TextStyle(
                  fontSize: 10,
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.chat_bubble_outline, color: Colors.grey),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.person_outline, color: Colors.grey),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}