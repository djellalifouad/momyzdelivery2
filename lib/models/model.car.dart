class Car {
  int id;
  String name;
  String model;
  int card_number;
  Car(
      {required this.id,
      required this.name,
      required this.model,
      required this.card_number});
  factory Car.fromMap(Map<String, dynamic> map) {
    return Car(
        id: map['id'],
        name: map['name'],
        model: map['model'],
        card_number: map['car_number']); 
  }
}
