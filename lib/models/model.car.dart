import 'model.image.dart';

class Car {
  int id;
  String name;
  String model;
  String card_number;

  String car_registration_certificate_image_url;
  List<Images> images = [];
  Car(
      {required this.id,
      required this.car_registration_certificate_image_url,
      required this.name,
      required this.model,
      required this.images,
      required this.card_number});
  factory Car.fromMap(Map<String, dynamic> map) {
    List<Images> images2 = [];
    for (int i = 0; i < map['images'].length; i++) {
      images2.add(Images.fromMap(map['images'][i]));
    }
    return Car(
        images: images2,
        id: map['id'],
        car_registration_certificate_image_url:
            map['car_registration_certificate_image_url'],
        name: map['name'],
        model: map['model'],
        card_number: map['car_number']);
  }
}
