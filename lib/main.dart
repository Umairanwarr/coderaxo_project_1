import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/screen_1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp( // Changed from MaterialApp to GetMaterialApp
      debugShowCheckedModeBanner: false,
      title: 'IDS Europe',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF7FAFC),
      ),
      home: const Screen1(),
    );
  }
}