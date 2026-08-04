import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Screen44(),
  ));
}

class Screen44 extends StatefulWidget {
  const Screen44({super.key});

  @override
  State<Screen44> createState() => _Screen44State();
}

class _Screen44State extends State<Screen44> {
  final Color primaryColor = const Color(0xFF32C5C0);
  final Color backgroundColor = const Color(0xFFF3F9F8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Container(
          decoration: BoxDecoration(
            color: primaryColor,
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.maybePop(context),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'Martin Randolph',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              children: [
                // Top Property Attachment Card
                _buildPropertyCard(),

                const SizedBox(height: 16),

                // Message 1 (Sent by User - Right)
                _buildChatBubble(
                  message:
                      'Hi I hope you are well this property is really great whats the asking price for it I am here to purchase it . Can you please share more details',
                  time: '10:10',
                  isMe: true,
                ),

                const SizedBox(height: 12),

                // Message 2 (Received from Other - Left)
                _buildChatBubble(
                  message:
                      'Hi I hope you are well this property is really great whats the asking price for it I am here to purchase it . Can you please share more details',
                  time: '10:10',
                  isMe: false,
                ),

                const SizedBox(height: 12),

                // Message 3 (Received from Other - Left)
                _buildChatBubble(
                  message:
                      'Hi I hope you are well this property is really great whats the asking price for it I am here to purchase it . Can you please share more details',
                  time: '10:10',
                  isMe: false,
                ),

                const SizedBox(height: 12),

                // Message 4 (Sent by User - Right)
                _buildChatBubble(
                  message:
                      'Hi I hope you are well this property is really great whats the asking price for it I am here to purchase it .',
                  time: '10:10',
                  isMe: true,
                ),
              ],
            ),
          ),

          // Bottom Input Bar
          _buildBottomInputBar(),
        ],
      ),
    );
  }

  // Property Attachment Card Widget
  Widget _buildPropertyCard() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: primaryColor.withOpacity(0.5), width: 1.5),
      ),
      child: Row(
        children: [
          // Property Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/images/room_thumb2.jpg', // Apni image ka path yahan rakhein
              width: 100,
              height: 75,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 100,
                  height: 75,
                  color: Colors.grey.shade300,
                  child: const Icon(Icons.apartment, color: Colors.grey),
                );
              },
            ),
          ),
          const SizedBox(width: 12),
          // Property Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Family Room',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    Icon(Icons.location_on, size: 12, color: Colors.grey.shade600),
                    const SizedBox(width: 2),
                    Text(
                      'San Francisco',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$2.1M',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Row(
                        children: const [
                          Icon(Icons.star_rounded, color: Colors.amber, size: 18),
                          SizedBox(width: 2),
                          Text(
                            '4.4',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Chat Bubble Widget
  Widget _buildChatBubble({
    required String message,
    required String time,
    required bool isMe,
  }) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.75,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: isMe ? primaryColor : Colors.grey.shade200,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
            bottomLeft: Radius.circular(isMe ? 16 : 4),
            bottomRight: Radius.circular(isMe ? 4 : 16),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              message,
              style: TextStyle(
                color: isMe ? Colors.white : Colors.black87,
                fontSize: 13,
                height: 1.3,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              time,
              style: TextStyle(
                color: isMe ? Colors.white70 : Colors.black45,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Bottom Input Bar
  Widget _buildBottomInputBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            Icon(
              Icons.add,
              color: primaryColor,
              size: 28,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Container(
                height: 40,
                padding: const EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey.shade300, width: 0.8),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.sticky_note_2_outlined,
                      color: primaryColor,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10),
            Icon(
              Icons.camera_alt_outlined,
              color: primaryColor,
              size: 24,
            ),
            const SizedBox(width: 10),
            Icon(
              Icons.mic_none_rounded,
              color: primaryColor,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}