import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListingItem {
  final String title;
  final String price;
  final String pricePeriod; // e.g., '/mo' or empty
  final String address;
  final String status; // 'ACTIVE', 'PENDING', etc.
  final String imagePath;

  ListingItem({
    required this.title,
    required this.price,
    this.pricePeriod = '',
    required this.address,
    required this.status,
    required this.imagePath,
  });
}

class MyListingsController extends GetxController {
  // Filter tab selection: 0 = All, 1 = Active, 2 = Pending, 3 = Inactive
  var selectedFilterIndex = 0.obs;

  final listings = <ListingItem>[
    ListingItem(
      title: 'Sunnyvale Condo',
      price: '\$3,500',
      pricePeriod: '/mo',
      address: '123 Market St, San Francisco, CA',
      status: 'ACTIVE',
      imagePath: 'assets/images/listing_1.jpg',
    ),
    ListingItem(
      title: 'Oakwood Family Home',
      price: '\$450,000',
      pricePeriod: '',
      address: '456 Oak Dr, Austin, TX',
      status: 'ACTIVE',
      imagePath: 'assets/images/listing_2.jpg',
    ),
  ].obs;

  void editListing(ListingItem item) {
    Get.snackbar(
      'Edit Listing',
      'Opening editor for ${item.title}...',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFF2FC1BE),
      colorText: Colors.white,
    );
  }

  void viewDetails(ListingItem item) {
    Get.snackbar(
      'View Details',
      'Loading details for ${item.title}...',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFF2FC1BE),
      colorText: Colors.white,
    );
  }

  void addProperty() {
    Get.snackbar(
      'Add Property',
      'Opening property creation flow...',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFF2FC1BE),
      colorText: Colors.white,
    );
  }
}