import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PropertyItem {
  final String title;
  final String location;
  final String price;
  final double rating;
  final String imagePath;

  PropertyItem({
    required this.title,
    required this.location,
    required this.price,
    required this.rating,
    required this.imagePath,
  });
}

class ExploreController extends GetxController {
  // Category selection: 0 = Hotels, 1 = Properties
  var selectedCategoryIndex = 0.obs;

  // View Mode: true = Grid/List, false = Map/Alt view
  var isGridView = true.obs;

  // Transaction type selection: 0 = Buy, 1 = Rent
  var selectedTransactionIndex = 0.obs;

  final searchController = TextEditingController();

  // Dummy list matching the screenshot items
  final properties = <PropertyItem>[
    PropertyItem(
      title: 'Town Place Apartments',
      location: 'London, United Kingdom',
      price: '\$800K',
      rating: 5.0,
      imagePath: 'assets/explore_hotel/town.jpg',
    ),
    PropertyItem(
      title: 'Modernica Apartment',
      location: 'Berlin, Germany',
      price: '\$1M',
      rating: 4.8,
      imagePath: 'assets/explore_hotel/modernica.png',
    ),
    PropertyItem(
      title: 'Boutique Residence',
      location: 'Amsterdam, Netherlands',
      price: '\$780K',
      rating: 4.7,
      imagePath: 'assets/explore_hotel/boutique.png',
    ),
  ].obs;

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
