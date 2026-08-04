import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Screen49(),
  ));
}

class Screen49 extends StatefulWidget {
  const Screen49({super.key});

  @override
  State<Screen49> createState() => _Screen49State();
}

class _Screen49State extends State<Screen49> {
  final Color primaryColor = const Color(0xFF32C5C0);
  final Color backgroundColor = const Color(0xFFF3F9F8);

  // Switch States matching screenshot defaults
  bool _rememberMe = true;
  bool _faceId = true;
  bool _fingerprint = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
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
                  Text(
                    'Security Settings',
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Security Settings List
            _buildSwitchTile(
              title: 'Remember me',
              value: _rememberMe,
              onChanged: (val) => setState(() => _rememberMe = val),
            ),
            _buildSwitchTile(
              title: 'Face ID',
              value: _faceId,
              onChanged: (val) => setState(() => _faceId = val),
            ),
            _buildSwitchTile(
              title: 'Fingerprint',
              value: _fingerprint,
              onChanged: (val) => setState(() => _fingerprint = val),
            ),
          ],
        ),
      ),
    );
  }

  // Helper Widget for Switch Tiles
  Widget _buildSwitchTile({
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Color(0xFFF0F0F0), width: 0.8),
        ),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
        dense: true,
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: Transform.scale(
          scale: 0.8,
          child: Switch(
            value: value,
            activeColor: Colors.white,
            activeTrackColor: const Color(0xFF4CD964), // iOS Style Green Track
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: Colors.grey.shade300,
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}