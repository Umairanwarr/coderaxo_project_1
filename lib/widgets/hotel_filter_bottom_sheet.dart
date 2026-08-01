import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color kPrimaryCyan = Color(0xFF2FC1BE);

void showHotelFilterBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black.withOpacity(0.71),
    builder: (context) => const HotelFilterBottomSheetUI(),
  );
}

class HotelFilterBottomSheetUI extends StatelessWidget {
  const HotelFilterBottomSheetUI({super.key});

  @override
  Widget build(BuildContext context) {
    const double horizontalPadding = 20.0;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      // Limit max height to 85% of screen so it stays a bottom sheet
      constraints: BoxConstraints(
        maxHeight: screenHeight * 0.75,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Drag Handle
          const SizedBox(height: 10),
          Container(
            height: 4,
            width: 143,
            decoration: BoxDecoration(
              color: const Color(0xFFDCDCDC),
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          // Scrollable Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(top: 12, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  _buildHeader(context),
                  const SizedBox(height: 16),

                  // Number of Guests
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                    child: Text(
                      'Number of Guests',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildMainGuestBox(),
                  const SizedBox(height: 12),
                  _buildGuestSubRow('Adults', '2'),
                  const SizedBox(height: 8),
                  _buildGuestSubRow('Childrens', '1'),
                  const SizedBox(height: 24),

                  // Price Range
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
                    child: Text(
                      'Price Range',
                      style: TextStyle(
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  _buildPriceSlider(),
                  const SizedBox(height: 20),

                  // Check-in/Check-out Dates
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
                    child: Text(
                      'Check-in/Check-out Dates',
                      style: TextStyle(
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildCalendarBox(),
                  const SizedBox(height: 24),

                  // Amenities
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
                    child: Text(
                      'Amenities',
                      style: TextStyle(
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildAmenitiesChips(),
                  const SizedBox(height: 28),

                  // Apply Button
                  _buildApplyButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- HELPER WIDGETS ---

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(CupertinoIcons.xmark, size: 19, color: Colors.black),
          ),
          Text(
            'Filter options',
            style: TextStyle(
              fontFamily: GoogleFonts.inter().fontFamily,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Reset',
              style: TextStyle(
                fontFamily: GoogleFonts.inter().fontFamily,
                color: kPrimaryCyan,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainGuestBox() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          color: kPrimaryCyan.withOpacity(0.16),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 12),
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF000000).withOpacity(0.15),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
      ],
              ),
              child: const Icon(CupertinoIcons.minus, color: kPrimaryCyan, size: 18),
            ),
            const Text(
              '2 Adults, 1 Child',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,

                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF000000).withOpacity(0.15),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const Icon(CupertinoIcons.plus, color: kPrimaryCyan, size: 18),
            ),
            const SizedBox(width: 12),
          ],
        ),
      ),
    );
  }

  Widget _buildGuestSubRow(String title, String count) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontFamily: GoogleFonts.poppins().fontFamily,fontSize: 13, color: Colors.black87),
          ),
          Row(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: kPrimaryCyan.withOpacity(0.18),
                  shape: BoxShape.circle,

                ),
                child: const Icon(CupertinoIcons.minus, color: Color(0xFF1B8785), size: 14),
              ),
              SizedBox(
                width: 28,
                child: Center(
                  child: Text(
                    count,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: kPrimaryCyan.withOpacity(0.18),
                  shape: BoxShape.circle,
                ),
                child: Icon(CupertinoIcons.plus, color: const Color(0xFF1B8785), size: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPriceSlider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$50', style: TextStyle(fontFamily: GoogleFonts.inter().fontFamily,color: Colors.grey, fontSize: 13)),
              Text('\$1000+', style: TextStyle(fontFamily: GoogleFonts.inter().fontFamily,color: Colors.grey, fontSize: 13)),
            ],
          ),
          SliderTheme(
            data: SliderThemeData(
              padding: EdgeInsets.symmetric(horizontal: 0,vertical: 16),
              activeTrackColor: kPrimaryCyan,
              inactiveTrackColor: kPrimaryCyan.withOpacity(0.21),
              trackHeight: 3.0,
              thumbColor: kPrimaryCyan,
              overlayColor: kPrimaryCyan.withOpacity(0.2),
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8.0),
            ),
            child: Slider(
              value: 250,
              min: 50,
              max: 1000,
              onChanged: (val) {},
            ),
          ),
        ],
      ),
    );
  }

  // --- FULL DETAILED CALENDAR BOX ---
  Widget _buildCalendarBox() {
    const days = ['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su'];
    final dates = [
      ['29', '30', '31', '1', '2', '3', '4'],
      ['5', '6', '7', '8', '9', '10', '11'],
      ['12', '13', '14', '15', '16', '17', '18'],
      ['19', '20', '21', '22', '23', '24', '25'],
      ['26', '27', '28', '29', '30', '31', '1'],
      ['2', '3', '4', '5', '6', '7', '8'],
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFADAEBC)),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            // Blue Border Area Around Calendar Grid
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  // Month Label
                  Center(
                    child: Text(
                      'December',
                      style: TextStyle(fontFamily: GoogleFonts.inter().fontFamily,fontSize: 11, color: const Color(0xFFB3B3B3)),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Day Name Headers
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: days.map((day) {
                      final isWeekend = day == 'Sa' || day == 'Su';
                      return SizedBox(
                        width: 28,
                        child: Center(
                          child: Text(
                            day,
                            style: TextStyle(
                              fontFamily: GoogleFonts.inter().fontFamily,
                              fontSize: 11,
                              color: isWeekend ? const Color(0xFF2FC1BE) : Colors.grey,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 8),

                  // Date Matrix Grid
                  Column(
                    children: dates.map((row) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: row.map((date) {
                            final isSelected = date == '13' || date == '16';
                            final isWeekend = row.indexOf(date) >= 5;

                            return SizedBox(
                              width: 28,
                              height: 20,
                              child: Center(
                                child: Text(
                                  date,
                                  style: TextStyle(
                                    fontFamily: GoogleFonts.inter().fontFamily,
                                    fontSize: 11 ,
                                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                    color: isSelected
                                        ? Colors.black
                                        : (isWeekend ? const Color(0xFF2FC1BE) : Color(0xFFB3B3B3)),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),

            // Check-in / Check-out Bottom Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Check-in', style: TextStyle(fontFamily: GoogleFonts.poppins().fontFamily,fontSize: 13, color: Color(0xFF9E9E9F))),
                      const SizedBox(height: 2),
                      Text('Dec 13', style: TextStyle(fontFamily: GoogleFonts.poppins().fontFamily,fontSize: 13, fontWeight: FontWeight.w700)),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('Check-out', style: TextStyle(fontFamily: GoogleFonts.poppins().fontFamily,fontSize: 13, color: const Color(0xFF9E9E9F))),
                      const SizedBox(height: 2),
                      Text('Dec 16', style: TextStyle(fontFamily: GoogleFonts.poppins().fontFamily,fontSize: 13, fontWeight: FontWeight.w700)),
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

  Widget _buildAmenitiesChips() {
    final amenities = ['Free wifi', 'Gym', 'Pool', 'Pet Friendly', 'Breakfast', 'Parking'];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: amenities.map((amenity) {
          final isPetFriendly = amenity == 'Pet Friendly';
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: isPetFriendly ? kPrimaryCyan.withOpacity(0.16) : Color(0xFF83D0F1).withOpacity(0.16),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: kPrimaryCyan.withOpacity(0.4)),
            ),
            child: Text(
              amenity,
              style: TextStyle(
                fontFamily: GoogleFonts.inter().fontFamily,
                color: kPrimaryCyan,
                fontSize: 11,
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildApplyButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36),
      child: SizedBox(
        width: double.infinity,
        height: 48,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: kPrimaryCyan,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Text(
            'Apply',
            style: TextStyle(
              fontFamily: GoogleFonts.inter().fontFamily,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}