import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Screen46(),
  ));
}

class Screen46 extends StatefulWidget {
  const Screen46({super.key});

  @override
  State<Screen46> createState() => _Screen46State();
}

class _Screen46State extends State<Screen46> {
  final Color primaryColor = const Color(0xFF32C5C0);
  final Color backgroundColor = const Color(0xFFF3F9F8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // Top App Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.maybePop(context),
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: primaryColor,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Booking Details',
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'booking #BK3566',
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                children: [
                  // 1. QR Code Card Section
                  _buildQrCodeCard(),

                  const SizedBox(height: 16),

                  // 2. Hotel & Booking Details Card Section
                  _buildBookingDetailsCard(),

                  const SizedBox(height: 16),

                  // 3. Action Buttons (Download Invoice & Cancel Booking)
                  _buildActionButtons(),

                  const SizedBox(height: 16),

                  // 4. Free Cancellation Notice Banner
                  _buildCancellationNotice(),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // QR Code Box Helper Widget
  Widget _buildQrCodeCard() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: primaryColor.withOpacity(0.3), width: 1.2),
      ),
      child: Column(
        children: [
          // Styled QR Container matching Screenshot layout
          Container(
            width: 160,
            height: 160,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFE8F7F6),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(
              Icons.qr_code_2_rounded,
              size: 120,
              color: primaryColor,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Your Check-in QR Code',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Show this code at the hotel reception',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 16),

          // Download & Share buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildOutlinedButton(
                icon: Icons.download_rounded,
                label: 'Download',
              ),
              const SizedBox(width: 16),
              _buildOutlinedButton(
                icon: Icons.share_rounded,
                label: 'Share',
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Outlined Buttons Helper
  Widget _buildOutlinedButton({required IconData icon, required String label}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: Colors.black87),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  // Booking Card with Hotel Picture & Detailed Stats
  Widget _buildBookingDetailsCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: primaryColor.withOpacity(0.4), width: 1.2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Hotel Image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
            child: Image.asset(
              'assets/images/room_thumb3.png',
              height: 170,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 170,
                  color: Colors.grey.shade300,
                  child: const Center(
                    child: Icon(Icons.apartment, size: 50, color: Colors.grey),
                  ),
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Hotel Name and Confirmed Badge
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Grand Plaza Hotel',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFF4CD964),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        'Confirmed',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    Icon(Icons.location_on, size: 12, color: Colors.grey.shade500),
                    const SizedBox(width: 2),
                    Text(
                      'Paris, France',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),
                Divider(color: Colors.grey.shade200, height: 1),
                const SizedBox(height: 12),

                // Details Rows
                _buildDetailRow('Room Type', '1x Standard Room\n1x Deluxe Suite', multiline: true),
                const SizedBox(height: 8),
                _buildDetailRow('Check-In', '12/03/2025'),
                const SizedBox(height: 8),
                _buildDetailRow('Check-Out', '12/06/2025'),
                const SizedBox(height: 8),
                _buildDetailRow('Guests', '3'),

                const SizedBox(height: 12),
                Divider(color: Colors.grey.shade200, height: 1),
                const SizedBox(height: 12),

                // Total Paid Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Total Paid',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.check_circle_outline, size: 12, color: Colors.grey.shade500),
                            const SizedBox(width: 4),
                            Text(
                              'Paid via Credit Card •••• 4242',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey.shade500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      '\$1774',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
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

  // Key-Value Row Helper
  Widget _buildDetailRow(String label, String value, {bool multiline = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: multiline ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 13,
            color: Colors.grey.shade600,
          ),
        ),
        Text(
          value,
          textAlign: TextAlign.end,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  // Download Invoice & Cancel Booking Buttons
  Widget _buildActionButtons() {
    return Column(
      children: [
        // Download Invoice Button
        Container(
          width: double.infinity,
          height: 48,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300, width: 1),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.download_outlined, color: Colors.black87, size: 20),
              SizedBox(width: 8),
              Text(
                'Download Invoice',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 10),

        // Cancel Booking Button
        Container(
          width: double.infinity,
          height: 48,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.red.shade200, width: 1),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.cancel_outlined, color: Colors.red, size: 20),
              SizedBox(width: 8),
              Text(
                'Cancel Booking',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Free Cancellation Green Banner Notice
  Widget _buildCancellationNotice() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F8E8),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.verified_outlined,
            color: Color(0xFF4CD964),
            size: 18,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              'Free cancellation until 24 hours before check-in. After that cancellation fees may apply.',
              style: TextStyle(
                color: Colors.green.shade800,
                fontSize: 11,
                height: 1.3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}