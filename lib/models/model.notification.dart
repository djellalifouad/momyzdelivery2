class Notification {
  String title;
  String body;
  Notification({required this.title, required this.body});
  factory Notification.fromMap(Map<String, dynamic> map) {
    return Notification(
        title: map['data']['title'], body: map['data']['body']);
  }
}
