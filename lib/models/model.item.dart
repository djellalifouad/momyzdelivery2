class Item {
  int id;
  int product_id;
  int qty;
  String name;
  String description;
  String price;
  String image_url;

  Item(
      {required this.id,
      required this.image_url,
      required this.description,
      required this.product_id,
      required this.name,
      required this.price,
      required this.qty});

  factory Item.fromMap(
    Map<String, dynamic> map,
  ) {
    return Item(
        image_url: map['image_url'].toString(),
        price: map['unit_price'].toString(),
        id: map['id'],
        description: map['description'].toString(),
        product_id: map['product_id'],
        name: map['name'],
        qty: map['qty']);
  }
}
