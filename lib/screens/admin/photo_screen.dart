// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'photo_details_screen.dart';

class PhotoScreen extends StatefulWidget {
  const PhotoScreen({super.key});

  @override
  State<PhotoScreen> createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: _buildAppBar(context),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        children: [
          _buildPhotoCard(
            unit: 'Unit 4B - Leak',
            status: 'Fixed',
            type: 'Before & After',
            photoCount: '2 photos',
            personLabel: 'Tech',
            person: 'Mike R.',
            time: '1h ago',
          ),
          const SizedBox(height: 12),
          _buildPhotoCard(
            unit: 'Unit 12A - HVAC',
            status: 'Install',
            type: 'Completion',
            photoCount: '3 photos',
            personLabel: 'Tech',
            person: 'Sarah L.',
            time: '3h ago',
          ),
          const SizedBox(height: 12),
          _buildPhotoCard(
            unit: 'Unit 7C - Move-in',
            status: 'Inspection',
            type: 'Inspection',
            photoCount: '8 photos',
            personLabel: 'Agent',
            person: 'Tom K.',
            time: '1d ago',
          ),
          const SizedBox(height: 24),
          const Center(
            child: Text(
              'Tap to review & approve photos',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF94A3B8),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
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
        onPressed: () => Get.back(),
      ),
      centerTitle: true,
      title: const Text(
        'Photo Review',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFF97316),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              '3 pending',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPhotoCard({
    required String unit,
    required String status,
    required String type,
    required String photoCount,
    required String personLabel,
    required String person,
    required String time,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        Get.to(() => const PhotoDetailsScreen());
      },
      child: Container(
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: const Color(0xFFF1F5F9),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.camera_alt_outlined,
                color: Color(0xFF94A3B8),
                size: 22,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    unit,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1E293B),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    status,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1E293B),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '$type • $photoCount',
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF64748B),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '$personLabel : $person • $time',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF94A3B8),
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: Color(0xFF94A3B8)),
          ],
        ),
      ),
    );
  }
}
