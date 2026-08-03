import 'package:coderaxo_project_1/screens/booking_confirmation_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/payment_controller.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  // Theme colors
  static const Color primaryTeal = Color(0xFF2FC1BE);
  static const Color bgColor = Color(0xFFF3F6F7);
  static const Color darkText = Colors.black;
  static const Color subText = Color(0xFF6B7280);
  static const Color tabInactiveBg = Color(0xFFFDECEC);
  static const Color walletGreen = Color(0xFF3AB77E);
  static const Color walletBgLight = Color(0xFFDFF5E1);

  @override
  Widget build(BuildContext context) {
    final PaymentController controller = Get.put(PaymentController());

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header with back button
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: const Icon(
                            Icons.chevron_left,
                            color: primaryTeal,
                            size: 32,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'Payment',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: primaryTeal,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // Total Amount Card
                    _buildTotalAmountCard(),

                    const SizedBox(height: 24),

                    // Payment Method Tabs
                    Obx(() => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildTab(
                          label: 'Card',
                          isSelected: controller.selectedMethod.value == 'card',
                          onTap: () => controller.selectMethod('card'),
                        ),
                        _buildTab(
                          label: 'Wallet',
                          isSelected: controller.selectedMethod.value == 'wallet',
                          onTap: () => controller.selectMethod('wallet'),
                        ),
                        _buildTab(
                          label: 'Apple pay',
                          isSelected: controller.selectedMethod.value == 'apple',
                          onTap: () => controller.selectMethod('apple'),
                        ),
                      ],
                    )),

                    const SizedBox(height: 24),

                    // Dynamic content based on selected tab
                    Obx(() {
                      switch (controller.selectedMethod.value) {
                        case 'card':
                          return _buildCardView(controller);
                        case 'wallet':
                          return _buildWalletView();
                        case 'apple':
                        default:
                          return _buildApplePayView();
                      }
                    }),

                    const SizedBox(height: 16),

                    // Secure Payment info
                    _buildSecurePayment(),

                    const SizedBox(height: 20),

                    // Terms of Service & Cancellation
                    _buildTermsText(),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),

            // Bottom Pay button (only for Card & Wallet)
            Obx(() {
              if (controller.selectedMethod.value == 'apple') {
                return const SizedBox.shrink();
              }
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                color: bgColor,
                child: GestureDetector(
                  onTap: (){
                    Get.off(()=> const BookingConfirmationScreen());
                    controller.pay();
                    },
                  child: Container(
                    height: 54,
                    decoration: BoxDecoration(
                      color: primaryTeal,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.lock_outline,
                          color: Colors.white,
                          size: 18,
                        ),
                        const SizedBox(width: 6),
                        const Text(
                          'Pay \$1774',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  // ============= Total Amount Card =============
  Widget _buildTotalAmountCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: primaryTeal,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Total amount',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 14),
              const Text(
                '\$1774',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Including taxes and fees',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.white.withOpacity(0.9),
                ),
              ),
            ],
          ),
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: Icon(
              Icons.receipt_long_outlined,
              size: 90,
              color: Colors.white.withOpacity(0.2),
            ),
          ),
        ],
      ),
    );
  }

  // ============= Tab Widget =============
  Widget _buildTab({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? primaryTeal : Color(0xFFFDFEFF),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: Color(0xFFBCBCBC).withOpacity(0.24)
          ),
          boxShadow:
               [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 4,
              offset: const Offset(0, 4),
            ),
          ]
        ),
        child: Text(
          label,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: isSelected ? Colors.white : primaryTeal,
          ),
        ),
      ),
    );
  }

  // ============= Apple Pay View =============
  Widget _buildApplePayView() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
      decoration: BoxDecoration(
        color: Color(0xFFFDFDFD),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Color(0xFF918C8C).withOpacity(0.35)
        )
      ),
      child: Column(
        children: [
          // Apple Pay logo (icon + text)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Icon(Icons.apple, size: 50, color: Colors.black),
              const SizedBox(width: 4),
              const Text(
                'Pay',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 34,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'Fast and secure payment with Apple Pay',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: darkText,
            ),
          ),
          const SizedBox(height: 24),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                color: Color(0xFF040404),
                borderRadius: BorderRadius.circular(30),
              ),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.apple, color: Colors.white, size: 24),
                  SizedBox(width: 8),
                  Text(
                    'Pay with Apple Pay',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============= Wallet View =============
  Widget _buildWalletView() {
    return Column(
      children: [
        // Wallet Balance card
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Color(0xFFC9FACF).withOpacity(0.44),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Color(0xFF2FBF53).withOpacity(0.94),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.account_balance_wallet_outlined,
                      color: Colors.white,
                      size: 26,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Wallet Balance',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF918C8C),
                        ),
                      ),
                      const SizedBox(height: 2),
                      const Text(
                        '\$2950.00',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                          color: walletGreen,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Text(
                'You have sufficient balance to complete this booking.',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF918C8C),
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 14),

        // Remaining balance card
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
            color: Color(0xFFFDFDFD),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Color(0xFF918C8C).withOpacity(0.35)
            )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Remaining balance after payment:',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: darkText,
                ),
              ),
              Text(
                '\$1176',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: primaryTeal,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ============= Card View =============
  Widget _buildCardView(PaymentController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Card Details Form
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Icon(Icons.credit_card, color: primaryTeal, size: 22),
                  SizedBox(width: 8),
                  Text(
                    'Card Details',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: darkText,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Card Number
              _buildFormLabel('Card Number'),
              const SizedBox(height: 6),
              _buildTextField(
                controller: controller.cardNumberController,
                hint: '1234 5678 9012 3456',
                keyboardType: TextInputType.number,
              ),

              const SizedBox(height: 14),

              // Expiry + CVV
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildFormLabel('Expiry Date'),
                        const SizedBox(height: 6),
                        _buildTextField(
                          controller: controller.expiryDateController,
                          hint: 'MM/YY',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildFormLabel('CVV'),
                        const SizedBox(height: 6),
                        _buildTextField(
                          controller: controller.cvvController,
                          hint: '123',
                          keyboardType: TextInputType.number,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 14),

              // Cardholder Name
              _buildFormLabel('Cardholder Name'),
              const SizedBox(height: 6),
              _buildTextField(
                controller: controller.cardholderNameController,
                hint: '',
              ),

              const SizedBox(height: 20),

              // Save Card button (centered)
              Center(
                child: GestureDetector(
                  onTap: controller.saveCard,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 34,
                      vertical: 14,
                    ),
                    decoration: BoxDecoration(
                      color: primaryTeal,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Text(
                      'Save Card',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),

        // Saved Cards heading
        const Text(
          'Saved Cards',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: darkText,
          ),
        ),

        const SizedBox(height: 12),

        // Saved Card item
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),

              border: Border.all(
                  color: Color(0xFF918C8C).withOpacity(0.35)
              )
          ),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: primaryTeal,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.credit_card,
                  color: Colors.white,
                  size: 26,
                ),
              ),
              const SizedBox(width: 14),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Text(
                        '•••• •••• •••• ',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: darkText,
                        ),
                      ),
                      Text(
                        '4242',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Expires 12/25',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 13,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ============= Form Helpers =============
  Widget _buildFormLabel(String label) {
    return Text(
      label,
      style: const TextStyle(
        fontFamily: 'Poppins',
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: darkText,
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    TextInputType? keyboardType,
  }) {
    return Container(
      height: 44,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        style: const TextStyle(
          fontFamily: 'Inter',
          fontSize: 14,
          color: darkText,
        ),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            color: Colors.grey.shade400,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 10,
          ),
        ),
      ),
    );
  }

  // ============= Secure Payment info =============
  Widget _buildSecurePayment() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Color(0xFFFDFDFD),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Color(0xFF918C8C).withOpacity(0.35)
        )
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.lock_outline, color: primaryTeal, size: 22),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Secure Payment',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Your payment information is encrypted and secure. We never store your full card details.',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF807F7F),
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ============= Terms Text =============
  Widget _buildTermsText() {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          fontFamily: 'Inter',
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: darkText,
          height: 1.5,
        ),
        children: [
          TextSpan(text: 'By completing this booking, you agree to the ',style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12,
            fontFamily:  GoogleFonts.poppins().fontFamily
          )),
          TextSpan(
            text: 'Terms of Service',
            style: const TextStyle(
              color: primaryTeal,
              fontWeight: FontWeight.w400,
              fontSize: 12
            ),
          ),
          TextSpan(text: ' and ',style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12,
              fontFamily:  GoogleFonts.poppins().fontFamily
          )
          ),
          TextSpan(
            text: 'Cancellation Policy.',
            style: const TextStyle(
              color: primaryTeal,
              fontWeight: FontWeight.w400,
              fontSize: 12
            ),
          ),
        ],
      ),
    );
  }
}