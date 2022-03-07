import 'model.car.dart';

class Driver {
  String access_token;
  String token_type;
  int id;
  String name;
  String image_url;
  String phone;
  String country_code;
  String full_phone_number;
  int state;
  int express_delivery;
  Car car;
  
  Driver(
      {required this.access_token,
      required this.car,
      required this.country_code,
      required this.express_delivery,
      required this.id,
      required this.image_url,
      required this.full_phone_number,
      required this.phone,
      required this.token_type,
      required this.name,
      required this.state});
  factory Driver.fromMap(Map<String, dynamic> map) {
    return Driver(
      express_delivery: map['express_delivery'],
      access_token: map['access_token'],
      token_type: map['token_type'],
      id: map['id'],
      name: map['name'],
      image_url: map['image_url'],
      phone: map['phone'],
      country_code: map['country_code'],
      full_phone_number: map['full_phone_number'],
      state: map['state'],
      car: Car.fromMap(map['car']),
    );
  }
}
