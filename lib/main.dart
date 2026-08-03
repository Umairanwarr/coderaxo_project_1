

import 'package:coderaxo_project_1/screens/explore_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/hotel_filter_bottom_sheet.dart'; // Adjust path if needed

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ExploreScreen(),
    );
  }
}

// Separate Screen Widget so 'context' is properly nested under GetMaterialApp
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter Test'),
        backgroundColor: const Color(0xFF43C5C3),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showHotelFilterBottomSheet(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF43C5C3),
          ),
          child: const Text(
            'Open Filter Bottom Sheet',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}