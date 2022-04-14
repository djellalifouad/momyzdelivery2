class NotificationModel {
  String title;
  String body;
  String created_at;
  NotificationModel(
      {required this.title, required this.body, required this.created_at});
  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
        created_at: map['created_at'].toString(),
        title: map['data']['title'].toString(),
        body: map['data']['body'].toString());
  }
}
