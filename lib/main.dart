import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/edit_profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto', // Change to your project's custom font if needed
        primarySwatch: Colors.teal,
      ),
      // Set the default home screen for testing
      home: const EditProfileScreen(),
      getPages: [
        GetPage(name: '/edit-profile', page: () => const EditProfileScreen()),
        // We will add screens 51 through 67 here as we build them!
      ],
    );
  }
}