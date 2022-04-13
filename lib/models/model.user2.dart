class User2 {
  int id;
  String first_name;
  String last_name;
  String image_url;
  String username;
  String phone;
  String country_code;
  String full_phone_number;
  String address;

  User2(
      {required this.country_code,
      required this.image_url,
      required this.address,
      required this.first_name,
      required this.last_name,
      required this.phone,
      required this.full_phone_number,
      required this.username,
      required this.id});
  factory User2.fromMap(Map<String, dynamic> map) {
    print('map user');
    print(map);

    return User2(
        address: map['address'].toString(),
        country_code: map['country_code'],
        image_url: map['image_url'],
        first_name: map['first_name'].toString(),
        last_name: map['last_name'].toString(),
        phone: map['phone'],
        full_phone_number: map['full_phone_number'],
        username: map['username'],
        id: map['id']);
  }
}
