import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddExpenseController extends GetxController {
  late TextEditingController amountController;
  late TextEditingController descriptionController;
  late TextEditingController dateController;

  // Dropdown selections
  var selectedProperty = RxnString();
  var selectedCategory = RxnString();

  // Lists for dropdowns
  final propertiesList = [
    'Sunset Villa',
    'Ocean View Apt',
    'Sunnyvale Condo',
    'Oakwood Family Home'
  ];

  final categoriesList = [
    'Maintenance',
    'Utilities',
    'Tax',
    'Renovation',
    'Insurance',
    'Other'
  ];

  @override
  void onInit() {
    super.onInit();
    amountController = TextEditingController();
    descriptionController = TextEditingController();
    dateController = TextEditingController();
  }

  @override
  void onClose() {
    amountController.dispose();
    descriptionController.dispose();
    dateController.dispose();
    super.onClose();
  }

  void pickDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF2FC1BE),
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      dateController.text =
          "${pickedDate.month.toString().padLeft(2, '0')}/${pickedDate.day.toString().padLeft(2, '0')}/${pickedDate.year}";
    }
  }

  void uploadReceipt() {
    Get.snackbar(
      'Upload Receipt',
      'Opening file picker...',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFF2FC1BE),
      colorText: Colors.white,
    );
  }

  void saveExpense() {
    Get.snackbar(
      'Success',
      'Expense saved successfully!',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFF2FC1BE),
      colorText: Colors.white,
    );
  }
}