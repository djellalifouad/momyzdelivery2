class Store {
  String name;
  String bio;
  String username;
  String image_url;
  String phone;
  String country_code;
  String full_phone_number;
  int state;
  int type;
  double lat;
  double lon;
  String address;
  String banned_to;
  Store(
      {required this.address,
      required this.banned_to,
      required this.country_code,
      required this.username,
      required this.bio,
      required this.name,
      required this.phone,
      required this.full_phone_number,
      required this.image_url,
      required this.lon,
      required this.type,
      required this.state,
      required this.lat});
  factory Store.fromMap(Map<String, dynamic> map) {
    return Store(
        lat: map['lat'],
        address: map['address'],
        banned_to: map['banned_to'].toString(),
        country_code: map['country_code'],
        username: map['username'],
        bio: map['bio'].toString(),
        name: map['name'],
        phone: map['phone'],
        full_phone_number: map['full_phone_number'],
        image_url: map['image_url'],
        lon: map['lon'],
        type: map['type'],
        state: map['state']);
  }
}
