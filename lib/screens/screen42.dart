import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Screen42(),
  ));
}

class Screen42 extends StatefulWidget {
  const Screen42({super.key});

  @override
  State<Screen42> createState() => _Screen42State();
}

class _Screen42State extends State<Screen42> {
  final Color primaryColor = const Color(0xFF32C5C0);

  @override
  void initState() {
    super.initState();
    // Screen khultay hi automatically Filter Bottom Sheet show karein
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showFilterBottomSheet(context);
    });
  }

  // Function to show Filter Options Modal Bottom Sheet
  void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const FilterBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Background UI (Properties Screen jo filter sheet ke peeche hai)
    return Scaffold(
      backgroundColor: const Color(0xFFF3F9F8),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  Icon(Icons.arrow_back_ios_new_rounded, color: primaryColor, size: 22),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Properties',
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Discover exclusive properties',
                        style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Search Box with Filter Icon Button
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey.shade400, size: 24),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Search Properties...',
                        style: TextStyle(color: Colors.grey.shade400, fontSize: 15),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _showFilterBottomSheet(context),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.tune, color: Colors.white, size: 18),
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // Re-open Button if sheet is closed
              Center(
                child: ElevatedButton(
                  onPressed: () => _showFilterBottomSheet(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'Open Filter Sheet',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

// Stateful Bottom Sheet Class to maintain selections
class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  final Color primaryColor = const Color(0xFF32C5C0);

  // Filter Selection States
  int _selectedPropertyType = 0; // 0: House, 1: Appartment, etc.
  double _priceRange = 1200000;
  int _selectedBedrooms = 2; // 2 selected
  int _selectedBathrooms = 0; // Any selected

  final List<Map<String, dynamic>> _propertyTypes = [
    {'name': 'House', 'icon': Icons.home_rounded},
    {'name': 'Appartment', 'icon': Icons.apartment_rounded},
    {'name': 'Condo', 'icon': Icons.location_city_rounded},
    {'name': 'Land', 'icon': Icons.landscape_rounded},
    {'name': 'Villa', 'icon': Icons.villa_rounded},
    {'name': 'Townhouse', 'icon': Icons.domain_rounded},
  ];

  final List<String> _bedroomOptions = ['Any', '1', '2', '3', '4+'];
  final List<String> _bathroomOptions = ['Any', '1', '2', '3', '4+'];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8, left: 20, right: 20, bottom: 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Drag Handle bar top
          Center(
            child: Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),

          // Header Row: Close, Filter options title, Reset
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.close, size: 20, color: Colors.black87),
              ),
              const Text(
                'Filter options',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedPropertyType = 0;
                    _priceRange = 50;
                    _selectedBedrooms = 0;
                    _selectedBathrooms = 0;
                  });
                },
                child: Text(
                  'Reset',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // 1. Property Type Grid Section
          _buildSectionTitle('Property Type'),
          const SizedBox(height: 10),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1.25,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: _propertyTypes.length,
            itemBuilder: (context, index) {
              bool isSelected = _selectedPropertyType == index;
              return GestureDetector(
                onTap: () => setState(() => _selectedPropertyType = index),
                child: Container(
                  decoration: BoxDecoration(
                    color: isSelected ? primaryColor.withOpacity(0.1) : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: isSelected ? primaryColor : Colors.grey.shade200,
                      width: 1.5,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        _propertyTypes[index]['icon'],
                        color: isSelected ? primaryColor : Colors.blueGrey.shade400,
                        size: 28,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        _propertyTypes[index]['name'],
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: isSelected ? primaryColor : Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),

          const SizedBox(height: 20),

          // 2. Price Range Slider Section
          _buildSectionTitle('Price Range'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$50', style: TextStyle(fontSize: 11, color: Colors.grey.shade500)),
              Text('\$8M+', style: TextStyle(fontSize: 11, color: Colors.grey.shade500)),
            ],
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: primaryColor,
              inactiveTrackColor: primaryColor.withOpacity(0.2),
              thumbColor: primaryColor,
              trackHeight: 4.0,
            ),
            child: Slider(
              value: _priceRange,
              min: 50,
              max: 8000000,
              onChanged: (val) => setState(() => _priceRange = val),
            ),
          ),

          const SizedBox(height: 10),

          // 3. Bedrooms Pills Row
          _buildSectionTitle('Bedrooms'),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(_bedroomOptions.length, (index) {
              bool isSelected = _selectedBedrooms == index;
              return GestureDetector(
                onTap: () => setState(() => _selectedBedrooms = index),
                child: Container(
                  width: 60,
                  height: 38,
                  decoration: BoxDecoration(
                    color: isSelected ? primaryColor : Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isSelected ? primaryColor : Colors.grey.shade200,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    _bedroomOptions[index],
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.grey.shade600,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ),
              );
            }),
          ),

          const SizedBox(height: 16),

          // 4. Bathrooms Pills Row
          _buildSectionTitle('Bathrooms'),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(_bathroomOptions.length, (index) {
              bool isSelected = _selectedBathrooms == index;
              return GestureDetector(
                onTap: () => setState(() => _selectedBathrooms = index),
                child: Container(
                  width: 60,
                  height: 38,
                  decoration: BoxDecoration(
                    color: isSelected ? primaryColor : Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isSelected ? primaryColor : Colors.grey.shade200,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    _bathroomOptions[index],
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.grey.shade600,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ),
              );
            }),
          ),

          const SizedBox(height: 16),

          // 5. Living Area Range Input Fields
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildSectionTitle('Living Area'),
              Text('sqft', style: TextStyle(fontSize: 12, color: Colors.grey.shade400)),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 40,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Min',
                      hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 13),
                      border: InputBorder.none,
                      isDense: true,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: Text('-', style: TextStyle(color: Colors.grey)),
              ),
              Expanded(
                child: Container(
                  height: 40,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Max',
                      hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 13),
                      border: InputBorder.none,
                      isDense: true,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // 6. Apply Button
          SizedBox(
            width: double.infinity,
            height: 46,
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: const Text(
                'Apply',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }
}