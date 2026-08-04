import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Screen35',
      theme: ThemeData(fontFamily: 'Roboto'),
      home: const Screen35(),
    );
  }
}

class Screen35 extends StatelessWidget {
  const Screen35({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: Stack(
        children: [
          Column(
            children: [
              _buildHeader(),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 55, left: 20, right: 20, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _sectionTitle('Account'),
                      _buildCard([
                        _buildTile(Icons.person_outline, 'Edit Profile'),
                        _buildTile(Icons.verified_outlined, 'Identity Verification', trailing: _pendingBadge()),
                        _buildTile(Icons.settings_outlined, 'Preferences'),
                      ]),
                      const SizedBox(height: 20),
                      _sectionTitle('Wallet & Payments'),
                      _buildCard([
                        _buildTile(Icons.account_balance_wallet_outlined, 'My Wallet'),
                        _buildTile(Icons.payment_outlined, 'Payment Methods'),
                      ]),
                      const SizedBox(height: 20),
                      _sectionTitle('Notifications & Settings'),
                      _buildCard([
                        _buildTile(Icons.notifications_none, 'Notifications'),
                        _buildTile(Icons.lock_outline, 'Security Settings'),
                      ]),
                      const SizedBox(height: 20),
                      _sectionTitle('Support'),
                      _buildCard([
                        _buildTile(Icons.help_outline, 'Help Center'),
                        _buildTile(Icons.description_outlined, 'Terms & Privacy'),
                      ]),
                      const SizedBox(height: 20),
                      _buildCard([
                        _buildTile(Icons.logout, 'Logout', color: Colors.red),
                      ]),
                      const SizedBox(height: 90),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 155,
            left: 20,
            right: 20,
            child: _buildStatsRow(),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNav(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF00BFA5),
        onPressed: () {},
        child: const Icon(Icons.person, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 50, 20, 40),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF26C6DA), Color(0xFF00BFA5)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
              SizedBox(width: 10),
              Text(
                'Profile',
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              // Avatar Image Added Here
              const CircleAvatar(
                radius: 28,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/images/avatar.jpg'),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Alex Hales',
                      style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text('alex@gmail.com',
                      style: TextStyle(color: Colors.white70, fontSize: 13)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatsRow() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _statItem('12', 'Bookings'),
          _statItem('8', 'Reviews'),
          _statItem('100', 'Points'),
        ],
      ),
    );
  }

  Widget _statItem(String value, String label) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.teal)),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 4),
      child: Text(
        title,
        style: const TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _buildCard(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(children: children),
    );
  }

  Widget _buildTile(IconData icon, String title, {Widget? trailing, Color? color}) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: (color ?? Colors.teal).withOpacity(0.1),
        child: Icon(icon, color: color ?? Colors.teal, size: 20),
      ),
      title: Text(title, style: TextStyle(color: color ?? Colors.black87, fontSize: 14)),
      trailing: trailing ?? const Icon(Icons.chevron_right, color: Colors.grey, size: 18),
    );
  }

  Widget _pendingBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.orange.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Text('Pending', style: TextStyle(color: Colors.orange, fontSize: 11, fontWeight: FontWeight.w600)),
    );
  }

  Widget _buildBottomNav() {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Icon(Icons.home_outlined, color: Colors.grey),
          Icon(Icons.explore_outlined, color: Colors.grey),
          SizedBox(width: 40),
          Icon(Icons.chat_bubble_outline, color: Colors.grey),
          Icon(Icons.group_outlined, color: Colors.grey),
        ],
      ),
    );
  }
}