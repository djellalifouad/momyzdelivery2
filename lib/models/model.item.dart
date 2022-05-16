class Item {
  int id;

  int qty;
  String name;
  String description;
  String price;
  String image_url;

  Item(
      {required this.id,
      required this.image_url,
      required this.description,
      required this.name,
      required this.price,
      required this.qty});

  factory Item.fromMap(
    Map<String, dynamic> map,
  ) {
    print(map);
    return Item(
        image_url: map['image_url'].toString(),
        price: map['unit_price'].toString(),
        id: map['id'],
        description: map['description'].toString(),
        name: map['name'],
        qty: map['qty']);
  }
}
