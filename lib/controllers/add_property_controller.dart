import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPropertyController extends GetxController {
  // Text Controllers
  late TextEditingController nameController;
  late TextEditingController priceController;
  late TextEditingController locationController;
  late TextEditingController bedroomsController;
  late TextEditingController bathroomsController;
  late TextEditingController sqftController;
  late TextEditingController descriptionController;

  // Property Type Selection: 0 = Villa, 1 = Apartment, 2 = House, 3 = Condo
  var selectedPropertyTypeIndex = 0.obs;

  // Listing Type Selection: 0 = For Sale, 1 = For Rent
  var selectedListingTypeIndex = 0.obs;

  // Reactive List of Selected Amenities
  var selectedAmenities = <String>['Wifi', 'Parking', 'Pool'].obs;

  final List<String> propertyTypes = ['Villa', 'Apartment', 'House', 'Condo'];
  final List<String> availableAmenities = [
    'Wifi',
    'Parking',
    'Washer',
    'Gym',
    'Balcony',
    'Air Conditioning',
    'Pool',
    'Heating',
    'Dryer',
    'Elevator'
  ];

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    priceController = TextEditingController();
    locationController = TextEditingController();
    bedroomsController = TextEditingController(text: '0');
    bathroomsController = TextEditingController(text: '0');
    sqftController = TextEditingController(text: '0');
    descriptionController = TextEditingController();
  }

  @override
  void onClose() {
    nameController.dispose();
    priceController.dispose();
    locationController.dispose();
    bedroomsController.dispose();
    bathroomsController.dispose();
    sqftController.dispose();
    descriptionController.dispose();
    super.onClose();
  }

  void toggleAmenity(String amenity) {
    if (selectedAmenities.contains(amenity)) {
      selectedAmenities.remove(amenity);
    } else {
      selectedAmenities.add(amenity);
    }
  }

  void pickImage() {
    Get.snackbar(
      'Upload Photo',
      'Opening gallery picker...',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFF2FC1BE),
      colorText: Colors.white,
    );
  }

  void submitProperty() {
    Get.snackbar(
      'Success',
      'Property added successfully!',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFF2FC1BE),
      colorText: Colors.white,
    );
  }
}