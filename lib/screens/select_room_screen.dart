import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectRoomScreen extends StatelessWidget {
  const SelectRoomScreen({super.key});

  // Theme colors
  static const Color primaryTeal = Color(0xFF2FC1BE);
  static const Color bgColor = Color(0xFFF3F6F7);
  static const Color darkText = Colors.black;
  static const Color subText = Color(0xFF787879);
  static const Color matchGreen = Color(0xFF3AB77E);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with back button
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
                    'Select Room',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: primaryTeal,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 6),

              // Dates + Edit
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Row(
                  children: [
                    const Text(
                      'Dec 13 - Dec 16 (3 Nights)',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: darkText,
                      ),
                    ),
                    const SizedBox(width: 12),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'Edit',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: primaryTeal,
                          decoration: TextDecoration.underline,
                          decorationColor: primaryTeal,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // "3 Rooms Found" + Sort dropdown
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '3 Rooms Found',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFF2FC1BE).withOpacity(0.16),
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: primaryTeal, width: 1),
                    ),
                    child: Row(
                      children: [
                        Text(
                          'sort by : Best Value',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            color: primaryTeal,
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Icon(
                          Icons.keyboard_arrow_down,
                          color: primaryTeal,
                          size: 13,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Room Card 1 - Standard Room
              _buildRoomCard(
                imagePath: 'assets/images/hotelroompic1.png',
                matchPercentage: '99% Match',
                roomName: 'Standard Room',
                description: 'Comfortable room with modern amenities and city views.',
                size: '25 m²',
                bedType: '1 King Bed',
                guests: '2 Guests',
                amenities: ['Free Wifi', 'TV', 'Coffee Maker'],
                price: '\$180',
                count: 1,
              ),

              const SizedBox(height: 20),

              // Room Card 2 - Deluxe Suite
              _buildRoomCard(
                imagePath: 'assets/images/deluxesuite.png',
                matchPercentage: null,
                roomName: 'Deluxe Suite',
                description: 'Spacious suite with separate living area and premium amenities.',
                size: '25 m²',
                bedType: '1 King Bed+Sofa',
                guests: '3 Guests',
                amenities: ['Free Wifi', 'TV', 'Coffee Maker', 'Mini Bar'],
                price: '\$350',
                count: 1,
              ),

              const SizedBox(height: 20),

              // Room Card 3 - Family Room
              _buildRoomCard(
                imagePath: 'assets/images/familyroom.png',
                matchPercentage: null,
                roomName: 'Family Room',
                description: 'Perfect for families with ample space and comfort.',
                size: '25 m²',
                bedType: '2 Queen Beds',
                guests: '4 Guests',
                amenities: ['Free Wifi', 'TV', 'Coffee Maker'],
                price: '\$300',
                count: 0,
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Room Card Builder
  Widget _buildRoomCard({
    required String imagePath,
    String? matchPercentage,
    required String roomName,
    required String description,
    required String size,
    required String bedType,
    required String guests,
    required List<String> amenities,
    required String price,
    required int count,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: primaryTeal.withOpacity(0.5), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Room Image with Match Badge
          Stack(
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
              if (matchPercentage != null)
                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: matchGreen,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      matchPercentage,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
            ],
          ),

          // Card Body
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Room Name
                Text(
                  roomName,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: darkText,
                  ),
                ),
                const SizedBox(height: 8),

                // Description
                Text(
                  description,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: subText,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 14),

                // Info Row - Size, Bed, Guests
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildInfoItem(Icons.crop_free, size),
                    _buildInfoItem(Icons.airline_seat_flat_outlined, bedType),
                    _buildInfoItem(Icons.people_outline_rounded, guests),
                  ],
                ),

                const SizedBox(height: 14),

                // Amenities Chips
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: amenities
                      .map((amenity) => _buildAmenityChip(amenity))
                      .toList(),
                ),

                const SizedBox(height: 14),

                // Divider
                Divider(color: Colors.grey.shade300, height: 1),

                const SizedBox(height: 12),

                // Price + Counter
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Price per night',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: subText,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          price,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: primaryTeal,
                          ),
                        ),
                      ],
                    ),

                    // Counter
                    Row(
                      children: [
                        _buildCounterButton(Icons.remove),
                        const SizedBox(width: 12),
                        Text(
                          count.toString(),
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: darkText,
                          ),
                        ),
                        const SizedBox(width: 12),
                        _buildCounterButton(Icons.add),
                      ],
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

  // Info Item (size, bed, guests)
  Widget _buildInfoItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 18, color: subText),
        const SizedBox(width: 6),
        Text(
          text,
          style: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: subText,
          ),
        ),
      ],
    );
  }

  // Amenity Chip
  Widget _buildAmenityChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: primaryTeal.withOpacity(0.86),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }

  // Counter Button (+ / -)
  Widget _buildCounterButton(IconData icon) {
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        color: primaryTeal.withOpacity(0.2),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: 18, color: primaryTeal),
    );
  }
}