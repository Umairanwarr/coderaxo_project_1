// lib/screens/pay_screen.dart
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class PayScreen extends StatelessWidget {
  const PayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      body: CustomScrollView(
        slivers: [
          _buildAppBar(context),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),
                  _buildLocationChip(),
                  const SizedBox(height: 20),
                  _buildPerformanceHeader(),
                  const SizedBox(height: 16),
                  _buildMonthlyRevenue(),
                  const SizedBox(height: 16),
                  _buildStatsRow(),
                  const SizedBox(height: 20),
                  _buildStaffPerformance(),
                  const SizedBox(height: 20),
                  _buildTopProperties(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ---------- App Bar ----------

  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      elevation: 0,
      toolbarHeight: 64,
      backgroundColor: const Color(0xFF2DD4BF),
      automaticallyImplyLeading: false,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF34D9C8), Color(0xFF19B6AE)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
      title: Row(
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () => Navigator.of(context).maybePop(),
            child: const Padding(
              padding: EdgeInsets.all(4),
              child: Icon(Icons.arrow_back, color: Colors.white, size: 22),
            ),
          ),
          const Expanded(
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(right: 30),
                child: Text(
                  'Payment Insights',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLocationChip() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(
              Icons.location_on_outlined,
              size: 18,
              color: Color(0xFF14B8A6),
            ),
            SizedBox(width: 6),
            Text(
              'Croatia',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1E293B),
              ),
            ),
            SizedBox(width: 4),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 18,
              color: Color(0xFF94A3B8),
            ),
          ],
        ),
      ),
    );
  }

  // ---------- Performance header ----------

  Widget _buildPerformanceHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFF2563EB).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.analytics_outlined,
              color: Color(0xFF2563EB),
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Performance',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1E293B),
                ),
              ),
              Text(
                'Analytics & payment insights',
                style: TextStyle(fontSize: 13, color: Color(0xFF64748B)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ---------- Monthly revenue (area chart) ----------

  Widget _buildMonthlyRevenue() {
    // Normalized 0-1 revenue trend across the months shown.
    const values = [0.55, 0.62, 0.78, 0.7, 1.0];
    const months = ['Feb', 'Mar', 'Apr', 'May', 'Jun'];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Monthly Revenue',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF64748B),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Text(
                '€24,580',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1E293B),
                ),
              ),
              const SizedBox(width: 12),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.arrow_upward, size: 14, color: Colors.green),
                    SizedBox(width: 2),
                    Text(
                      '+12%',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 110,
            width: double.infinity,
            child: CustomPaint(painter: _RevenueChartPainter(values: values)),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: months
                .map(
                  (m) => Text(
                    m,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF94A3B8),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  // ---------- Stats row ----------

  Widget _buildStatsRow() {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            title: 'Avg Rating',
            value: '4.8',
            subtitle: '+0.3 this month',
            icon: Icons.star_outline,
            color: Colors.amber,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildStatCard(
            title: 'Jobs Done',
            value: '142',
            subtitle: '+18 this week',
            icon: Icons.check_circle_outline,
            color: Colors.green,
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required String subtitle,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 20),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF64748B),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1E293B),
            ),
          ),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.green,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  // ---------- Staff performance ----------

  Widget _buildStaffPerformance() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Staff Performance',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1E293B),
                ),
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: const Text(
                  'View all',
                  style: TextStyle(
                    color: Color(0xFF2563EB),
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          _buildStaffItem(
            name: 'Ana M.',
            role: 'Senior Cleaner',
            percentage: '98%',
            jobs: '42 jobs',
            color: const Color(0xFFEC4899),
          ),
          _buildStaffItem(
            name: 'Marko K.',
            role: 'Cleaner',
            percentage: '94%',
            jobs: '38 jobs',
            color: const Color(0xFF3B82F6),
          ),
          _buildStaffItem(
            name: 'Ivana S.',
            role: 'Cleaner',
            percentage: '91%',
            jobs: '35 jobs',
            color: const Color(0xFF10B981),
          ),
          _buildStaffItem(
            name: 'Luka P.',
            role: 'Junior Cleaner',
            percentage: '89%',
            jobs: '27 jobs',
            color: const Color(0xFF8B5CF6),
            isLast: true,
          ),
        ],
      ),
    );
  }

  Widget _buildStaffItem({
    required String name,
    required String role,
    required String percentage,
    required String jobs,
    required Color color,
    bool isLast = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: isLast
            ? null
            : const Border(
                bottom: BorderSide(color: Color(0xFFF1F5F9), width: 1),
              ),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color.withOpacity(0.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                name[0],
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: color,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1E293B),
                  ),
                ),
                Text(
                  role,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF64748B),
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                percentage,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF14B8A6),
                ),
              ),
              Text(
                jobs,
                style: const TextStyle(fontSize: 11, color: Color(0xFF94A3B8)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ---------- Top properties (horizontal bar chart) ----------

  Widget _buildTopProperties() {
    final List<Map<String, dynamic>> properties = [
      {'name': 'Ana', 'value': 100.0},
      {'name': 'Marko', 'value': 75.0},
      {'name': 'Ivana', 'value': 50.0},
      {'name': 'Luka', 'value': 25.0},
    ];

    const labelWidth = 50.0;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Top Properties',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1E293B),
            ),
          ),
          const SizedBox(height: 16),
          ...properties.map(
            (p) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                children: [
                  SizedBox(
                    width: labelWidth,
                    child: Text(
                      p['name'],
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF475569),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Stack(
                        children: [
                          Container(height: 16, color: const Color(0xFFF1F5F9)),
                          FractionallySizedBox(
                            widthFactor: p['value'] / 100,
                            child: Container(
                              height: 16,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFF19B6AE),
                                    Color(0xFF2DD4BF),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const SizedBox(width: labelWidth),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      '0',
                      style: TextStyle(fontSize: 12, color: Color(0xFF94A3B8)),
                    ),
                    Text(
                      '25',
                      style: TextStyle(fontSize: 12, color: Color(0xFF94A3B8)),
                    ),
                    Text(
                      '50',
                      style: TextStyle(fontSize: 12, color: Color(0xFF94A3B8)),
                    ),
                    Text(
                      '75',
                      style: TextStyle(fontSize: 12, color: Color(0xFF94A3B8)),
                    ),
                    Text(
                      '100',
                      style: TextStyle(fontSize: 12, color: Color(0xFF94A3B8)),
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

  // ---------- Shared ----------

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.04),
          blurRadius: 8,
          offset: const Offset(0, 2),
        ),
      ],
    );
  }
}

/// Paints a smooth teal area/line chart for the monthly revenue trend.
class _RevenueChartPainter extends CustomPainter {
  final List<double> values; // normalized 0..1

  _RevenueChartPainter({required this.values});

  @override
  void paint(Canvas canvas, Size size) {
    if (values.isEmpty) return;

    final points = <Offset>[];
    final stepX = size.width / (values.length - 1);
    for (int i = 0; i < values.length; i++) {
      final x = stepX * i;
      final y = size.height - (values[i] * size.height * 0.85) - 4;
      points.add(Offset(x, y));
    }

    // Smooth path through points using quadratic bezier midpoints.
    final linePath = Path()..moveTo(points.first.dx, points.first.dy);
    for (int i = 0; i < points.length - 1; i++) {
      final p0 = points[i];
      final p1 = points[i + 1];
      final mid = Offset((p0.dx + p1.dx) / 2, (p0.dy + p1.dy) / 2);
      linePath.quadraticBezierTo(p0.dx, p0.dy, mid.dx, mid.dy);
    }
    linePath.lineTo(points.last.dx, points.last.dy);

    final fillPath = Path.from(linePath)
      ..lineTo(points.last.dx, size.height)
      ..lineTo(points.first.dx, size.height)
      ..close();

    final fillPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color(0xFF2DD4BF).withOpacity(0.28),
          const Color(0xFF2DD4BF).withOpacity(0.0),
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    canvas.drawPath(fillPath, fillPaint);

    final linePaint = Paint()
      ..color = const Color(0xFF14B8A6)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round;
    canvas.drawPath(linePath, linePaint);

    // Highlight the last point (current month).
    final dotOuter = Paint()..color = Colors.white;
    final dotInner = Paint()..color = const Color(0xFF14B8A6);
    canvas.drawCircle(points.last, 6, dotOuter);
    canvas.drawCircle(points.last, 4, dotInner);
  }

  @override
  bool shouldRepaint(covariant _RevenueChartPainter oldDelegate) {
    return oldDelegate.values != values;
  }
}
