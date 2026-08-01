// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class PhotoDetailsScreen extends StatefulWidget {
  const PhotoDetailsScreen({super.key});

  @override
  State<PhotoDetailsScreen> createState() => _PhotoDetailsScreenState();
}

class _PhotoDetailsScreenState extends State<PhotoDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPropertyHeader(),
            const SizedBox(height: 20),
            _buildPhotosSection(),
            const SizedBox(height: 20),
            _buildTimeline(),
          ],
        ),
      ),
      bottomNavigationBar: _buildActionButtons(),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: 64,
      backgroundColor: const Color(0xFF2DD4BF),
      automaticallyImplyLeading: false,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF34D9C8), Color(0xFF19B6AE)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.of(context).maybePop(),
      ),
      title: const Text(
        'Photo Details',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.more_vert, color: Colors.white),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildPropertyHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Unit 4B  - Leak Repair',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1E293B),
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Maple Heights',
            style: TextStyle(fontSize: 14, color: Color(0xFF64748B)),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              _buildPill(
                label: 'Completed',
                bg: const Color(0xFF10B981).withOpacity(0.12),
                fg: const Color(0xFF10B981),
              ),
              const SizedBox(width: 8),
              _buildPill(
                label: 'Plumbing',
                bg: const Color(0xFFF1F5F9),
                fg: const Color(0xFF64748B),
              ),
            ],
          ),
          const SizedBox(height: 14),
          const Divider(height: 1, color: Color(0xFFF1F5F9)),
          const SizedBox(height: 14),
          RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: 'Assigned Tech: ',
                  style: TextStyle(fontSize: 14, color: Color(0xFF64748B)),
                ),
                TextSpan(
                  text: 'Mike R.',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1E293B),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPill({
    required String label,
    required Color bg,
    required Color fg,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: fg),
      ),
    );
  }

  Widget _buildPhotosSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Photos for Review',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1E293B),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(child: _buildPhotoPlaceholder('Before')),
            const SizedBox(width: 12),
            Expanded(child: _buildPhotoPlaceholder('After')),
          ],
        ),
      ],
    );
  }

  Widget _buildPhotoPlaceholder(String label) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFE2E8F0),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.image_outlined,
              size: 32,
              color: Color(0xFF94A3B8),
            ),
            const SizedBox(height: 6),
            Text(
              label,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Color(0xFF94A3B8),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeline() {
    final List<Map<String, String>> timelineEvents = [
      {'event': 'Photos uploaded', 'time': '1h ago'},
      {'event': 'Job completed', 'time': '2h ago'},
      {'event': 'Tech assigned', 'time': '1d ago'},
      {'event': 'Job created', 'time': '2d ago'},
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Timeline',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1E293B),
            ),
          ),
          const SizedBox(height: 16),
          ...List.generate(timelineEvents.length, (index) {
            final event = timelineEvents[index];
            final isFirst = index == 0;
            final isLast = index == timelineEvents.length - 1;
            return _buildTimelineItem(
              event: event['event']!,
              time: event['time']!,
              isFirst: isFirst,
              isLast: isLast,
            );
          }),
        ],
      ),
    );
  }

  Widget _buildTimelineItem({
    required String event,
    required String time,
    required bool isFirst,
    required bool isLast,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: isFirst ? 12 : 8,
              height: isFirst ? 12 : 8,
              decoration: BoxDecoration(
                color: isFirst
                    ? const Color(0xFF10B981)
                    : const Color(0xFFCBD5E1),
                shape: BoxShape.circle,
              ),
            ),
            if (!isLast)
              Container(
                width: 2,
                height: 30,
                margin: const EdgeInsets.symmetric(vertical: 2),
                color: const Color(0xFFE2E8F0),
              ),
          ],
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(bottom: isLast ? 0 : 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  event,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF1E293B),
                  ),
                ),
                Text(
                  time,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF94A3B8),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.black.withOpacity(0.06), width: 1),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF1E293B),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  side: const BorderSide(color: Color(0xFFE2E8F0), width: 1.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.close, size: 20),
                    SizedBox(width: 8),
                    Text(
                      'Reject',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF14B8A6), Color(0xFF10B981)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.check, size: 20),
                      SizedBox(width: 8),
                      Text(
                        'Approve',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.04),
          blurRadius: 8,
          offset: const Offset(0, 2),
        ),
      ],
    );
  }
}
