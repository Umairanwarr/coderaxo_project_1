import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/add_expense_controller.dart';

class AddExpenseScreen extends StatelessWidget {
  const AddExpenseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AddExpenseController controller = Get.put(AddExpenseController());

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
          'Add Expense',
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
              // 1. Total Amount Input Header Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'TOTAL AMOUNT',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey.shade400,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.8,
                      ),
                    ),
                    const SizedBox(height: 12),
                    IntrinsicWidth(
                      child: TextField(
                        controller: controller.amountController,
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                        decoration: InputDecoration(
                          hintText: '\$0.00',
                          hintStyle: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade300,
                          ),
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // 2. Description
              _buildFieldLabel('Description'),
              const SizedBox(height: 6),
              _buildInputField(
                hint: 'e.g., Plumbing Repair',
                controller: controller.descriptionController,
              ),

              const SizedBox(height: 18),

              // 3. Property Dropdown
              _buildFieldLabel('Property'),
              const SizedBox(height: 6),
              Obx(() => _buildDropdownField<String>(
                    hint: 'Select a property',
                    value: controller.selectedProperty.value,
                    items: controller.propertiesList,
                    onChanged: (val) => controller.selectedProperty.value = val,
                  )),

              const SizedBox(height: 18),

              // 4. Category Dropdown
              _buildFieldLabel('Category'),
              const SizedBox(height: 6),
              Obx(() => _buildDropdownField<String>(
                    hint: 'Select',
                    value: controller.selectedCategory.value,
                    items: controller.categoriesList,
                    onChanged: (val) => controller.selectedCategory.value = val,
                  )),

              const SizedBox(height: 18),

              // 5. Date Field with Picker Icon
              _buildFieldLabel('Date'),
              const SizedBox(height: 6),
              GestureDetector(
                onTap: () => controller.pickDate(context),
                child: AbsorbPointer(
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    child: TextField(
                      controller: controller.dateController,
                      style: const TextStyle(fontSize: 14),
                      decoration: InputDecoration(
                        hintText: 'mm/dd/yyyy',
                        hintStyle: TextStyle(color: Colors.grey.shade300, fontSize: 13),
                        suffixIcon: Icon(Icons.calendar_today_outlined,
                            color: Colors.grey.shade400, size: 20),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 18),

              // 6. Receipt File Upload Area
              _buildFieldLabel('Receipt'),
              const SizedBox(height: 6),
              GestureDetector(
                onTap: controller.uploadReceipt,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 28),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Colors.grey.shade300,
                      style: BorderStyle.solid,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF0F7F7),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.camera_alt_outlined,
                          color: primaryColor,
                          size: 26,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Click to upload',
                            style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            '   or drag and drop',
                            style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'SVG, PNG, JPG or PDF',
                        style: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 28),

              // 7. Save Expense Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: controller.saveExpense,
                  icon: const Icon(Icons.check, color: Colors.white, size: 20),
                  label: const Text(
                    'Save Expense',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
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

  Widget _buildFieldLabel(String label) {
    return Text(
      label,
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
  }) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: TextField(
        controller: controller,
        style: const TextStyle(fontSize: 14),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey.shade300, fontSize: 13),
          contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildDropdownField<T>({
    required String hint,
    required T? value,
    required List<T> items,
    required ValueChanged<T?> onChanged,
  }) {
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          value: value,
          hint: Text(
            hint,
            style: TextStyle(color: Colors.grey.shade300, fontSize: 13),
          ),
          icon: Icon(Icons.keyboard_arrow_down, color: Colors.grey.shade400),
          isExpanded: true,
          onChanged: onChanged,
          items: items.map((T item) {
            return DropdownMenuItem<T>(
              value: item,
              child: Text(
                item.toString(),
                style: const TextStyle(fontSize: 14, color: Colors.black87),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}