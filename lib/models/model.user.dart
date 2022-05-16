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
  String personal_id;
  int express_delivery;
  Car? car;
  String driving_licence_image_url;
  String car_registration_certificate_image_url;
  int online;
  String wallet;
  double lon;
  double lat;

  Driver({
    required this.lon,
    required this.lat,
    required this.wallet,
    required this.personal_id,
    required this.access_token,
    required this.state,
    required this.car_registration_certificate_image_url,
    required this.driving_licence_image_url,
    required this.car,
    required this.country_code,
    required this.express_delivery,
    required this.id,
    required this.image_url,
    required this.full_phone_number,
    required this.phone,
    required this.token_type,
    required this.name,
    required this.online,
  });
  factory Driver.fromMap(Map<String, dynamic> map) {
    if (map == null) {
      return null!;
    }
    return Driver(
      lon: map['lon'],
      lat: map['lat'],
      wallet: map['wallet'].toString(),
      online: map['online'],
      personal_id: map['personal_id'].toString(),
      car_registration_certificate_image_url:
          map['car_registration_certificate_image_url'].toString(),
      driving_licence_image_url: map['driving_licence_image_url'].toString(),
      express_delivery: map['express_delivery'],
      access_token: map['access_token'].toString(),
      token_type: map['token_type'].toString(),
      id: map['id'],
      name: map['name'],
      image_url: map['image_url'],
      phone: map['phone'],
      country_code: map['country_code'],
      full_phone_number: map['full_phone_number'],
      state: map['state'],
      car: map['car'] == null ? null : Car.fromMap(map['car']),
    );
  }
}
