import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingConfirmationScreen extends StatelessWidget {
  const BookingConfirmationScreen({super.key});

  static const Color primaryTeal = Color(0xFF2FC1BE);
  static const Color bgColor = Color(0xFFF3F6F7);
  static const Color darkText = Colors.black;
  static const Color subText = Color(0xFF6B7280);
  static const Color confirmedGreen = Color(0xFF3AB77E);
  static const Color lightTealBg = Color(0xFFE8F8F7);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              const SizedBox(height: 30),

              // Green Check Icon
              Container(
                width: 90,
                height: 90,
                decoration: const BoxDecoration(
                  color: confirmedGreen,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 2,
                      offset: Offset(0, 2),
                    ),
                  ]
                ),
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 50,
                ),
              ),

              const SizedBox(height: 20),

              // Booking Confirmed!
              const Text(
                'Booking Confirmed!',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: darkText,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                'Your reservation has been successfully\ncompleted',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: Color(0xFF737070),
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 28),

              // Booking Reference
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 18),
                decoration: BoxDecoration(
                  color: Color(0xFF2FC1BE).withOpacity(0.08),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: Color(0xFF2FC1BE).withOpacity(0.58),
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      'Booking Reference',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'BK30687',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: primaryTeal,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // QR Code Section
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: primaryTeal.withOpacity(0.4),
                  ),
                ),
                child: Column(
                  children: [
                    // QR Image
                    Container(
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                        color: lightTealBg,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          'assets/images/qr_for_mybookings.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    const SizedBox(height: 18),

                    const Text(
                      'Your Check-in QR Code',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF5B5B5B),
                      ),
                    ),

                    const SizedBox(height: 6),

                    Text(
                      'Show this code at the hotel reception',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF8F8C8C),
                      ),
                    ),

                    const SizedBox(height: 40),

                    // Download & Share buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildActionButton(
                          icon: Icons.download,
                          label: 'Download',
                        ),
                        const SizedBox(width: 16),
                        _buildActionButton(
                          icon: Icons.share,
                          label: 'Share',
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Hotel Details Card
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: primaryTeal,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Hotel Image
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(14),
                        topRight: Radius.circular(14),
                      ),
                      child: Image.asset(
                        'assets/images/hoteladagio.png',
                        width: double.infinity,
                        height: 180,
                        fit: BoxFit.cover,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Hotel name + Confirmed badge
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Grand Plaza Hotel',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                  color: darkText,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: confirmedGreen,
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: const Text(
                                  'Confirmed',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 4),

                          // Location
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                size: 14,
                                color: Color(0xFF787879),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'Paris, France',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 13,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 14),

                          Divider(color: Colors.grey.shade300, height: 1),

                          const SizedBox(height: 14),

                          // Room Type
                          _buildDetailRow(
                            'Room Type',
                            '',
                            trailing: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: const [
                                Text(
                                  '1x  Standard Room',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF787879),
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  '1x  Deluxe Suite',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF787879),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 10),

                          _buildDetailRow('Check-In', '12/03/2025'),
                          const SizedBox(height: 10),
                          _buildDetailRow('Check-Out', '12/06/2025'),
                          const SizedBox(height: 10),
                          _buildDetailRow('Guests', '3'),

                          const SizedBox(height: 14),

                          Divider(color: Colors.grey.shade300, height: 1),

                          const SizedBox(height: 14),

                          // Total Paid
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Total Paid',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: subText,
                                ),
                              ),
                              Text(
                                '\$1774',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: primaryTeal,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Confirmation email card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 18),
                decoration: BoxDecoration(
                  color: lightTealBg,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: Color(0xFF79C7EE).withOpacity(0.58)
                  )
                ),
                child: Column(
                  children: [
                    Text(
                      'Confirmation email sent to',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        color: Color(0xFF5B5B5B),
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'alex@gmail.com',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: primaryTeal,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // View My Bookings Button
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  height: 54,
                  decoration: BoxDecoration(
                    color: primaryTeal,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.calendar_today_outlined,
                        color: Colors.white,
                        size: 20,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'View My Bookings',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // Back To Home Button
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  height: 54,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: Color(0xFFABA2A2).withOpacity(0.45),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home,
                        fill: 0,
                        color: Colors.grey.shade700,
                        size: 22,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Back To Home',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  // ============ Action Button (Download/Share) ============
  Widget _buildActionButton({
    required IconData icon,
    required String label,
  }) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color(0xFFA3A2A2).withOpacity(0.82)),
        ),
        child: Row(
          children: [
            Icon(icon, size: 18, color: darkText),
            const SizedBox(width: 6),
            Text(
              label,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: darkText,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============ Detail Row ============
  Widget _buildDetailRow(String label, String value, {Widget? trailing}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: subText,
          ),
        ),
        trailing ??
            Text(
              value,
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Color(0xFF787879),
              ),
            ),
      ],
    );
  }
}