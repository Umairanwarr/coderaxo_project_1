// ignore_for_file: unused_local_variable, deprecated_member_use, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddExpensesScreen extends StatefulWidget {
  const AddExpensesScreen({super.key});

  @override
  State<AddExpensesScreen> createState() => _AddExpensesScreenState();
}

class _AddExpensesScreenState extends State<AddExpensesScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Add Expense',
      theme: ThemeData(
        fontFamily: 'System',
        useMaterial3: true,
        brightness: Brightness.light,
        scaffoldBackgroundColor: const Color(0xFFF8FAFC),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
      ),
      home: const AddExpenseScreen(),
    );
  }
}

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedProperty;
  String? _selectedCategory;
  DateTime? _selectedDate;
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  final List<String> _properties = [
    'Select a property',
    'Sunset Villa',
    'Ocean View Apt',
    'Maple Heights',
    'Lakewood Estate',
  ];

  final List<String> _categories = [
    'Select',
    'Maintenance',
    'Utilities',
    'Renovation',
    'Tax',
    'Supplies',
    'Services',
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Responsive breakpoints
    final isVerySmall = screenWidth < 360;
    final isSmall = screenWidth >= 360 && screenWidth < 400;
    final isMedium = screenWidth >= 400 && screenWidth < 600;
    final isLarge = screenWidth >= 600;

    // Responsive padding and spacing
    final horizontalPadding = isVerySmall ? 12.0 : (isSmall ? 14.0 : 16.0);
    final verticalSpacing = isVerySmall ? 12.0 : (isSmall ? 14.0 : 16.0);
    final fieldSpacing = isVerySmall ? 12.0 : (isSmall ? 14.0 : 16.0);

    // Responsive font sizes
    final titleSize = isVerySmall ? 16.0 : (isSmall ? 18.0 : 20.0);
    final labelSize = isVerySmall ? 12.0 : (isSmall ? 13.0 : 14.0);
    final inputSize = isVerySmall ? 13.0 : (isSmall ? 14.0 : 16.0);
    final buttonSize = isVerySmall ? 14.0 : (isSmall ? 15.0 : 16.0);
    final amountSize = isVerySmall ? 28.0 : (isSmall ? 32.0 : 40.0);
    final dollarSize = isVerySmall ? 18.0 : (isSmall ? 20.0 : 24.0);

    // Responsive heights
    final inputHeight = isVerySmall ? 44.0 : (isSmall ? 48.0 : 54.0);
    final buttonHeight = isVerySmall ? 44.0 : (isSmall ? 48.0 : 54.0);
    final receiptHeight = isVerySmall ? 100.0 : (isSmall ? 120.0 : 140.0);

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Color(0xFF1E293B),
            size: 20,
          ),
          onPressed: () => Navigator.pop(context),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
        title: Text(
          'Add Expense',
          style: TextStyle(
            fontSize: titleSize,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF1E293B),
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.close_outlined, color: Color(0xFF64748B)),
            onPressed: () => Navigator.pop(context),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(horizontalPadding),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Total Amount Section
              _buildTotalAmountSection(
                isVerySmall: isVerySmall,
                isSmall: isSmall,
                amountSize: amountSize,
                dollarSize: dollarSize,
              ),
              SizedBox(height: verticalSpacing),

              // Description
              _buildTextField(
                label: 'Description',
                hint: 'e.g., Plumbing Repair',
                controller: _descriptionController,
                labelSize: labelSize,
                inputSize: inputSize,
                inputHeight: inputHeight,
                isVerySmall: isVerySmall,
              ),
              SizedBox(height: fieldSpacing),

              // Property Dropdown
              _buildDropdownField(
                label: 'Property',
                value: _selectedProperty,
                items: _properties,
                hint: 'Select a property',
                onChanged: (value) {
                  setState(() {
                    _selectedProperty = value;
                  });
                },
                labelSize: labelSize,
                inputSize: inputSize,
                inputHeight: inputHeight,
                isVerySmall: isVerySmall,
              ),
              SizedBox(height: fieldSpacing),

              // Category Dropdown
              _buildDropdownField(
                label: 'Category',
                value: _selectedCategory,
                items: _categories,
                hint: 'Select',
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value;
                  });
                },
                labelSize: labelSize,
                inputSize: inputSize,
                inputHeight: inputHeight,
                isVerySmall: isVerySmall,
              ),
              SizedBox(height: fieldSpacing),

              // Date Picker
              _buildDatePicker(
                labelSize: labelSize,
                inputSize: inputSize,
                inputHeight: inputHeight,
                isVerySmall: isVerySmall,
              ),
              SizedBox(height: fieldSpacing),

              // Receipt Upload
              _buildReceiptUpload(
                labelSize: labelSize,
                inputSize: inputSize,
                receiptHeight: receiptHeight,
                isVerySmall: isVerySmall,
              ),
              SizedBox(height: verticalSpacing),

              // Save Button
              _buildSaveButton(
                buttonHeight: buttonHeight,
                buttonSize: buttonSize,
                isVerySmall: isVerySmall,
              ),

              // Bottom padding for safe area
              SizedBox(
                height: MediaQuery.of(context).padding.bottom > 0 ? 8 : 0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTotalAmountSection({
    required bool isVerySmall,
    required bool isSmall,
    required double amountSize,
    required double dollarSize,
  }) {
    return Container(
      padding: EdgeInsets.all(isVerySmall ? 12 : (isSmall ? 16 : 20)),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'TOTAL AMOUNT',
            style: TextStyle(
              fontSize: isVerySmall ? 10 : (isSmall ? 11 : 12),
              fontWeight: FontWeight.w600,
              color: const Color(0xFF64748B),
              letterSpacing: 0.5,
            ),
          ),
          SizedBox(height: isVerySmall ? 2 : 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: isVerySmall ? 4 : (isSmall ? 6 : 8),
                ),
                child: Text(
                  '\$',
                  style: TextStyle(
                    fontSize: dollarSize,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF1E293B),
                  ),
                ),
              ),
              Expanded(
                child: TextFormField(
                  controller: _amountController,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp(r'^\d+\.?\d{0,2}'),
                    ),
                  ],
                  style: TextStyle(
                    fontSize: amountSize,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF1E293B),
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '0.00',
                    hintStyle: TextStyle(
                      fontSize: amountSize,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFFCBD5E1),
                    ),
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    required TextEditingController controller,
    required double labelSize,
    required double inputSize,
    required double inputHeight,
    required bool isVerySmall,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: labelSize,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF1E293B),
          ),
        ),
        SizedBox(height: isVerySmall ? 4 : 6),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: TextFormField(
            controller: controller,
            style: TextStyle(
              fontSize: inputSize,
              color: const Color(0xFF1E293B),
            ),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                fontSize: inputSize,
                color: const Color(0xFF94A3B8),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Color(0xFF2563EB),
                  width: 2,
                ),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: isVerySmall ? 12 : 16,
                vertical: isVerySmall ? 10 : (inputHeight - 20) / 2,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a description';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownField({
    required String label,
    required String? value,
    required List<String> items,
    required String hint,
    required ValueChanged<String?> onChanged,
    required double labelSize,
    required double inputSize,
    required double inputHeight,
    required bool isVerySmall,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: labelSize,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF1E293B),
          ),
        ),
        SizedBox(height: isVerySmall ? 4 : 6),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: DropdownButtonFormField<String>(
            value: value,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                fontSize: inputSize,
                color: const Color(0xFF94A3B8),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Color(0xFF2563EB),
                  width: 2,
                ),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: isVerySmall ? 12 : 16,
                vertical: isVerySmall ? 10 : (inputHeight - 20) / 2,
              ),
            ),
            style: TextStyle(
              fontSize: inputSize,
              color: const Color(0xFF1E293B),
            ),
            items: items.map((item) {
              return DropdownMenuItem<String>(
                value: item == hint ? null : item,
                child: Text(
                  item,
                  style: TextStyle(
                    fontSize: inputSize,
                    color: item == hint
                        ? const Color(0xFF94A3B8)
                        : const Color(0xFF1E293B),
                  ),
                ),
              );
            }).toList(),
            onChanged: onChanged,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please select a $label';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget _buildDatePicker({
    required double labelSize,
    required double inputSize,
    required double inputHeight,
    required bool isVerySmall,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Date',
          style: TextStyle(
            fontSize: labelSize,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF1E293B),
          ),
        ),
        SizedBox(height: isVerySmall ? 4 : 6),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: InkWell(
            onTap: _selectDate,
            borderRadius: BorderRadius.circular(12),
            child: Container(
              height: inputHeight,
              padding: EdgeInsets.symmetric(horizontal: isVerySmall ? 12 : 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFE2E8F0)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _selectedDate != null
                        ? '${_selectedDate!.month.toString().padLeft(2, '0')}/${_selectedDate!.day.toString().padLeft(2, '0')}/${_selectedDate!.year}'
                        : 'mm/dd/yyyy',
                    style: TextStyle(
                      fontSize: inputSize,
                      color: _selectedDate != null
                          ? const Color(0xFF1E293B)
                          : const Color(0xFF94A3B8),
                    ),
                  ),
                  const Icon(
                    Icons.calendar_today_outlined,
                    color: Color(0xFF64748B),
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildReceiptUpload({
    required double labelSize,
    required double inputSize,
    required double receiptHeight,
    required bool isVerySmall,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Receipt',
          style: TextStyle(
            fontSize: labelSize,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF1E293B),
          ),
        ),
        SizedBox(height: isVerySmall ? 4 : 6),
        Container(
          height: receiptHeight,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: const Color(0xFFE2E8F0),
              style: BorderStyle.solid,
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: InkWell(
            onTap: () {
              // Handle receipt upload
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Receipt upload feature coming soon'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            borderRadius: BorderRadius.circular(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.cloud_upload_outlined,
                  size: isVerySmall ? 28 : (receiptHeight < 130 ? 36 : 44),
                  color: const Color(0xFF2563EB),
                ),
                SizedBox(height: isVerySmall ? 4 : 8),
                Text(
                  'Click to upload or drag and drop',
                  style: TextStyle(
                    fontSize: isVerySmall
                        ? 10
                        : (receiptHeight < 130 ? 12 : 14),
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF1E293B),
                  ),
                ),
                SizedBox(height: isVerySmall ? 2 : 4),
                Text(
                  'SVG, PNG, JPG or PDF',
                  style: TextStyle(
                    fontSize: isVerySmall ? 8 : (receiptHeight < 130 ? 10 : 12),
                    color: const Color(0xFF64748B),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSaveButton({
    required double buttonHeight,
    required double buttonSize,
    required bool isVerySmall,
  }) {
    return SizedBox(
      width: double.infinity,
      height: buttonHeight,
      child: ElevatedButton(
        onPressed: _saveExpense,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2563EB),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
          padding: EdgeInsets.symmetric(horizontal: isVerySmall ? 12 : 16),
        ),
        child: Text(
          'Save Expense',
          style: TextStyle(fontSize: buttonSize, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF2563EB),
              onPrimary: Colors.white,
              onSurface: Color(0xFF1E293B),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _saveExpense() {
    if (_formKey.currentState!.validate()) {
      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Expense saved successfully!'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),
      );

      // Navigate back after short delay
      Future.delayed(const Duration(milliseconds: 500), () {
        Navigator.pop(context);
      });
    }
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    _amountController.dispose();
    super.dispose();
  }
}
