// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExpenseTrackingScreen extends StatefulWidget {
  const ExpenseTrackingScreen({super.key});

  @override
  State<ExpenseTrackingScreen> createState() => _ExpenseTrackingScreenState();
}

class _ExpenseTrackingScreenState extends State<ExpenseTrackingScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracking',
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
      home: const ExpenseTracking(),
    );
  }
}

class ExpenseTracking extends StatefulWidget {
  const ExpenseTracking({super.key});

  @override
  State<ExpenseTracking> createState() => _ExpenseTrackingState();
}

class _ExpenseTrackingState extends State<ExpenseTracking> {
  String _selectedFilter = 'All';

  final List<Map<String, dynamic>> _transactions = [
    {
      'title': 'HVAC Repair',
      'location': 'Ocean View Apt',
      'date': 'Oct 24',
      'amount': '\$150.00',
      'category': 'Maintenance',
      'color': const Color(0xFF3B82F6),
    },
    {
      'title': 'Water Bill',
      'location': 'Sunset Villa',
      'date': 'Oct 22',
      'amount': '\$85.50',
      'category': 'Utilities',
      'color': const Color(0xFF10B981),
    },
    {
      'title': 'Repainting Hallway',
      'location': 'Sunset Villa',
      'date': 'Oct 20',
      'amount': '\$400.00',
      'category': 'Renovation',
      'color': const Color(0xFF8B5CF6),
    },
    {
      'title': 'Property Tax Q3',
      'location': 'Multiple Properties',
      'date': 'Oct 15',
      'amount': '\$1200.00',
      'category': 'Tax',
      'color': const Color(0xFFEF4444),
    },
  ];

  List<String> get _categories {
    return ['All', 'Maintenance', 'Utilities', 'Tax'];
  }

  List<Map<String, dynamic>> get _filteredTransactions {
    if (_selectedFilter == 'All') {
      return _transactions;
    }
    return _transactions
        .where((t) => t['category'] == _selectedFilter)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 360;
    final isMediumScreen = screenWidth >= 360 && screenWidth < 600;

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        title: Text(
          'Expense Tracking',
          style: TextStyle(
            fontSize: isSmallScreen ? 18 : 20,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF1E293B),
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.search_outlined, color: Color(0xFF64748B)),
            onPressed: () {},
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
          IconButton(
            icon: const Icon(
              Icons.filter_list_outlined,
              color: Color(0xFF64748B),
            ),
            onPressed: () {},
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Total Expenses Card
            _buildTotalExpensesCard(isSmallScreen, isMediumScreen),
            SizedBox(height: isSmallScreen ? 12 : 16),

            // AI Insight Card
            _buildAIInsightCard(isSmallScreen),
            SizedBox(height: isSmallScreen ? 16 : 24),

            // Transactions Header
            _buildTransactionsHeader(isSmallScreen),
            SizedBox(height: isSmallScreen ? 8 : 12),

            // Filter Chips
            _buildFilterChips(isSmallScreen),
            SizedBox(height: isSmallScreen ? 12 : 16),

            // Transaction List
            ..._buildTransactionList(isSmallScreen),
          ],
        ),
      ),
    );
  }

  Widget _buildTotalExpensesCard(bool isSmallScreen, bool isMediumScreen) {
    return Container(
      padding: EdgeInsets.all(isSmallScreen ? 16 : 20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF2563EB), Color(0xFF3B82F6)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF2563EB).withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Fixed overflow issue by using Expanded and wrapping the chip
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  'Total Expenses (This Month)',
                  style: TextStyle(
                    fontSize: isSmallScreen ? 12 : 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white70,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 8),
              Flexible(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: isSmallScreen ? 6 : 10,
                    vertical: isSmallScreen ? 3 : 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.trending_up,
                        color: Colors.white,
                        size: 14,
                      ),
                      SizedBox(width: isSmallScreen ? 2 : 4),
                      Text(
                        '+5% vs last month',
                        style: TextStyle(
                          fontSize: isSmallScreen ? 9 : 11,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: isSmallScreen ? 4 : 8),
          Text(
            '\$4,250.00',
            style: TextStyle(
              fontSize: isSmallScreen ? 24 : 32,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          SizedBox(height: isSmallScreen ? 2 : 4),
          Text(
            '2 pending bills • 4 paid',
            style: TextStyle(
              fontSize: isSmallScreen ? 11 : 13,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAIInsightCard(bool isSmallScreen) {
    return Container(
      padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(isSmallScreen ? 8 : 10),
            decoration: BoxDecoration(
              color: const Color(0xFF8B5CF6).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.auto_awesome,
              color: const Color(0xFF8B5CF6),
              size: isSmallScreen ? 20 : 24,
            ),
          ),
          SizedBox(width: isSmallScreen ? 8 : 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 8,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      'AI Insight',
                      style: TextStyle(
                        fontSize: isSmallScreen ? 12 : 13,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF1E293B),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF8B5CF6),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        'NEW',
                        style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: isSmallScreen ? 2 : 4),
                Text(
                  'Utilities are 15% higher than average this month. Consider checking for leaks at Sunset Villa.',
                  style: TextStyle(
                    fontSize: isSmallScreen ? 12 : 13,
                    color: const Color(0xFF64748B),
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

  Widget _buildTransactionsHeader(bool isSmallScreen) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Transactions',
          style: TextStyle(
            fontSize: isSmallScreen ? 16 : 18,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF1E293B),
          ),
        ),
        Row(
          children: [
            Text(
              'Sort by Date',
              style: TextStyle(
                fontSize: isSmallScreen ? 11 : 13,
                color: const Color(0xFF64748B),
              ),
            ),
            const SizedBox(width: 4),
            const Icon(Icons.arrow_drop_down, color: Color(0xFF64748B)),
          ],
        ),
      ],
    );
  }

  Widget _buildFilterChips(bool isSmallScreen) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: _categories.map((category) {
          final isSelected = _selectedFilter == category;
          return Padding(
            padding: EdgeInsets.only(right: isSmallScreen ? 6 : 8),
            child: FilterChip(
              selected: isSelected,
              label: Text(
                category,
                style: TextStyle(
                  fontSize: isSmallScreen ? 11 : 13,
                  fontWeight: FontWeight.w600,
                  color: isSelected ? Colors.white : const Color(0xFF64748B),
                ),
              ),
              onSelected: (selected) {
                setState(() {
                  _selectedFilter = category;
                });
              },
              backgroundColor: const Color(0xFFF1F5F9),
              selectedColor: const Color(0xFF2563EB),
              checkmarkColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                  color: isSelected
                      ? const Color(0xFF2563EB)
                      : Colors.transparent,
                ),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: isSmallScreen ? 8 : 12,
                vertical: isSmallScreen ? 4 : 8,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  List<Widget> _buildTransactionList(bool isSmallScreen) {
    final filtered = _filteredTransactions;
    if (filtered.isEmpty) {
      return [
        Container(
          padding: const EdgeInsets.all(40),
          alignment: Alignment.center,
          child: Text(
            'No transactions found',
            style: TextStyle(
              fontSize: isSmallScreen ? 14 : 16,
              color: const Color(0xFF94A3B8),
            ),
          ),
        ),
      ];
    }

    return filtered.asMap().entries.map((entry) {
      final index = entry.key;
      final transaction = entry.value;
      return Column(
        children: [
          _buildTransactionItem(
            title: transaction['title'],
            location: transaction['location'],
            date: transaction['date'],
            amount: transaction['amount'],
            category: transaction['category'],
            color: transaction['color'],
            isSmallScreen: isSmallScreen,
          ),
          if (index < filtered.length - 1)
            SizedBox(height: isSmallScreen ? 8 : 12),
        ],
      );
    }).toList();
  }

  Widget _buildTransactionItem({
    required String title,
    required String location,
    required String date,
    required String amount,
    required String category,
    required Color color,
    required bool isSmallScreen,
  }) {
    return Container(
      padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
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
      child: Row(
        children: [
          // Category Icon
          Container(
            width: isSmallScreen ? 40 : 48,
            height: isSmallScreen ? 40 : 48,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              _getCategoryIcon(category),
              color: color,
              size: isSmallScreen ? 20 : 24,
            ),
          ),
          SizedBox(width: isSmallScreen ? 10 : 14),

          // Transaction Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: isSmallScreen ? 13 : 15,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF1E293B),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: isSmallScreen ? 1 : 2),
                Text(
                  '$location • $date',
                  style: TextStyle(
                    fontSize: isSmallScreen ? 11 : 13,
                    color: const Color(0xFF64748B),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: isSmallScreen ? 2 : 4),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: isSmallScreen ? 6 : 8,
                    vertical: isSmallScreen ? 1 : 2,
                  ),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    category,
                    style: TextStyle(
                      fontSize: isSmallScreen ? 9 : 11,
                      fontWeight: FontWeight.w600,
                      color: color,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Amount
          Text(
            amount,
            style: TextStyle(
              fontSize: isSmallScreen ? 14 : 16,
              fontWeight: FontWeight.w700,
              color: const Color(0xFFEF4444),
            ),
          ),
        ],
      ),
    );
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'Maintenance':
        return Icons.build_outlined;
      case 'Utilities':
        return Icons.water_drop_outlined;
      case 'Tax':
        return Icons.receipt_long_outlined;
      case 'Renovation':
        return Icons.brush_outlined;
      default:
        return Icons.attach_money;
    }
  }
}
