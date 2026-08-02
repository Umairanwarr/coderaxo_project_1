import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectDatesCheckInScreen extends StatelessWidget {
  const SelectDatesCheckInScreen({super.key});

  // Theme colors
  static const Color primaryTeal = Color(0xFF2FC1BE);
  static final Color darkBlue = const Color(0xFF1E5CB3);
  static const Color bgColor = Color(0xFFF3F6F7);
  static const Color darkText = Color(0xFF2C3E4C);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

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
                    'Select Dates',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: primaryTeal,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Check-in & Check-out Cards
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Check-in Card (ACTIVE)
                  Expanded(
                    child: _buildDateCard(
                      label: 'CHECK-IN',
                      date: 'Tue,13 Dec',
                      isActive: true,
                    ),
                  ),
                  const SizedBox(width: 14),
                  // Check-out Card (INACTIVE)
                  Expanded(
                    child: _buildDateCard(
                      label: 'CHECK-OUT',
                      date: 'Fri,16 Dec',
                      isActive: false,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 36),

              // Month header + arrows
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'December 2025',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF595E69),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.chevron_left,
                        color: primaryTeal.withOpacity(0.3),
                        size: 28,
                      ),
                      const SizedBox(width: 16),
                      const Icon(
                        Icons.chevron_right,
                        color: primaryTeal,
                        size: 28,
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Weekday headers
              _buildWeekdayHeader(),

              const SizedBox(height: 8),

              // Calendar Grid
              Expanded(child: _buildCalendarGrid(selectedDay: 13)),
              // Continue Booking Button
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width*0.8,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryTeal.withOpacity(0.5),
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          'Continue Booking',
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
                ),
              ),
              //Spacer()
            ],
          ),
        ),
      ),
    );
  }

  // Date Card Widget
  Widget _buildDateCard({
    required String label,
    required String date,
    required bool isActive,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      decoration: BoxDecoration(
        color: isActive ? primaryTeal : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.calendar_today_outlined,
                size: 18,
                color: isActive ? Colors.white : primaryTeal,
              ),
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: isActive ? Colors.white : primaryTeal,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            date,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: isActive ? Colors.white : primaryTeal,
            ),
          ),
        ],
      ),
    );
  }

  // Weekday Header Row
  Widget _buildWeekdayHeader() {
    final days = ['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: days.map((day) {
        final isWeekend = day == 'Sa' || day == 'Su';
        return SizedBox(
          width: 32,
          child: Text(
            day,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: isWeekend ? primaryTeal : Colors.grey.shade500,
            ),
          ),
        );
      }).toList(),
    );
  }

  // Calendar Grid
  Widget _buildCalendarGrid({required int selectedDay}) {
    // December 2025 starts on Monday (Dec 1 = Monday)
    // Row 1: 29,30,31 (Nov) | 1,2,3,4 (Dec)
    // Row 2: 5,6,7,8,9,10,11
    // Row 3: 12,13,14,15,16,17,18
    // Row 4: 19,20,21,22,23,24,25
    // Row 5: 26,27,28,29,30,31 | 1 (Jan)
    // Row 6: 2,3,4,5,6,7,8 (Jan)

    final List<Map<String, dynamic>> days = [
      // Row 1
      {'day': 29, 'isCurrentMonth': false},
      {'day': 30, 'isCurrentMonth': false},
      {'day': 31, 'isCurrentMonth': false},
      {'day': 1, 'isCurrentMonth': true},
      {'day': 2, 'isCurrentMonth': true},
      {'day': 3, 'isCurrentMonth': true},
      {'day': 4, 'isCurrentMonth': true},
      // Row 2
      {'day': 5, 'isCurrentMonth': true},
      {'day': 6, 'isCurrentMonth': true},
      {'day': 7, 'isCurrentMonth': true},
      {'day': 8, 'isCurrentMonth': true},
      {'day': 9, 'isCurrentMonth': true},
      {'day': 10, 'isCurrentMonth': true},
      {'day': 11, 'isCurrentMonth': true},
      // Row 3
      {'day': 12, 'isCurrentMonth': true},
      {'day': 13, 'isCurrentMonth': true},
      {'day': 14, 'isCurrentMonth': true},
      {'day': 15, 'isCurrentMonth': true},
      {'day': 16, 'isCurrentMonth': true},
      {'day': 17, 'isCurrentMonth': true},
      {'day': 18, 'isCurrentMonth': true},
      // Row 4
      {'day': 19, 'isCurrentMonth': true},
      {'day': 20, 'isCurrentMonth': true},
      {'day': 21, 'isCurrentMonth': true},
      {'day': 22, 'isCurrentMonth': true},
      {'day': 23, 'isCurrentMonth': true},
      {'day': 24, 'isCurrentMonth': true},
      {'day': 25, 'isCurrentMonth': true},
      // Row 5
      {'day': 26, 'isCurrentMonth': true},
      {'day': 27, 'isCurrentMonth': true},
      {'day': 28, 'isCurrentMonth': true},
      {'day': 29, 'isCurrentMonth': true},
      {'day': 30, 'isCurrentMonth': true},
      {'day': 31, 'isCurrentMonth': true},
      {'day': 1, 'isCurrentMonth': false},
      // Row 6
      {'day': 2, 'isCurrentMonth': false},
      {'day': 3, 'isCurrentMonth': false},
      {'day': 4, 'isCurrentMonth': false},
      {'day': 5, 'isCurrentMonth': false},
      {'day': 6, 'isCurrentMonth': false},
      {'day': 7, 'isCurrentMonth': false},
      {'day': 8, 'isCurrentMonth': false},
    ];

    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        childAspectRatio: 1,
      ),
      itemCount: days.length,
      itemBuilder: (context, index) {
        final day = days[index]['day'] as int;
        final isCurrentMonth = days[index]['isCurrentMonth'] as bool;
        final dayOfWeek = index % 7; // 0=Mo ... 5=Sa, 6=Su
        final isWeekend = dayOfWeek == 5 || dayOfWeek == 6;
        final isSelected = isCurrentMonth && day == selectedDay;

        Color textColor;
        if (isSelected) {
          textColor = Colors.white;
        } else if (!isCurrentMonth) {
          textColor = Colors.grey.shade400;
        } else if (isWeekend) {
          textColor = primaryTeal;
        } else {
          textColor = darkText;
        }

        return Center(
          child: Container(
            width: 40,
            height: 40,
            decoration: isSelected
                ? BoxDecoration(
              color: darkBlue,
              shape: BoxShape.circle,
            )
                : null,
            alignment: Alignment.center,
            child: Text(
              day.toString(),
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 15,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                color: textColor,
              ),
            ),
          ),
        );
      },
    );
  }
}