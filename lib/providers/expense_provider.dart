import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/expense.dart';

class ExpenseProvider extends ChangeNotifier {
  List<Expense> _expenses = [];

  List<Expense> get expenses => _expenses;

  double get total =>
      _expenses.fold(0, (sum, item) => sum + item.amount);

  void addExpense(Expense expense) {
    _expenses.add(expense);
    saveExpenses();
    notifyListeners();
  }

  void deleteExpense(int index) {
    _expenses.removeAt(index);
    saveExpenses();
    notifyListeners();
  }

  Future<void> saveExpenses() async {
    final prefs = await SharedPreferences.getInstance();
    final data =
        _expenses.map((e) => jsonEncode(e.toJson())).toList();
    prefs.setStringList('expenses', data);
  }

  Future<void> loadExpenses() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getStringList('expenses');

    if (data == null || data.isEmpty) {
      
      _expenses = [
        Expense(title: "Food", amount: 2000),
        Expense(title: "Clothes", amount: 2500),
        Expense(title: "Electricity & Water", amount: 1500),
      ];
      saveExpenses();
    } else {
      _expenses = data
          .map((e) => Expense.fromJson(jsonDecode(e)))
          .toList();
    }

    notifyListeners();
  }
}