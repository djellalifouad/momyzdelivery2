import 'model.item.dart';
import 'model.store.dart';
import 'model.user2.dart';

class Order {
  int id;
  String rate;
  String rate_note;
  String total;
  String subtotal;
  String address;
  double lon;
  double lat;
  String coupon_value;
  String value_added_tax;
  String phone;
  String name;
  int delivery_type;
  int shipping;
  int state;
  int payment_method;
  String date;
  String note;
  User2? user;
  List<Item> items;
  Store? store;
  Order(
      {required this.id,
      required this.user,
      required this.store,
      required this.items,
      required this.rate,
      required this.rate_note,
      required this.total,
      required this.subtotal,
      required this.address,
      required this.lon,
      required this.lat,
      required this.coupon_value,
      required this.value_added_tax,
      required this.phone,
      required this.name,
      required this.delivery_type,
      required this.shipping,
      required this.state,
      required this.payment_method,
      required this.date,
      required this.note});
  factory Order.fromMap(Map<String, dynamic> map) {
    List<Item> itemss = [];
    for (int i = 0; i < map['items'].length; i++) {
      itemss.add(Item.fromMap(map['items'][i]));
    }
    print(map);
    return Order(
        id: map['id'],
        user: map['user'] == null ? null : User2.fromMap(map['user']),
        store: map['store'] == null ? null : Store.fromMap(map['store']),
        items: itemss,
        rate: map['rate'].toString(),
        rate_note: map['rate_note'].toString(),
        total: map['total'].toString(),
        subtotal: map['subtotal'].toString(),
        address: map['address'],
        lon: map['lon'],
        lat: map['lat'],
        coupon_value: map['coupon_value'].toString(),
        value_added_tax: map['value_added_tax'].toString(),
        phone: map['phone'],
        name: map['name'],
        delivery_type: map['delivery_type'],
        shipping: map['shipping'],
        state: map['state'],
        payment_method: map['payment_method'],
        date: map['date'],
        note: map['note'].toString());
  }
}
