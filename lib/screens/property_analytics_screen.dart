import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/property_analytics_controller.dart';

class PropertyAnalyticsScreen extends StatelessWidget {
  const PropertyAnalyticsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PropertyAnalyticsController controller =
        Get.put(PropertyAnalyticsController());

    const primaryColor = Color(0xFF2FC1BE);
    const lightTealBg = Color(0xFFD8F3F1);
    const backgroundColor = Color(0xFFF7F9F9);

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
          'Property Analytics',
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
              // 1. Time Filter Tabs
              Obx(() => SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildFilterTab(
                          'This Month',
                          0,
                          controller,
                          primaryColor,
                        ),
                        const SizedBox(width: 8),
                        _buildFilterTab(
                          'Last 3 Months',
                          1,
                          controller,
                          primaryColor,
                        ),
                        const SizedBox(width: 8),
                        _buildFilterTab(
                          'Year to Date',
                          2,
                          controller,
                          primaryColor,
                        ),
                      ],
                    ),
                  )),

              const SizedBox(height: 20),

              // 2. Metrics Grid (2x2)
              Row(
                children: [
                  Expanded(
                    child: _buildMetricCard(
                      title: 'Occupancy',
                      value: '82%',
                      badgeText: '+4% vs last mo',
                      icon: Icons.home_outlined,
                      primaryColor: primaryColor,
                      lightBg: lightTealBg,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildMetricCard(
                      title: 'Yield',
                      value: '5.4%',
                      badgeText: '+0.2% vs target',
                      icon: Icons.percent,
                      primaryColor: primaryColor,
                      lightBg: lightTealBg,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _buildMetricCard(
                      title: 'Viewings',
                      value: '12',
                      badgeText: 'Total this month',
                      icon: Icons.remove_red_eye_outlined,
                      primaryColor: primaryColor,
                      lightBg: lightTealBg,
                      isBadgeGreen: false,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildMetricCard(
                      title: 'Avg. Stay',
                      value: '4.2',
                      unit: 'Nights',
                      badgeText: '+0.5',
                      icon: Icons.access_time,
                      primaryColor: primaryColor,
                      lightBg: lightTealBg,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // 3. Occupancy Trends Line Chart Card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Occupancy Trends',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              'Daily occupancy rate over selected period',
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.grey.shade500,
                              ),
                            ),
                          ],
                        ),
                        Icon(Icons.more_horiz, color: primaryColor, size: 20),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Custom Line Chart Representation
                    SizedBox(
                      height: 100,
                      width: double.infinity,
                      child: CustomPaint(
                        painter: CurvePainter(lineColor: primaryColor),
                      ),
                    ),
                    const SizedBox(height: 8),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Week 2',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey.shade500,
                          ),
                        ),
                        Text(
                          'Week 3',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey.shade500,
                          ),
                        ),
                        Text(
                          'Week 4',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // 4. Financial Breakdown Bar Chart Card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Financial Breakdown',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: lightTealBg,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.bar_chart,
                            color: primaryColor,
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        const Text(
                          '\$4,250',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Net Income',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade500,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          '+12%',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF27AE60),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Custom Bar Chart Visual
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // Gross Bar
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: 65,
                              height: 70,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Gross',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade500,
                              ),
                            ),
                          ],
                        ),
                        // Net Bar
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '\$4.2k',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: primaryColor,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Container(
                              width: 65,
                              height: 100,
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Net',
                              style: TextStyle(
                                fontSize: 12,
                                color: primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // 5. Export Full Report Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: controller.exportReport,
                  icon: const Icon(Icons.download_rounded, color: Colors.white, size: 20),
                  label: const Text(
                    'Export Full Report',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterTab(
    String title,
    int index,
    PropertyAnalyticsController controller,
    Color primaryColor,
  ) {
    bool isSelected = controller.selectedPeriodIndex.value == index;
    return GestureDetector(
      onTap: () => controller.selectedPeriodIndex.value = index,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? primaryColor : Colors.grey.shade300,
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
      ),
    );
  }

  Widget _buildMetricCard({
    required String title,
    required String value,
    String unit = '',
    required String badgeText,
    required IconData icon,
    required Color primaryColor,
    required Color lightBg,
    bool isBadgeGreen = true,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: lightBg,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: primaryColor, size: 16),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              if (unit.isNotEmpty) ...[
                const SizedBox(width: 4),
                Text(
                  unit,
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
                ),
              ],
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              if (isBadgeGreen) ...[
                const Icon(Icons.trending_up, color: Color(0xFF27AE60), size: 12),
                const SizedBox(width: 2),
              ],
              Text(
                badgeText,
                style: TextStyle(
                  fontSize: 10,
                  color: isBadgeGreen ? const Color(0xFF27AE60) : Colors.grey.shade400,
                  fontWeight: isBadgeGreen ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Custom Smooth Curved Line Painter
class CurvePainter extends CustomPainter {
  final Color lineColor;

  CurvePainter({required this.lineColor});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = lineColor
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke;

    var path = Path();
    path.moveTo(0, size.height * 0.7);
    path.cubicTo(
      size.width * 0.3,
      size.height * 0.3,
      size.width * 0.6,
      size.height * 0.1,
      size.width,
      size.height * 0.2,
    );

    canvas.drawPath(path, paint);

    // Points on the line
    var pointPaint = Paint()
      ..color = lineColor
      ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset(0, size.height * 0.7), 4, pointPaint);
    canvas.drawCircle(Offset(size.width * 0.38, size.height * 0.35), 4, pointPaint);
    canvas.drawCircle(Offset(size.width * 0.68, size.height * 0.18), 4, pointPaint);
    canvas.drawCircle(Offset(size.width, size.height * 0.2), 4, pointPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}