import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/explore_controller.dart';
import 'directions_screen.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  static const Color primaryTeal = Color(0xFF2FC1BE);
  static const Color bgColor = Color(0xFFF3F6F7);
  static const Color darkText = Color(0xFF2C3E4C);
  static const Color subText = Color(0xFF6B7280);
  static const Color inactiveTabBg = Color(0xFFCFF0EE);
  static const Color offerOrange = Color(0xFFE59B2A);

  @override
  Widget build(BuildContext context) {
    final ExploreController controller = Get.put(ExploreController());

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ===== Fixed Top Section =====
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: const Icon(
                          Icons.chevron_left,
                          color: primaryTeal,
                          size: 32,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Explore',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          color: primaryTeal,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // Hotels / Properties toggle
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: primaryTeal.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(26),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(26),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.apartment_outlined,
                                    color: primaryTeal, size: 20),
                                SizedBox(width: 8),
                                Text(
                                  'Hotels',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: primaryTeal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.home_outlined,
                                    color: primaryTeal, size: 20),
                                SizedBox(width: 8),
                                Text(
                                  'Properties',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: primaryTeal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 14),

                  // Grid / Map toggle (reactive)
                  Obx(() => Row(
                    children: [
                      // Grid toggle
                      GestureDetector(
                        onTap: controller.switchToGrid,
                        child: Container(
                          width: 42,
                          height: 42,
                          decoration: BoxDecoration(
                            color: controller.viewMode.value == 'grid'
                                ? primaryTeal
                                : Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            border: controller.viewMode.value == 'grid'
                                ? null
                                : Border.all(color: Color(0xFFB7B7B7)),
                          ),
                          child: Icon(
                            Icons.grid_on,
                            color: controller.viewMode.value == 'grid'
                                ? Colors.white
                                : Colors.grey.shade600,
                            size: 22,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      // Map toggle
                      GestureDetector(
                        onTap: controller.switchToMap,
                        child: Container(
                          width: 42,
                          height: 42,
                          decoration: BoxDecoration(
                            color: controller.viewMode.value == 'map'
                                ? primaryTeal
                                : Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            border: controller.viewMode.value == 'map'
                                ? null
                                : Border.all(color: Colors.grey.shade300),
                          ),
                          child: Icon(
                            Icons.map_outlined,
                            color: controller.viewMode.value == 'map'
                                ? Colors.white
                                : Colors.grey.shade600,
                            size: 22,
                          ),
                        ),
                      ),
                    ],
                  )),

                  const SizedBox(height: 14),

                  // Search bar + filter
                  Container(
                    height: 52,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(26),
                      border: Border.all(color: Color(0xFFBAB1B1).withOpacity(0.61)),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 16),
                        Icon(
                          Icons.search,
                          color: Color(0xFF9E9E9F),
                          size: 22,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            controller: controller.searchController,
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 20,
                              color: darkText,
                            ),
                            decoration: InputDecoration(
                              hintText: 'Search hotels...',
                              hintStyle: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 20,
                                color: Color(0xFF9E9E9F),
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            margin: const EdgeInsets.only(right: 6),
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                              color: primaryTeal,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.tune,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // ===== Dynamic Bottom Section (List OR Map) =====
            Expanded(
              child: Obx(() {
                if (controller.viewMode.value == 'grid') {
                  return _buildListView();
                } else {
                  return _buildMapView();
                }
              }),
            ),
          ],
        ),
      ),
    );
  }

  // ============ LIST VIEW ============
  Widget _buildListView() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          _buildHotelCard(
            imagePath: 'assets/images/luxurysuite.png',
            name: 'Luxury Suite Hotel',
            location: 'London, United Kingdom',
            rating: '5.0',
            price: '\$200',
          ),
          const SizedBox(height: 18),
          _buildHotelCard(
            imagePath: 'assets/images/citycenter.png',
            name: 'City Center Inn',
            location: 'Berlin, Germany',
            rating: '4.8',
            price: '\$300',
          ),
          const SizedBox(height: 18),
          _buildHotelCard(
            imagePath: 'assets/images/boutique.png',
            name: 'Boutique Residence',
            location: 'Amsterdam, Netherlands',
            rating: '4.7',
            price: '\$350',
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // ============ MAP VIEW ============
  Widget _buildMapView() {
    return Stack(
      children: [
        // Map background
        Positioned.fill(
          child: Image.asset(
            'assets/images/explore_map.png',
            fit: BoxFit.cover,
          ),
        ),

        // Hotel info overlay card
        Positioned(
          left: 12,
          right: 12,
          top: 100,
          child: _buildHotelOverlayCard(),
        ),
      ],
    );
  }

  // ============ Hotel Card (list view) ============
  Widget _buildHotelCard({
    required String imagePath,
    required String name,
    required String location,
    required String rating,
    required String price,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: primaryTeal.withOpacity(0.4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: Image.asset(
              imagePath,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 15,
                      color: Color(0xFF787879),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      location,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF787879),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Divider(color: Colors.grey.shade300, height: 1),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.star,
                            color: Color(0xFFF5A623), size: 20),
                        const SizedBox(width: 4),
                        Text(
                          rating,
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: price,
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              color: primaryTeal,
                            ),
                          ),
                          TextSpan(
                            text: '/night',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 17,
                              color: Color(0xFF8F8D8D),
                            ),
                          ),
                        ],
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

  // ============ Hotel Overlay Card (map view) ============
  Widget _buildHotelOverlayCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(14),
                bottomLeft: Radius.circular(14),
              ),
              child: Image.asset(
                'assets/images/hotel_thumb.png',
                width: 105,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Heden golf',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: darkText,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.star,
                            color: Color(0xFFF5A623), size: 14),
                        const SizedBox(width: 4),
                        const Text(
                          '3.9',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: darkText,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Reviews (200)',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 12,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Set in landscaped gardens overlooking the ...',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 11,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Row(
                            children: const [
                              Text(
                                '25% OFF',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: offerOrange,
                                ),
                              ),
                              SizedBox(width: 8),
                              Text(
                                '\$127',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: darkText,
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Get.to(() => const DirectionsScreen()),
                          child: Column(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: const BoxDecoration(
                                  color: primaryTeal,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: ClipPath(
                                    clipper: RhombusClipper(),
                                    child: Container(
                                      color: Colors.white, // Triangle background color
                                      padding: const EdgeInsets.only(
                                        left: 4,
                                        right: 4,
                                        bottom: 3,
                                        top: 6, // Extra top padding keeps icon inside the narrow point
                                      ),
                                      child: const Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Icons.turn_right,
                                            color: primaryTeal, // Icon color changed so it stands out against white
                                            size: 19,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 2),
                              const Text(
                                'Directions',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                  color: primaryTeal,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RhombusClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..moveTo(size.width / 2, 0)          // Top point
      ..lineTo(size.width, size.height / 2) // Right point
      ..lineTo(size.width / 2, size.height) // Bottom point
      ..lineTo(0, size.height / 2)          // Left point
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}