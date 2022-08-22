class SettigsModel {
  String? min_wthdrawal_ammount;
  SettigsModel({required this.min_wthdrawal_ammount});
  factory SettigsModel.fromMap(Map<String, dynamic> map) {
    return SettigsModel(
        min_wthdrawal_ammount: map['driver_min_withdrawal_amount']);
  }
}
