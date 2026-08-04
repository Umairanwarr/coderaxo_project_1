import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Screen36(),
  ));
}

class Screen36 extends StatefulWidget {
  const Screen36({super.key});

  @override
  State<Screen36> createState() => _Screen36State();
}

class _Screen36State extends State<Screen36> {
  final Color primaryColor = const Color(0xFF32C5C0);
  final Color backgroundColor = const Color(0xFFF3F9F8);

  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // Top Teal Header Bar
            _buildHeader(context),

            // Scrollable Chat Content
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                children: [
                  // Top "Chat" Pill
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.03),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: const Text(
                        'Chat',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // AI Greeting Card
                  _buildAiCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Hello! I\'m your AI travel assistant powered by advanced machine learning. I can help you with hotel recommendations, price prediction, room suggestions, and more.',
                          style: TextStyle(fontSize: 12, height: 1.4, color: Colors.black87),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'What can I help you with today?',
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black87),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),

                  // User Query Card (Alex Hales)
                  _buildUserCard(
                    name: 'Alex Hales',
                    message:
                        'Hi ! I\'m looking for hotel which is not expensive and has a good living standard and has great look my budget per night is almost \$180. Can you please recommend any hotel ?\n\nCan you also please predict the prices if yes then show a chart.',
                  ),

                  const SizedBox(height: 12),

                  // AI Response Header
                  _buildAiCard(
                    child: const Text(
                      'Based on your demand here are my top hotel recommendations:',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black87),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Hotel Recommendation Card
                  _buildHotelRecommendationCard(),

                  const SizedBox(height: 12),

                  // Price Prediction & Chart Card
                  _buildPricePredictionCard(),

                  const SizedBox(height: 16),
                ],
              ),
            ),

            // Bottom Input Section & Quick Suggestion Chips
            _buildBottomInputArea(),
          ],
        ),
      ),
    );
  }

  // Header Builder Widget
  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: primaryColor,
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.maybePop(context),
            child: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'AI Assistant',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 2),
              Text(
                'Powered by machine learning',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // AI Card Container Helper
  Widget _buildAiCard({required Widget child}) {
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
            children: [
              Icon(Icons.auto_awesome, color: primaryColor, size: 16),
              const SizedBox(width: 6),
              Text(
                'AI Assistant',
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          child,
        ],
      ),
    );
  }

  // User Card Helper Widget
  Widget _buildUserCard({required String name, required String message}) {
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
            children: [
              Icon(Icons.auto_awesome_outlined, color: primaryColor, size: 16),
              const SizedBox(width: 6),
              Text(
                name,
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            message,
            style: const TextStyle(fontSize: 12, height: 1.4, color: Colors.black87),
          ),
        ],
      ),
    );
  }

  // Hotel Card Widget (uses room_background.png)
  Widget _buildHotelRecommendationCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: primaryColor.withOpacity(0.5), width: 1.2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/images/room_background.png',
                width: 90,
                height: 70,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 90,
                    height: 70,
                    color: Colors.grey.shade300,
                    child: const Icon(Icons.hotel, color: Colors.grey),
                  );
                },
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Grand Plaza Hotel',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: const Color(0xFF4CD964),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          '99% Match',
                          style: TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 11, color: Colors.grey.shade500),
                      const SizedBox(width: 2),
                      Text(
                        'London, United Kingdom',
                        style: TextStyle(fontSize: 10, color: Colors.grey.shade500),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '\$180',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                        TextSpan(
                          text: '/night',
                          style: TextStyle(fontSize: 11, color: Colors.grey.shade500),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Price Prediction Card with Chart
  Widget _buildPricePredictionCard() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Current Price', style: TextStyle(fontSize: 10, color: Colors.grey.shade500)),
                  const SizedBox(height: 2),
                  Text(
                    '\$200',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: primaryColor),
                  ),
                ],
              ),
              const Icon(Icons.trending_down_rounded, color: Color(0xFF4CD964), size: 28),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('Best Price', style: TextStyle(fontSize: 10, color: Colors.grey.shade500)),
                  const SizedBox(height: 2),
                  const Text(
                    '\$260',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFF4CD964)),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Green Recommendation Note Banner
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFEBF8EE),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                const Icon(Icons.lightbulb_outline, size: 14, color: Color(0xFF4CD964)),
                const SizedBox(width: 6),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Book on Feb 5 to save \$39',
                        style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF2E7D32)),
                      ),
                      Text(
                        '87% confidence based on AI analysis',
                        style: TextStyle(fontSize: 9, color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Custom Line Chart Representation
          SizedBox(
            height: 120,
            width: double.infinity,
            child: CustomPaint(
              painter: ChartPainter(lineColor: primaryColor),
            ),
          ),
        ],
      ),
    );
  }

  // Bottom Input & Suggestions Helper Widget
  Widget _buildBottomInputArea() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 10, bottom: 8, left: 12, right: 12),
      child: Column(
        children: [
          // Text Input Row
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _messageController,
                  decoration: InputDecoration(
                    hintText: 'Ask about hotels, prices, rooms..',
                    hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 13),
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: primaryColor,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.send_rounded, color: Colors.white, size: 16),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // Quick Suggestion Pills
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildSuggestionPill('Recommend Hotels'),
                const SizedBox(width: 6),
                _buildSuggestionPill('Best time to book'),
                const SizedBox(width: 6),
                _buildSuggestionPill('Room suggestions'),
              ],
            ),
          ),
          const SizedBox(height: 4),
        ],
      ),
    );
  }

  Widget _buildSuggestionPill(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 10, color: Colors.black87, fontWeight: FontWeight.w500),
      ),
    );
  }
}

// Custom Painter Class for Price Trend Chart
class ChartPainter extends CustomPainter {
  final Color lineColor;

  ChartPainter({required this.lineColor});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint gridPaint = Paint()
      ..color = Colors.grey.shade200
      ..strokeWidth = 1.0;

    final TextPainter textPainter = TextPainter(
      textDirection: TextDirection.ltr,
    );

    // Draw horizontal dashed grid lines & Y labels
    final List<String> yLabels = ['340', '255', '170', '85', '0'];
    double stepY = size.height / (yLabels.length - 1);

    for (int i = 0; i < yLabels.length; i++) {
      double y = i * stepY;
      canvas.drawLine(Offset(35, y), Offset(size.width, y), gridPaint);

      textPainter.text = TextSpan(
        text: yLabels[i],
        style: TextStyle(color: Colors.grey.shade400, fontSize: 8),
      );
      textPainter.layout();
      textPainter.paint(canvas, Offset(8, y - 5));
    }

    // Chart Points (X, Y)
    final List<Offset> points = [
      Offset(45, size.height * 0.2),
      Offset(85, size.height * 0.35),
      Offset(125, size.height * 0.28),
      Offset(165, size.height * 0.45),
      Offset(205, size.height * 0.35),
      Offset(245, size.height * 0.12),
    ];

    // Draw Line
    final Paint linePaint = Paint()
      ..color = lineColor
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    final Path path = Path();
    path.moveTo(points[0].dx, points[0].dy);
    for (int i = 1; i < points.length; i++) {
      path.lineTo(points[i].dx, points[i].dy);
    }
    canvas.drawPath(path, linePaint);

    // Draw Points Dots
    final Paint dotPaint = Paint()..color = lineColor;
    for (var point in points) {
      canvas.drawCircle(point, 3.5, dotPaint);
      canvas.drawCircle(point, 1.5, Paint()..color = Colors.white);
    }

    // Draw X Axis Date Labels
    final List<String> xLabels = ['Jan 15', 'Jan 22', 'Jan 29', 'Feb 5', 'Feb 12', 'Feb 20'];
    for (int i = 0; i < xLabels.length; i++) {
      textPainter.text = TextSpan(
        text: xLabels[i],
        style: TextStyle(color: Colors.grey.shade400, fontSize: 8),
      );
      textPainter.layout();
      double x = points[i].dx - (textPainter.width / 2);
      textPainter.paint(canvas, Offset(x, size.height - 10));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}