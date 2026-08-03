import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/add_property_controller.dart';

class AddPropertyScreen extends StatelessWidget {
  const AddPropertyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AddPropertyController controller = Get.put(AddPropertyController());

    const primaryColor = Color(0xFF2FC1BE);
    const backgroundColor = Color(0xFFF7F9F9);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: primaryColor),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Add Property',
          style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Property Images Picker
              _buildSectionLabel('Property Images'),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: controller.pickImage,
                child: Container(
                  width: 110,
                  height: 100,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF0F4F4),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.grey.shade300,
                      style: BorderStyle.solid,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.camera_alt_outlined,
                          color: Colors.grey.shade500, size: 28),
                      const SizedBox(height: 6),
                      Text(
                        'Add Photo',
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 18),

              // 2. Property Name
              _buildSectionLabel('Property Name'),
              const SizedBox(height: 6),
              _buildInputField(
                hint: 'Enter property name',
                controller: controller.nameController,
              ),

              const SizedBox(height: 18),

              // 3. Property Type Selector
              _buildSectionLabel('Property Type'),
              const SizedBox(height: 8),
              Obx(() => SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        controller.propertyTypes.length,
                        (index) => Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: _buildSelectableChip(
                            label: controller.propertyTypes[index],
                            isSelected:
                                controller.selectedPropertyTypeIndex.value ==
                                    index,
                            onTap: () =>
                                controller.selectedPropertyTypeIndex.value =
                                    index,
                            primaryColor: primaryColor,
                          ),
                        ),
                      ),
                    ),
                  )),

              const SizedBox(height: 18),

              // 4. Listing Type Selector (For Sale / For Rent)
              _buildSectionLabel('Listing Type'),
              const SizedBox(height: 8),
              Obx(() => Row(
                    children: [
                      Expanded(
                        child: _buildSelectablePill(
                          label: 'For Sale',
                          isSelected:
                              controller.selectedListingTypeIndex.value == 0,
                          onTap: () =>
                              controller.selectedListingTypeIndex.value = 0,
                          primaryColor: primaryColor,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildSelectablePill(
                          label: 'For Rent',
                          isSelected:
                              controller.selectedListingTypeIndex.value == 1,
                          onTap: () =>
                              controller.selectedListingTypeIndex.value = 1,
                          primaryColor: primaryColor,
                        ),
                      ),
                    ],
                  )),

              const SizedBox(height: 18),

              // 5. Price Input
              _buildSectionLabel('Price'),
              const SizedBox(height: 6),
              _buildInputField(
                hint: '0.00',
                controller: controller.priceController,
                keyboardType: TextInputType.number,
              ),

              const SizedBox(height: 18),

              // 6. Location Input
              _buildSectionLabel('Location'),
              const SizedBox(height: 6),
              _buildInputField(
                hint: 'Enter address',
                controller: controller.locationController,
              ),

              const SizedBox(height: 18),

              // 7. Property Details Inputs (Bedrooms, Bathrooms, Sqft)
              _buildSectionLabel('Property Details'),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: _buildDetailInputBox(
                      label: 'Bedrooms',
                      controller: controller.bedroomsController,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _buildDetailInputBox(
                      label: 'Bathrooms',
                      controller: controller.bathroomsController,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _buildDetailInputBox(
                      label: 'Sqft',
                      controller: controller.sqftController,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              // 8. Amenities Chips Grid
              _buildSectionLabel('Amenities'),
              const SizedBox(height: 8),
              Obx(() => Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: controller.availableAmenities.map((amenity) {
                      final isSelected =
                          controller.selectedAmenities.contains(amenity);
                      return _buildSelectableChip(
                        label: amenity,
                        isSelected: isSelected,
                        onTap: () => controller.toggleAmenity(amenity),
                        primaryColor: primaryColor,
                      );
                    }).toList(),
                  )),

              const SizedBox(height: 18),

              // 9. Description Input Area
              _buildSectionLabel('Description'),
              const SizedBox(height: 6),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: TextField(
                  controller: controller.descriptionController,
                  maxLines: 4,
                  style: const TextStyle(fontSize: 14),
                  decoration: InputDecoration(
                    hintText: 'Describe your property...',
                    hintStyle:
                        TextStyle(color: Colors.grey.shade400, fontSize: 13),
                    contentPadding: const EdgeInsets.all(12),
                    border: InputBorder.none,
                  ),
                ),
              ),

              const SizedBox(height: 28),

              // 10. Submit Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: controller.submitProperty,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Add Property',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildInputField({
    required String hint,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Container(
      height: 46,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        style: const TextStyle(fontSize: 14),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 13),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildSelectableChip({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
    required Color primaryColor,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? primaryColor : Colors.grey.shade300,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black87,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildSelectablePill({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
    required Color primaryColor,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 42,
        decoration: BoxDecoration(
          color: isSelected ? primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? primaryColor : Colors.grey.shade300,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black87,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildDetailInputBox({
    required String label,
    required TextEditingController controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
        ),
        const SizedBox(height: 4),
        Container(
          height: 42,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}