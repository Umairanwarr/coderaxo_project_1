import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeaturedPropertyItem {
  final String title;
  final String location;
  final String price;
  final double rating;
  final String badgeText;
  final String imagePath;
  var isFavorite = false.obs;

  FeaturedPropertyItem({
    required this.title,
    required this.location,
    required this.price,
    required this.rating,
    required this.badgeText,
    required this.imagePath,
    bool isFavorite = false,
  }) {
    this.isFavorite.value = isFavorite;
  }
}

class FeaturedPropertiesController extends GetxController {
  final searchController = TextEditingController();

  // Transaction selection: 0 = Buy, 1 = Rent
  var selectedTransactionIndex = 1.obs; 

  // Sort dropdown value
  var selectedSort = 'Recommended'.obs;

  // Property items matching design
  final properties = <FeaturedPropertyItem>[
    FeaturedPropertyItem(
      title: 'Luxury Villa',
      location: 'Dubai Marina',
      price: '\$500',
      rating: 4.8,
      badgeText: '+8.5%',
      imagePath: 'assets/images/featured_villa_1.png',
      isFavorite: true,
    ),
    FeaturedPropertyItem(
      title: 'City Loft Villa',
      location: 'Maldives · Beach-front',
      price: '\$700',
      rating: 4.9,
      badgeText: '+5.5%',
      imagePath: 'assets/images/featured_villa_2.jpg',
      isFavorite: false,
    ),
  ].obs;

  void toggleFavorite(int index) {
    properties[index].isFavorite.value = !properties[index].isFavorite.value;
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}