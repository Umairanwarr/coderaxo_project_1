import 'package:coderaxo_project_1/screens/payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/summary_controller.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

  // Theme colors
  static const Color primaryTeal = Color(0xFF2FC1BE);
  static const Color bgColor = Color(0xFFF3F6F7);
  static const Color darkText = Color(0xFF2C3E4C);
  static const Color subText = Color(0xFF6B7280);
  static const Color lightTealBg = Color(0xFFCFF0EE);
  static final Color cancellationGreen = const Color(0xFFD0FBAF).withOpacity(0.57);
  static const Color cancellationTextGreen = Color(0xFF2E7D5B);

  @override
  Widget build(BuildContext context) {
    // Initialize the controller
    final SummaryController controller = Get.put(SummaryController());

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          children: [
            // Scrollable Content
            Expanded(
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
                          'Summary',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: primaryTeal,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // Room Card 1 - Standard Room
                    _buildRoomSummaryCard(
                      imagePath: 'assets/images/hotelroompic1.png',
                      roomName: 'Standard Room (1)',
                      bedInfo: '1 King Bed  •  25 m²',
                      price: '\$180',
                    ),

                    const SizedBox(height: 16),

                    // Room Card 2 - Deluxe Suite
                    _buildRoomSummaryCard(
                      imagePath: 'assets/images/deluxesuite.png',
                      roomName: 'Deluxe Suite (1)',
                      bedInfo: '1 King Bed + Sofa  •  25 m²',
                      price: '\$350',
                    ),

                    const SizedBox(height: 24),

                    // Check-in / Check-out cards
                    Row(
                      children: [
                        Expanded(
                          child: _buildCheckCard(
                            label: 'CHECK-IN',
                            date: 'Tue, 13 Dec',
                            icon: Icons.login,
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: _buildCheckCard(
                            label: 'CHECK-OUT',
                            date: 'Fri, 16 Dec',
                            icon: Icons.logout,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // Number of Adults Card
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          // Adults 12+
                          Obx(() => _buildAdultRow(
                            title: 'Number of Adults',
                            subtitle: 'Ages 12+',
                            count: controller.adultsCount.value,
                            onIncrement: controller.incrementAdults,
                            onDecrement: controller.decrementAdults,
                          )),
                          const SizedBox(height: 20),

                          // Children 0-11
                          Obx(() => _buildAdultRow(
                            title: 'Number of Adults',
                            subtitle: 'Ages 0-11',
                            count: controller.childrenCount.value,
                            onIncrement: controller.incrementChildren,
                            onDecrement: controller.decrementChildren,
                          )),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Promo Code
                    const Text(
                      'Promo Code',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: darkText,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 48,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            child: TextField(
                              controller: controller.promoCodeController,
                              style: const TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 14,
                                color: darkText,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Promo code',
                                hintStyle: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 14,
                                  color: Colors.grey.shade500,
                                ),
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 12,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        GestureDetector(
                          onTap: controller.applyPromoCode,
                          child: Container(
                            height: 48,
                            padding: const EdgeInsets.symmetric(horizontal: 28),
                            decoration: BoxDecoration(
                              color: primaryTeal,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            alignment: Alignment.center,
                            child: const Text(
                              'Apply',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // Price Details
                    const Text(
                      'Price Details',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: darkText,
                      ),
                    ),
                    const SizedBox(height: 14),

                    _buildPriceRow('2 Room x 3 Nights', '\$1590'),
                    const SizedBox(height: 8),
                    _buildPriceRow('Taxes & Fees (10%)', '\$159'),
                    const SizedBox(height: 8),
                    _buildPriceRow('Service Charge', '\$25'),

                    const SizedBox(height: 14),

                    // Dotted Divider
                    _buildDottedLine(),

                    const SizedBox(height: 14),

                    // Total
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Total',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: darkText,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text(
                              '\$1774',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                color: primaryTeal,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              'Includes all taxes',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 12,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // Cancellation Info
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: cancellationGreen,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.verified_user_outlined,
                            color: cancellationTextGreen,
                            size: 20,
                          ),
                          const SizedBox(width: 10),
                          const Expanded(
                            child: Text(
                              'Free cancellation until 24 hours before check-in.\nAfter that cancellation fees may apply.',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: cancellationTextGreen,
                                height: 1.4,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
                      color: bgColor,
                      child: Row(
                        children: [
                          // Cancel Button
                          Expanded(
                            flex: 2,
                            child: GestureDetector(
                              onTap: () => Get.back(),
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: Colors.grey.shade300),
                                ),
                                alignment: Alignment.center,
                                child: const Text(
                                  'Cancel',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: darkText,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 14),
                          // Proceed to Checkout
                          Expanded(
                            flex: 3,
                            child: GestureDetector(
                              onTap: () {
                                Get.to(()=> const PaymentScreen());
                              },
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  color: primaryTeal,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                alignment: Alignment.center,
                                child: const Text(
                                  'Proceed to Checkout',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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

  // Room Summary Card
  Widget _buildRoomSummaryCard({
    required String imagePath,
    required String roomName,
    required String bedInfo,
    required String price,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: primaryTeal.withOpacity(0.5), width: 1),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagePath,
              width: 85,
              height: 85,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  roomName,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: darkText,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  bedInfo,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: subText,
                  ),
                ),
                const SizedBox(height: 6),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: price,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: primaryTeal,
                        ),
                      ),
                      TextSpan(
                        text: '/night',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Check-in / Check-out card
  Widget _buildCheckCard({
    required String label,
    required String date,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: primaryTeal.withOpacity(0.16),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: primaryTeal, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade600,
                  letterSpacing: 0.5,
                ),
              ),
              Icon(icon, size: 18, color: primaryTeal),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            date,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: darkText,
            ),
          ),
        ],
      ),
    );
  }

  // Adults Row (with counter)
  Widget _buildAdultRow({
    required String title,
    required String subtitle,
    required int count,
    required VoidCallback onIncrement,
    required VoidCallback onDecrement,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: darkText,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              subtitle,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 13,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
        Row(
          children: [
            GestureDetector(
              onTap: onDecrement,
              child: _buildCounterButton(Icons.remove),
            ),
            const SizedBox(width: 14),
            Text(
              count.toString(),
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: darkText,
              ),
            ),
            const SizedBox(width: 14),
            GestureDetector(
              onTap: onIncrement,
              child: _buildCounterButton(Icons.add),
            ),
          ],
        ),
      ],
    );
  }

  // Counter Button
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

  // Price Row
  Widget _buildPriceRow(String label, String amount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: subText,
          ),
        ),
        Text(
          amount,
          style: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: darkText,
          ),
        ),
      ],
    );
  }

  // Dotted Divider Line
  Widget _buildDottedLine() {
    return LayoutBuilder(
      builder: (context, constraints) {
        const dashWidth = 4.0;
        const dashSpace = 4.0;
        final dashCount =
        (constraints.constrainWidth() / (dashWidth + dashSpace)).floor();
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            dashCount,
                (_) => SizedBox(
              width: dashWidth,
              height: 1,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.grey.shade400),
              ),
            ),
          ),
        );
      },
    );
  }
}