import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/my_bookings_controller.dart';

class MyBookingsScreen extends StatelessWidget {
  const MyBookingsScreen({super.key});

  static const Color primaryTeal = Color(0xFF2FC1BE);
  static const Color bgColor = Color(0xFFF3F6F7);
  static const Color darkText = Color(0xFF2C3E4C);
  static const Color subText = Color(0xFF6B7280);
  static const Color confirmedGreen = Color(0xFF4ECD76);
  static const Color pendingYellow = Color(0xFFE6CD10);
  static const Color cancelledRed = Color(0xFFD64029);
  static const Color completedGreen = Color(0xFF4ECD76);
  static const Color tabBg = Color(0xFFF1F2F3);

  @override
  Widget build(BuildContext context) {
    final MyBookingsController controller = Get.put(MyBookingsController());

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Padding(
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
                    'My Bookings',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                      color: primaryTeal,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Tabs
              Obx(() => Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: tabBg,
                  borderRadius: BorderRadius.circular(26),
                ),
                child: Row(
                  children: [
                    _buildTabItem(
                      label: 'Upcoming',
                      isSelected:
                      controller.selectedTab.value == 'upcoming',
                      onTap: () => controller.selectTab('upcoming'),
                    ),
                    _buildTabItem(
                      label: 'Past',
                      isSelected: controller.selectedTab.value == 'past',
                      onTap: () => controller.selectTab('past'),
                    ),
                    _buildTabItem(
                      label: 'Cancelled',
                      isSelected:
                      controller.selectedTab.value == 'cancelled',
                      onTap: () => controller.selectTab('cancelled'),
                    ),
                  ],
                ),
              )),

              const SizedBox(height: 20),

              // Booking Cards based on tab
              Expanded(
                child: Obx(() {
                  switch (controller.selectedTab.value) {
                    case 'upcoming':
                      return _buildUpcomingView();
                    case 'past':
                      return _buildPastView();
                    case 'cancelled':
                      return _buildCancelledView();
                    default:
                      return _buildUpcomingView();
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ============ Tab Item ============
  Widget _buildTabItem({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(26),

          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              fontWeight:   FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  // ============ Upcoming View ============
  Widget _buildUpcomingView() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildBookingCard(
            imagePath: 'assets/images/hoteladagio.png',
            hotelName: 'Grand Plaza Hotel',
            location: 'London, United Kingdom',
            dates: 'Dec 13 - Dec 16 ,2025',
            status: 'Confirmed',
            statusColor: confirmedGreen,
          ),
          const SizedBox(height: 14),
          _buildBookingCard(
            imagePath: 'assets/images/hotel_thumb.png',
            hotelName: 'Heden Golf',
            location: 'Epsom   United Kingdom',
            dates: 'Dec 22 - Dec 26 ,2025',
            status: 'Pending',
            statusColor: pendingYellow,
          ),
        ],
      ),
    );
  }

  // ============ Past View ============
  Widget _buildPastView() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildBookingCard(
            imagePath: 'assets/images/hoteladagio.png',
            hotelName: 'Onomo',
            location: 'Berlin, Germany',
            dates: 'Sep 13 - Sep 16 ,2025',
            status: 'Completed',
            statusColor: completedGreen,
          ),
          const SizedBox(height: 14),
          _buildBookingCard(
            imagePath: 'assets/images/hotel_thumb.png',
            hotelName: 'Sofitel',
            location: 'Epsom   United Kingdom',
            dates: 'Dec 22 - Dec 26 ,2023',
            status: 'Completed',
            statusColor: completedGreen,
          ),
        ],
      ),
    );
  }

  // ============ Cancelled View ============
  Widget _buildCancelledView() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildBookingCard(
            imagePath: 'assets/images/hoteladagio.png',
            hotelName: 'Adagio',
            location: 'Ankara, Turkey',
            dates: 'Sep 13 - Sep 16 ,2022',
            status: 'Cancelled',
            statusColor: cancelledRed,
          ),
          const SizedBox(height: 14),
          _buildBookingCard(
            imagePath: 'assets/images/hotel_thumb.png',
            hotelName: 'Sofitel',
            location: 'Epsom   United Kingdom',
            dates: 'Dec 21 - Dec 26 ,2021',
            status: 'Cancelled',
            statusColor: cancelledRed,
          ),
        ],
      ),
    );
  }

  // ============ Booking Card ============
  Widget _buildBookingCard({
    required String imagePath,
    required String hotelName,
    required String location,
    required String dates,
    required String status,
    required Color statusColor,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: const Color(0xFF918C8C).withOpacity(0.35),
        ),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch, // stretches image full height
          children: [
            // Image
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(14),
                bottomLeft: Radius.circular(14),
              ),
              child: Image.asset(
                imagePath,
                width: 105,
                fit: BoxFit.cover, // fills full width & height
              ),
            ),
            const SizedBox(width: 12),

            // Details
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Hotel name + QR + Status
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            hotelName,
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: darkText,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.apartment,
                          size: 18,
                          color: Colors.grey.shade500,
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: statusColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            status,
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 6),

                    // Location
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 14,
                          color: Colors.grey.shade500,
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            location,
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 13,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 6),

                    // Dates
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today_outlined,
                          size: 14,
                          color: Colors.grey.shade500,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          dates,
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 13,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    // Booking Details button
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFEBE8E8),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Color(0XffA3A2A2).withOpacity(0.82)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.grid_view_outlined,
                              size: 14,
                              color: Colors.grey.shade700,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              'Booking Details',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey.shade700,
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
          ],
        ),
      ),
    );
  }
}