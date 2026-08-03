import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/expenses_controller.dart';

class ExpensesScreen extends StatelessWidget {
  const ExpensesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ExpensesController controller = Get.put(ExpensesController());

    const primaryColor = Color(0xFF2FC1BE);
    const backgroundColor = Color(0xFFF7F9F9);
    const expenseRedColor = Color(0xFFFF4D6D);

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
          'Expenses',
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
              // 1. Time Filter Tabs
              Obx(() => SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildFilterTab('This Month', 0, controller, primaryColor),
                        const SizedBox(width: 8),
                        _buildFilterTab('Last 3 Months', 1, controller, primaryColor),
                        const SizedBox(width: 8),
                        _buildFilterTab('Year to Date', 2, controller, primaryColor),
                      ],
                    ),
                  )),

              const SizedBox(height: 20),

              // 2. Total Expenses Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'TOTAL EXPENSES',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey.shade400,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.8,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Obx(() => Text(
                          controller.totalExpenses.value,
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        )),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF0F2),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: const Color(0xFFFFD1D8)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.trending_down, color: expenseRedColor, size: 14),
                          const SizedBox(width: 4),
                          Obx(() => Text(
                                controller.comparisonText.value,
                                style: const TextStyle(
                                  color: expenseRedColor,
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // 3. Expense Trend Chart Card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Expense Trend',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF0F4F4),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.calendar_today_outlined,
                                  size: 13, color: Colors.grey.shade600),
                              const SizedBox(width: 6),
                              Text(
                                'Oct 1 - Oct 31',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // Weekly Expense Bars
                    Obx(() => SizedBox(
                          height: 130,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              _buildBar('W1', 60, 0, controller, expenseRedColor),
                              _buildBar('W2', 100, 1, controller, expenseRedColor),
                              _buildBar('W3', 70, 2, controller, expenseRedColor),
                              _buildBar('W4', 70, 3, controller, expenseRedColor),
                              _buildBar('W5', 50, 4, controller, expenseRedColor),
                            ],
                          ),
                        )),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // 4. Recent Transactions Header Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Recent Transactions',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  GestureDetector(
                    onTap: controller.viewAllTransactions,
                    child: const Text(
                      'View All',
                      style: TextStyle(
                        fontSize: 13,
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // 5. Recent Transactions List
              Obx(() => ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.transactions.length,
                    itemBuilder: (context, index) {
                      final item = controller.transactions[index];
                      return _buildTransactionCard(item, expenseRedColor);
                    },
                  )),

              const SizedBox(height: 24),

              // 6. Export Full Report Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: controller.exportReport,
                  icon: const Icon(Icons.download_rounded, color: Colors.white, size: 20),
                  label: const Text(
                    'Export Full Report',
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

  Widget _buildFilterTab(
    String title,
    int index,
    ExpensesController controller,
    Color primaryColor,
  ) {
    bool isSelected = controller.selectedPeriodIndex.value == index;
    return GestureDetector(
      onTap: () => controller.selectedPeriodIndex.value = index,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
            color: isSelected ? Colors.white : Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
      ),
    );
  }

  Widget _buildBar(
    String label,
    double height,
    int index,
    ExpensesController controller,
    Color activeColor,
  ) {
    bool isActive = controller.activeBarIndex.value == index;
    return GestureDetector(
      onTap: () => controller.activeBarIndex.value = index,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 38,
            height: height,
            decoration: BoxDecoration(
              color: isActive ? activeColor : const Color(0xFFFFD1D8),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              color: isActive ? Colors.black87 : Colors.grey.shade500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionCard(
    ExpenseTransaction item,
    Color expenseColor,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFF7F9F9),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(item.icon, color: Colors.black87, size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '${item.date}  •  ${item.refNumber}',
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey.shade400,
                  ),
                ),
              ],
            ),
          ),
          Text(
            item.amount,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: expenseColor,
            ),
          ),
          const SizedBox(width: 6),
          Icon(Icons.chevron_right, color: Colors.grey.shade400, size: 18),
        ],
      ),
    );
  }
}