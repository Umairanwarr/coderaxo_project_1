import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Screen47(),
  ));
}

class Screen47 extends StatefulWidget {
  const Screen47({super.key});

  @override
  State<Screen47> createState() => _Screen47State();
}

class _Screen47State extends State<Screen47> {
  int _selectedHeaderTab = 1; // 0 for Hotels, 1 for Properties
  int _navIndex = 0;

  final Color primaryColor = const Color(0xFF32C5C0);
  final Color backgroundColor = const Color(0xFFF3F9F8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          // Teal Header Area with Curves & Controls
          Container(
            color: primaryColor,
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Back arrow & Title
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.maybePop(context),
                          child: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'My Wishlist',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              '3 Saved Properties',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // Toggle Tabs (Hotels / Properties)
                    Container(
                      height: 48,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.25),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () => setState(() => _selectedHeaderTab = 0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: _selectedHeaderTab == 0
                                      ? Colors.white
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.location_city_rounded,
                                      size: 18,
                                      color: _selectedHeaderTab == 0
                                          ? primaryColor
                                          : Colors.white,
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      'Hotels',
                                      style: TextStyle(
                                        color: _selectedHeaderTab == 0
                                            ? primaryColor
                                            : Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => setState(() => _selectedHeaderTab = 1),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: _selectedHeaderTab == 1
                                      ? Colors.white
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.home_outlined,
                                      size: 18,
                                      color: _selectedHeaderTab == 1
                                          ? primaryColor
                                          : Colors.white,
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      'Properties',
                                      style: TextStyle(
                                        color: _selectedHeaderTab == 1
                                            ? primaryColor
                                            : Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Search Bar
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.search, color: Colors.grey.shade400, size: 22),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search Saved Properties...',
                                hintStyle: TextStyle(
                                  color: Colors.grey.shade400,
                                  fontSize: 14,
                                ),
                                border: InputBorder.none,
                                isDense: true,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: primaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.tune,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ),
          ),

          // Main Wishlist Content Items
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              children: [
                // Item 1: Luxury Villa
                _buildWishlistItem(
                  imagePath: 'assets/images/villa1.png',
                  title: 'Luxury Villa',
                  location: 'Dubai Marina',
                  price: '\$1.306 M',
                  rating: '4.8',
                  savedAgo: 'saved 1 week ago',
                  hasPriceDropped: true,
                ),

                const SizedBox(height: 14),

                // Item 2: Conthey Apartment
                _buildWishlistItem(
                  imagePath: 'assets/images/villa3.png',
                  title: 'Conthey Apartment',
                  location: 'Conthey, Switzerland',
                  price: '\$980K',
                  rating: '4.1',
                  savedAgo: null,
                  hasPriceDropped: false,
                ),

                const SizedBox(height: 14),

                // Item 3: Family Room
                _buildWishlistItem(
                  imagePath: 'assets/images/room_thumb2.jpg',
                  title: 'Family Room',
                  location: 'San Francisco',
                  price: '\$2.1M',
                  rating: '4.4',
                  savedAgo: null,
                  hasPriceDropped: false,
                ),
              ],
            ),
          ),
        ],
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: Container(
        height: 70,
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Color(0xFFEAEAEA), width: 1)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.home_rounded, 'Home', 0),
            _buildNavItem(Icons.explore_outlined, '', 1),
            _buildNavItem(Icons.grid_view_rounded, '', 2),
            _buildNavItem(Icons.chat_bubble_outline_rounded, '', 3),
            _buildNavItem(Icons.person_outline_rounded, '', 4),
          ],
        ),
      ),
    );
  }

  // Wishlist Property Card Helper Widget
  Widget _buildWishlistItem({
    required String imagePath,
    required String title,
    required String location,
    required String price,
    required String rating,
    String? savedAgo,
    bool hasPriceDropped = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: primaryColor.withOpacity(0.4), width: 1.2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            // Thumbnail with Favorite Icon Overlay
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    imagePath,
                    width: 110,
                    height: 85,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 110,
                        height: 85,
                        color: Colors.grey.shade300,
                        child: const Icon(Icons.image_not_supported, color: Colors.grey),
                      );
                    },
                  ),
                ),
                Positioned(
                  top: 6,
                  left: 6,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 14,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(width: 12),

            // Details Column
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      if (hasPriceDropped)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            'Price Dropped',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                            ),
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
                        location,
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            price,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                            ),
                          ),
                          if (savedAgo != null)
                            Text(
                              savedAgo,
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey.shade400,
                              ),
                            ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star_rounded, color: Colors.amber, size: 16),
                          const SizedBox(width: 2),
                          Text(
                            rating,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Icon(
                            Icons.delete_outline_rounded,
                            color: Colors.red.shade400,
                            size: 18,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Bottom Navigation Item Builder
  Widget _buildNavItem(IconData icon, String label, int index) {
    bool isSelected = _navIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _navIndex = index),
      child: isSelected && label.isNotEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: primaryColor,
                  radius: 20,
                  child: Icon(icon, color: Colors.white, size: 20),
                ),
                const SizedBox(height: 2),
                Text(
                  label,
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          : Icon(
              icon,
              color: Colors.grey.shade400,
              size: 24,
            ),
    );
  }
}