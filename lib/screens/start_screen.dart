import 'package:flutter/material.dart';
import 'expense_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Start")),
      body: Center(
        child: ElevatedButton(
          child: const Text("Open Expense Tracker"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const ExpenseScreen(),
              ),
            );
          },
        ),
      ),
    );
  }
}