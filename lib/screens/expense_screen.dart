import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/expense_provider.dart';
import 'add_expense_screen.dart';

class ExpenseScreen extends StatelessWidget {
  const ExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ExpenseProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Monthly Expenses")),
      body: Column(
        children: [
          // TOTAL
          Container(
            padding: const EdgeInsets.all(16),
            child: Text(
              "Total: ₱${provider.total.toStringAsFixed(2)}",
              style: const TextStyle(
                  fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),

          // LIST
          Expanded(
            child: provider.expenses.isEmpty
                ? const Center(child: Text("No expenses yet"))
                : ListView.separated(
                    itemCount: provider.expenses.length,
                    separatorBuilder: (_, __) =>
                        const Divider(),
                    itemBuilder: (context, index) {
                      final expense =
                          provider.expenses[index];

                      return ListTile(
                        tileColor: Colors.green.shade200,
                        title: Text(expense.title),
                        trailing:
                            Text("₱${expense.amount}"),
                        onLongPress: () {
                          provider.deleteExpense(index);
                        },
                      );
                    },
                  ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) =>
                  const AddExpenseScreen(),
            ),
          );
        },
      ),
    );
  }
}