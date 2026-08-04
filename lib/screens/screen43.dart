import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Screen43(),
  ));
}

// Chat item data model
class ChatItem {
  final String avatarUrl;
  final String name;
  final String lastMessage;
  final String time;
  final bool isPhoto;
  final bool isAudio;

  ChatItem({
    required this.avatarUrl,
    required this.name,
    required this.lastMessage,
    required this.time,
    this.isPhoto = false,
    this.isAudio = false,
  });
}

class Screen43 extends StatefulWidget {
  const Screen43({super.key});

  @override
  State<Screen43> createState() => _Screen43State();
}

class _Screen43State extends State<Screen43> {
  int _navIndex = 3; // Messages tab selected

  final Color primaryColor = const Color(0xFF32C5C0);
  final Color textColorDark = const Color(0xFF1E1E1E);

  // List of chat items according to screen 43
  final List<ChatItem> chatItems = [
    ChatItem(
      avatarUrl: 'https://i.pravatar.cc/150?img=11',
      name: 'Martin Randolph',
      lastMessage: 'Yes, 2pm is awesome',
      time: '11/19/19',
    ),
    ChatItem(
      avatarUrl: 'https://i.pravatar.cc/150?img=12',
      name: 'Andrew Parker',
      lastMessage: 'What kind of strategy is better?',
      time: '11/16/19',
    ),
    ChatItem(
      avatarUrl: 'https://i.pravatar.cc/150?img=5',
      name: 'Karen Castillo',
      lastMessage: '0:14',
      time: '11/15/19',
      isAudio: true,
    ),
    ChatItem(
      avatarUrl: 'https://i.pravatar.cc/150?img=60',
      name: 'Maximillian Jacobson',
      lastMessage: 'Bro, I have a good idea!',
      time: '10/30/19',
    ),
    ChatItem(
      avatarUrl: 'https://i.pravatar.cc/150?img=32',
      name: 'Martha Craig',
      lastMessage: 'Photo',
      time: '10/28/19',
      isPhoto: true,
    ),
    ChatItem(
      avatarUrl: 'https://i.pravatar.cc/150?img=47',
      name: 'Tabitha Potter',
      lastMessage:
          'Actually I wanted to check with you about your online business plan on our...',
      time: '8/25/19',
    ),
    ChatItem(
      avatarUrl: 'https://i.pravatar.cc/150?img=26',
      name: 'Maisy Humphrey',
      lastMessage:
          'Welcome, to make design process faster, look at Pixsellz',
      time: '8/20/19',
    ),
    ChatItem(
      avatarUrl: 'https://i.pravatar.cc/150?img=68',
      name: 'Kieron Dotson',
      lastMessage: 'Ok, have a good trip!',
      time: '7/29/19',
    ),
    ChatItem(
      avatarUrl: 'https://i.pravatar.cc/150?img=60',
      name: 'Maximillian Jacobson',
      lastMessage: 'Bro, I have a good idea!',
      time: '10/30/19',
    ),
    ChatItem(
      avatarUrl: 'https://i.pravatar.cc/150?img=32',
      name: 'Martha Craig',
      lastMessage: 'Photo',
      time: '10/28/19',
      isPhoto: true,
    ),
    ChatItem(
      avatarUrl: 'https://i.pravatar.cc/150?img=47',
      name: 'Tabitha Potter',
      lastMessage:
          'Actually I wanted to check with you about your online business plan on our...',
      time: '8/25/19',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(110),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Chats',
                  style: TextStyle(
                    color: textColorDark,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 38,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.search, color: Colors.grey.shade400, size: 20),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search peoples...',
                            hintStyle: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 15,
                            ),
                            border: InputBorder.none,
                            isDense: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: chatItems.length,
        itemBuilder: (context, index) {
          final item = chatItems[index];
          return ChatTile(item: item);
        },
      ),
      bottomNavigationBar: Container(
        height: 70,
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Color(0xFFEAEAEA), width: 1)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.home_outlined, '', 0),
            _buildNavItem(Icons.explore_outlined, '', 1),
            _buildNavItem(Icons.grid_view_outlined, '', 2),
            _buildNavItem(Icons.chat_bubble_rounded, 'Messages', 3),
            _buildNavItem(Icons.person_outline_rounded, '', 4),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    bool isSelected = _navIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _navIndex = index),
      child: isSelected && label.isNotEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: primaryColor,
                  radius: 20,
                  child: Icon(icon, color: Colors.white, size: 20),
                ),
                const SizedBox(height: 2),
                Text(
                  label,
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          : Icon(
              icon,
              color: Colors.grey.shade400,
              size: 24,
            ),
    );
  }
}

class ChatTile extends StatelessWidget {
  final ChatItem item;

  const ChatTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF32C5C0);
    const Color textColorDark = Color(0xFF1E1E1E);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 26,
                backgroundColor: Colors.grey.shade200,
                backgroundImage: NetworkImage(item.avatarUrl),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item.name,
                          style: const TextStyle(
                            color: textColorDark,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          item.time,
                          style: TextStyle(
                            color: Colors.grey.shade400,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        if (item.isAudio)
                          const Padding(
                            padding: EdgeInsets.only(right: 4.0),
                            child: Icon(Icons.mic, color: primaryColor, size: 15),
                          ),
                        if (item.isPhoto)
                          const Padding(
                            padding: EdgeInsets.only(right: 4.0),
                            child: Icon(Icons.camera_alt, color: Colors.grey, size: 15),
                          ),
                        if (!item.isAudio && !item.isPhoto)
                          const Padding(
                            padding: EdgeInsets.only(right: 4.0),
                            child: Icon(Icons.done_all, color: primaryColor, size: 15),
                          ),
                        Expanded(
                          child: Text(
                            item.lastMessage,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 13,
                            ),
                          ),
                        ),
                        Icon(Icons.chevron_right, color: Colors.grey.shade300, size: 18),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Divider(
            color: Colors.grey.shade200,
            height: 1,
            indent: 66,
          ),
        ],
      ),
    );
  }
}