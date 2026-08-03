import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/directions_controller.dart';

class DirectionsScreen extends StatelessWidget {
  const DirectionsScreen({super.key});

  static const Color primaryTeal = Color(0xFF2FC1BE);
  static const Color bgColor = Color(0xFFF3F6F7);
  static const Color darkText = Color(0xFF2C3E4C);
  static const Color markerRed = Color(0xFFE54D4D);

  @override
  Widget build(BuildContext context) {
    final DirectionsController controller = Get.put(DirectionsController());

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Stack(
          children: [
            // ===== 1. Map Section (Fills remaining space below header) =====
            Column(
              children: [
                // Invisible spacer matching the top header's approximate height
                const SizedBox(height: 180),
                Expanded(
                  child: Image.asset(
                    'assets/images/directions_map.png',
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),

            // ===== 2. Top Header Section (Sits on front layer so shadow casts over map) =====
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF3F6F7),
                  border: BoxBorder.fromLTRB(
                    top: BorderSide.none,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25), // Change to Color(0x29000000) for real UI shadow
                      blurRadius: 10,
                      spreadRadius: -4,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
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
                              size: 30,
                            ),
                          ),
                          const SizedBox(width: 6),
                          const Text(
                            'Directions',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 19,
                              fontWeight: FontWeight.w500,
                              color: primaryTeal,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      // Location inputs with dot markers
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Left column: markers
                          Padding(
                            padding: const EdgeInsets.only(top: 12.0),
                            child: Column(
                              children: [
                                Container(
                                  width: 14,
                                  height: 14,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.black, width: 4),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                for (int i = 0; i < 4; i++) ...[
                                  Container(
                                    width: 3,
                                    height: 3,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF161616),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  const SizedBox(height: 3),
                                ],
                                const Icon(
                                  Icons.location_on_outlined,
                                  color: Color(0xFFDF0606),
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 14),

                          // Right column: inputs
                          Expanded(
                            child: Column(
                              children: [
                                _buildLocationField(
                                  controller.yourLocationController,
                                ),
                                const SizedBox(height: 10),
                                _buildLocationField(
                                  controller.destinationController,
                                ),
                                const SizedBox(height: 20),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============ Location Input Field ============
  Widget _buildLocationField(TextEditingController controller) {
    return Container(
      height: 44,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFBAB1B1).withOpacity(0.61)),
      ),
      child: TextField(
        controller: controller,
        style: const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Color(0xFF6E6E72),
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        ),
      ),
    );
  }
}