class Expense {
  final String title;
  final double amount;

  Expense({required this.title, required this.amount});

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'amount': amount,
    };
  }

  factory Expense.fromJson(Map<String, dynamic> json) {
    return Expense(
      title: json['title'],
      amount: json['amount'],
    );
  }
}