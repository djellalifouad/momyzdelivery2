class Ticket {
  int id;
  String title;
  String message;
  String image_url;
  int status;
  int is_answered;
  Ticket(
      {required this.id,
      required this.title,
      required this.image_url,
      required this.is_answered,
      required this.message,
      required this.status});
  factory Ticket.fromMap(Map<String, dynamic> map) {
    return Ticket(
      id: map['id'],
      title: map['title'],
      is_answered: map['is_answered'],
      image_url: map['image_url'],
      message: map['message'],
      status: map['status'],
    );
  }
}
