import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Screen40(),
  ));
}

class Screen40 extends StatefulWidget {
  const Screen40({super.key});

  @override
  State<Screen40> createState() => _Screen40State();
}

class _Screen40State extends State<Screen40> {
  final Color primaryColor = const Color(0xFF32C5C0);
  final Color backgroundColor = const Color(0xFFF3F9F8);

  int _currentImageIndex = 0;
  final PageController _pageController = PageController();

  final List<String> _amenities = [
    'Wifi',
    'Parking',
    'Washer',
    'Gym',
    'Balcony',
    'Air Conditioning',
    'Pool',
    'Heating',
    'Dryer',
    'Elevator'
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 1. Top Image Carousel Header
                  _buildImageCarousel(),

                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 2. Title & Rating Row
                        _buildTitleHeader(),

                        const SizedBox(height: 16),

                        // 3. AR Experience Banner
                        _buildArBanner(),

                        const SizedBox(height: 20),

                        // 4. Property Features
                        _buildSectionTitle('Property Features'),
                        const SizedBox(height: 12),
                        _buildPropertyFeatures(),

                        const SizedBox(height: 20),

                        // 5. Amenities
                        _buildSectionTitle('Amenities'),
                        const SizedBox(height: 12),
                        _buildAmenitiesChips(),

                        const SizedBox(height: 20),

                        // 6. AI Investment Analysis Card
                        _buildAiAnalysisCard(),

                        const SizedBox(height: 20),

                        // 7. About Section
                        _buildSectionTitle('About'),
                        const SizedBox(height: 8),
                        Text(
                          'Stunning modern villa in the heart of Dubai Marina. This luxurious property features contemporary design, high-end finishes, and breathtaking views of the marina. Perfect for investors looking for high-yield opportunities in prime locations.',
                          style: TextStyle(
                            fontSize: 12,
                            height: 1.5,
                            color: Colors.grey.shade700,
                          ),
                        ),

                        const SizedBox(height: 20),

                        // 8. Neighborhood Insights
                        _buildSectionTitle('Neighborhood Insights'),
                        const SizedBox(height: 12),
                        _buildNeighborhoodCard(),

                        const SizedBox(height: 20),

                        // 9. Reviews Section
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildSectionTitle('Reviews'),
                            Text(
                              'See All',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: primaryColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        _buildReviewCard('AH', 'Alex Hales', '2 days ago', '4.9'),
                        const SizedBox(height: 10),
                        _buildReviewCard('AH', 'Alex Hales', '2 days ago', '5.0'),

                        const SizedBox(height: 20),

                        // 10. Listed By Agent Section
                        _buildSectionTitle('Listed By'),
                        const SizedBox(height: 12),
                        _buildListedByCard(),

                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Bottom Action Bar (Price & Schedule Visit Button)
          _buildBottomBar(),
        ],
      ),
    );
  }

  // Top Image Slider Helper
  Widget _buildImageCarousel() {
    return Stack(
      children: [
        SizedBox(
          height: 250,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _currentImageIndex = index);
            },
            itemCount: 5,
            itemBuilder: (context, index) {
              return Image.asset(
                'assets/images/villa1.png',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey.shade300,
                    child: const Icon(Icons.image, size: 50, color: Colors.grey),
                  );
                },
              );
            },
          ),
        ),

        // Navigation Arrows
        Positioned.fill(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    if (_currentImageIndex > 0) {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
                ),
                IconButton(
                  onPressed: () {
                    if (_currentImageIndex < 4) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  icon: const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 20),
                ),
              ],
            ),
          ),
        ),

        // Top Actions (Back, Share, Heart)
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 18,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(Icons.arrow_back, color: Colors.black, size: 18),
                    onPressed: () => Navigator.maybePop(context),
                  ),
                ),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 18,
                      child: const Icon(Icons.share_outlined, color: Colors.black, size: 18),
                    ),
                    const SizedBox(width: 8),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 18,
                      child: const Icon(Icons.favorite_border, color: Colors.black, size: 18),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        // Dots Indicator
        Positioned(
          bottom: 12,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              5,
              (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 3),
                width: _currentImageIndex == index ? 8 : 6,
                height: _currentImageIndex == index ? 8 : 6,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentImageIndex == index ? Colors.white : Colors.white54,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Header Title Widget
  Widget _buildTitleHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Luxury Villa',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Text(
                  'Superb',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
                Text(
                  ' 120 reviews · ',
                  style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
                ),
                Icon(Icons.location_on_outlined, size: 12, color: Colors.grey.shade600),
                Text(
                  ' Dubai Marina',
                  style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
                ),
              ],
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFFE8F7F6),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: const [
              Icon(Icons.star_rounded, color: Colors.amber, size: 16),
              SizedBox(width: 4),
              Text(
                '4.8',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // AR Experience Banner Helper
  Widget _buildArBanner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F7F6),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: primaryColor.withOpacity(0.3), width: 1),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.view_in_ar, color: Colors.white, size: 20),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Experience in AR',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Explore the property in augmented reality',
                    style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            height: 36,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'Start Tour',
                style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Property Features Helper Grid
  Widget _buildPropertyFeatures() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildFeatureBox(Icons.king_bed_outlined, '3 Bedrooms'),
        _buildFeatureBox(Icons.bathtub_outlined, '2 Bathrooms'),
        _buildFeatureBox(Icons.aspect_ratio_rounded, '2500 sqft'),
        _buildFeatureBox(Icons.apartment_rounded, 'Villa'),
      ],
    );
  }

  Widget _buildFeatureBox(IconData icon, String title) {
    return Container(
      width: 75,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F7F6),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(icon, color: primaryColor, size: 22),
          const SizedBox(height: 6),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 10, color: Colors.grey.shade700, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  // Amenities Wrap Chips
  Widget _buildAmenitiesChips() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: _amenities.map((item) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            item,
            style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w500),
          ),
        );
      }).toList(),
    );
  }

  // AI Investment Analysis Card
  Widget _buildAiAnalysisCard() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFEBF7ED),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  color: Color(0xFF4CAF50),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.auto_awesome, color: Colors.white, size: 14),
              ),
              const SizedBox(width: 8),
              const Text(
                'AI Investment Analysis',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            'Based on market trends and location data',
            style: TextStyle(fontSize: 10, color: Colors.grey.shade600),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Projected ROI', style: TextStyle(fontSize: 10, color: Colors.grey.shade600)),
                  const SizedBox(height: 2),
                  const Text(
                    '+8.5%',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF4CAF50)),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Price Trend', style: TextStyle(fontSize: 10, color: Colors.grey.shade600)),
                  const SizedBox(height: 2),
                  const Text(
                    '↑ 6% YoY',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF4CAF50)),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Neighborhood Card
  Widget _buildNeighborhoodCard() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: primaryColor.withOpacity(0.3), width: 1),
      ),
      child: Column(
        children: [
          _buildInsightRow('Schools', '4.5/5'),
          const SizedBox(height: 8),
          _buildInsightRow('Transportation', '4.9/5'),
          const SizedBox(height: 8),
          _buildInsightRow('Shopping', '4.7/5'),
        ],
      ),
    );
  }

  Widget _buildInsightRow(String label, String score) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.black87)),
        Row(
          children: [
            const Icon(Icons.star_rounded, color: Colors.amber, size: 14),
            const SizedBox(width: 4),
            Text(score, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }

  // Review Card Helper
  Widget _buildReviewCard(String initials, String name, String time, String rating) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: primaryColor.withOpacity(0.3), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor: primaryColor.withOpacity(0.2),
                child: Text(initials, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black87)),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                    Text(time, style: TextStyle(fontSize: 9, color: Colors.grey.shade500)),
                  ],
                ),
              ),
              Row(
                children: [
                  const Icon(Icons.star_rounded, color: Colors.amber, size: 14),
                  const SizedBox(width: 2),
                  Text(rating, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Absolutely amazing experience! The staff was incredibly friendly and the rooms were spotless.',
            style: TextStyle(fontSize: 11, color: Colors.grey.shade700, height: 1.3),
          ),
        ],
      ),
    );
  }

  // Listed By Card Helper
  Widget _buildListedByCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: primaryColor.withOpacity(0.3), width: 1),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: primaryColor.withOpacity(0.2),
            child: const Text('RE', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black87)),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text('Real Estate', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                    const SizedBox(width: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: const Color(0xFF4CD964),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text('Verified', style: TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Row(
                  children: const [
                    Icon(Icons.star_rounded, color: Colors.amber, size: 12),
                    SizedBox(width: 2),
                    Text('4.9 (127 reviews)', style: TextStyle(fontSize: 10, color: Colors.grey)),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: const [
                Icon(Icons.chat_bubble_outline_rounded, size: 14, color: Colors.black87),
                SizedBox(width: 4),
                Text('Contact', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Bottom Action Bar
  Widget _buildBottomBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, -2)),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Price', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.black87)),
                Text(
                  '\$1.8 M',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: primaryColor),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                elevation: 0,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Row(
                children: const [
                  Icon(Icons.calendar_month_outlined, color: Colors.white, size: 16),
                  SizedBox(width: 6),
                  Text(
                    'Schedule Visit',
                    style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }
}