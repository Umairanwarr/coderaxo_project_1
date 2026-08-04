import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Screen48(),
  ));
}

class Screen48 extends StatefulWidget {
  const Screen48({super.key});

  @override
  State<Screen48> createState() => _Screen48State();
}

class _Screen48State extends State<Screen48> {
  final Color primaryColor = const Color(0xFF32C5C0);
  final Color backgroundColor = const Color(0xFFF3F9F8);

  // Switch States matching screenshot defaults
  bool _showMessageNotifications = true;
  bool _showGroupNotifications = true;
  bool _showReactionNotifications = true;
  bool _showSpecialOffers = true;
  bool _showPayments = true;
  bool _showCashback = false;
  bool _showPreview = true;

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
                    'Notifications',
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: ListView(
                children: [
                  // MESSAGE NOTIFICATIONS SECTION
                  _buildSectionHeader('MESSAGE NOTIFICATIONS'),
                  _buildSwitchTile(
                    title: 'Show Notifications',
                    value: _showMessageNotifications,
                    onChanged: (val) => setState(() => _showMessageNotifications = val),
                  ),
                  _buildValueTile(
                    title: 'Sound',
                    value: 'Note',
                  ),

                  // GROUP NOTIFICATIONS SECTION
                  _buildSectionHeader('GROUP NOTIFICATIONS'),
                  _buildSwitchTile(
                    title: 'Show Notifications',
                    value: _showGroupNotifications,
                    onChanged: (val) => setState(() => _showGroupNotifications = val),
                  ),
                  _buildValueTile(
                    title: 'Sound',
                    value: 'Note',
                  ),
                  _buildSwitchTile(
                    title: 'Reaction Notifications',
                    value: _showReactionNotifications,
                    onChanged: (val) => setState(() => _showReactionNotifications = val),
                  ),
                  _buildSwitchTile(
                    title: 'Special Offers',
                    value: _showSpecialOffers,
                    onChanged: (val) => setState(() => _showSpecialOffers = val),
                  ),
                  _buildSwitchTile(
                    title: 'Payments',
                    value: _showPayments,
                    onChanged: (val) => setState(() => _showPayments = val),
                  ),
                  _buildSwitchTile(
                    title: 'Cashback',
                    value: _showCashback,
                    onChanged: (val) => setState(() => _showCashback = val),
                  ),

                  const SizedBox(height: 10),

                  // IN-APP NOTIFICATIONS TILE
                  _buildInAppNotificationsTile(),

                  const SizedBox(height: 10),

                  // SHOW PREVIEW SECTION
                  _buildSwitchTile(
                    title: 'Show Preview',
                    value: _showPreview,
                    onChanged: (val) => setState(() => _showPreview = val),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
                    child: Text(
                      'Preview message text inside new message notifications.',
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 11,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // RESET NOTIFICATION SETTINGS BUTTON
                  Container(
                    color: Colors.white,
                    child: ListTile(
                      onTap: () {
                        // Reset action
                      },
                      title: const Text(
                        'Reset Notification Settings',
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Section Header Helper
  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 16.0, bottom: 8.0),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.grey.shade500,
          fontSize: 11,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  // Switch Tile Helper
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
            activeTrackColor: const Color(0xFF4CD964), // iOS Green accent
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: Colors.grey.shade300,
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }

  // Value/Arrow Tile Helper (e.g. Sound -> Note >)
  Widget _buildValueTile({
    required String title,
    required String value,
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
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              value,
              style: TextStyle(
                color: Colors.grey.shade400,
                fontSize: 13,
              ),
            ),
            const SizedBox(width: 4),
            Icon(
              Icons.chevron_right,
              color: Colors.grey.shade300,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }

  // In-App Notifications Custom Tile
  Widget _buildInAppNotificationsTile() {
    return Container(
      color: Colors.white,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
        title: const Text(
          'In-App Notifications',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          'Banners, Sounds, Vibrate',
          style: TextStyle(
            color: Colors.grey.shade500,
            fontSize: 11,
          ),
        ),
        trailing: Icon(
          Icons.chevron_right,
          color: Colors.grey.shade300,
          size: 18,
        ),
      ),
    );
  }
}