class Transaction {
  int id;
  String description;
  String amount;
  String iban;
  int state;
  String model_type;
  String created_at;
  Transaction(
      {required this.id,
      required this.created_at,
      required this.description,
      required this.amount,
      required this.iban,
      required this.model_type,
      required this.state});
  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
        created_at: map['created_at'].toString(),
        model_type: map['model_type'].toString(),
        id: map['id'],
        description: map['description'].toString(),
        amount: map['amount'].toString(),
        iban: map['iban'].toString(),
        state: map['state']);
  }
}
