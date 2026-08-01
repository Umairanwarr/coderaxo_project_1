// lib/screens/community_screen.dart
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Color(0xFF47D7D4),
        elevation: 0,
        foregroundColor: Colors.black,
        title: const Text(
          'Community',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1E293B),
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.search_outlined, color: Color(0xFF64748B)),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.notifications_outlined,
              color: Color(0xFF64748B),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            _buildHeader(),
            const SizedBox(height: 20),

            // Tabs
            _buildTabs(),
            const SizedBox(height: 20),

            // Community Posts
            _buildCommunityPost(
              name: 'Maria S.',
              role: 'Owner',
              time: '2 hours ago',
              content:
                  'Best tips for quick turnovers during peak season? We have back-to-back bookings and need efficient strategies.',
              likes: '24',
              replies: '23',
              hasLink: false,
            ),
            const SizedBox(height: 16),

            _buildCommunityPost(
              name: 'Ivan P.',
              role: 'Staff',
              time: '5 hours ago',
              content:
                  'Found great eco-friendly cleaning products that work amazing! Check out the attached link for details.',
              likes: '56',
              replies: '8',
              hasLink: true,
              linkText: 'eco-clean-products.com/bundle',
            ),
            const SizedBox(height: 16),

            _buildCommunityPost(
              name: 'Stefan D.',
              role: 'Owner',
              time: 'Yesterday',
              content:
                  'Anyone using inventory management apps? Looking for recommendations to track supplies across multiple properties.',
              likes: '12',
              replies: '15',
              hasLink: false,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFF2563EB).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.people_outline,
              color: Color(0xFF2563EB),
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Community',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1E293B),
                ),
              ),
              Text(
                'Connect with owners & staff',
                style: TextStyle(fontSize: 13, color: Color(0xFF64748B)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTabs() {
    final List<String> tabs = ['Forum', 'Reviews', 'Tips'];
    int selectedIndex = 0; // Forum selected by default

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: List.generate(tabs.length, (index) {
          final isActive = index == selectedIndex;
          return Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: isActive ? const Color(0xFF2563EB) : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  tabs[index],
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                    color: isActive ? Colors.white : const Color(0xFF64748B),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildCommunityPost({
    required String name,
    required String role,
    required String time,
    required String content,
    required String likes,
    required String replies,
    required bool hasLink,
    String linkText = '',
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User Info Row
          Row(
            children: [
              // Avatar
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      _getAvatarColor(name).withOpacity(0.2),
                      _getAvatarColor(name).withOpacity(0.1),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    name.split(' ')[0][0],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: _getAvatarColor(name),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),

              // Name & Role
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1E293B),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: role == 'Owner'
                                ? const Color(0xFF2563EB).withOpacity(0.1)
                                : Colors.green.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            role,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: role == 'Owner'
                                  ? const Color(0xFF2563EB)
                                  : Colors.green,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      time,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF64748B),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Content
          Text(
            content,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF1E293B),
              height: 1.5,
            ),
          ),

          const SizedBox(height: 8),

          // Link (if exists)
          if (hasLink) ...[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFEFF6FF),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.link_outlined,
                    size: 16,
                    color: Color(0xFF2563EB),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      linkText,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFF2563EB),
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
          ],

          // Actions Row
          Row(
            children: [
              // Likes
              Row(
                children: [
                  const Icon(
                    Icons.star_outline,
                    size: 18,
                    color: Color(0xFF64748B),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    likes,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF1E293B),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 24),

              // Replies
              Row(
                children: [
                  const Icon(
                    Icons.chat_bubble_outline,
                    size: 18,
                    color: Color(0xFF64748B),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '$replies replies',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF1E293B),
                    ),
                  ),
                ],
              ),
              const Spacer(),

              // Action Buttons
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: const Color(0xFF2563EB),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: const Text(
                  'Reply',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(width: 4),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_horiz,
                  size: 20,
                  color: Color(0xFF64748B),
                ),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color _getAvatarColor(String name) {
    final colors = [
      const Color(0xFF2563EB), // Blue
      const Color(0xFF7C3AED), // Purple
      const Color(0xFF059669), // Green
      const Color(0xFFD97706), // Amber
      const Color(0xFFDC2626), // Red
      const Color(0xFF0891B2), // Cyan
    ];
    final index = name.hashCode % colors.length;
    return colors[index];
  }
}
