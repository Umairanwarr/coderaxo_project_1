import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/stripe_payment_controller.dart';

class StripePaymentScreen extends StatelessWidget {
  const StripePaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final StripePaymentController controller = Get.put(StripePaymentController());

    const primaryColor = Color(0xFF2FC1BE);
    const stripePurpleColor = Color(0xFF635BFF);
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
          'Payment',
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
              // 1. Total Amount Card (Linear Gradient)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF47D7D4),
                      Color(0xFF2FC1BE),
                      Color(0xFF0CA9A6),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Total amount',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '\$1,774,000',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Including taxes and fees',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.receipt_long_outlined,
                      size: 60,
                      color: Colors.white.withOpacity(0.3),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // 2. Payment Method Switcher Chips
              Obx(() => SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildPaymentTab('Card', 0, controller, primaryColor),
                        const SizedBox(width: 8),
                        _buildPaymentTab('Wallet', 1, controller, primaryColor),
                        const SizedBox(width: 8),
                        _buildPaymentTab('PayPal', 2, controller, primaryColor),
                        const SizedBox(width: 8),
                        _buildPaymentTab('Stripe', 3, controller, primaryColor),
                      ],
                    ),
                  )),

              const SizedBox(height: 24),

              // 3. Stripe Title Header
              const Center(
                child: Text(
                  'stripe',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: stripePurpleColor,
                    letterSpacing: -1.0,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // 4. Saved Accounts Section
              const Text(
                'Saved Accounts',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Row(
                  children: [
                    // Stripe 'S' Avatar Icon
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: stripePurpleColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'S',
                        style: TextStyle(
                          color: stripePurpleColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(width: 14),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(() => Text(
                              controller.savedAccountName.value,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.black87,
                              ),
                            )),
                        const SizedBox(height: 2),
                        Obx(() => Text(
                              controller.savedAccountEmail.value,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade500,
                              ),
                            )),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // 5. Add Account Button Section
              const Text(
                'Add Account',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: controller.addStripeAccount,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD4F1EE), // Light Teal Pill Button
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: const Text(
                    'stripe',
                    style: TextStyle(
                      color: stripePurpleColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      letterSpacing: -0.8,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // 6. Secure Payment Notice Box
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.lock_outline, color: primaryColor, size: 22),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Secure Payment',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Your payment information is encrypted and secure. We never store your full card details.',
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey.shade500,
                              height: 1.3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // 7. Terms Notice Text
              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
                    children: const [
                      TextSpan(text: 'By completing this booking, you agree to the '),
                      TextSpan(
                        text: 'Terms of\nService',
                        style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: ' and '),
                      TextSpan(
                        text: 'Cancellation Policy.',
                        style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
                      ),
                    ],
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

  Widget _buildPaymentTab(
    String title,
    int index,
    StripePaymentController controller,
    Color primaryColor,
  ) {
    bool isSelected = controller.selectedPaymentMethod.value == index;
    return GestureDetector(
      onTap: () => controller.selectedPaymentMethod.value = index,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? primaryColor : Colors.grey.shade300,
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}