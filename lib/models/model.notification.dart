class NotificationModel {
  String title;
  String body;
  String created_at;
  String route;
  dynamic order_id;
  NotificationModel(
      {required this.title,
      required this.body,
      required this.order_id,
      required this.created_at,
      required this.route});
  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
        order_id: map['data']['route'].toString() == "home"
            ? []
            : map['data']['meta']['order_id'].toString(),
        created_at: map['created_at'].toString(),
        title: map['data']['title'].toString(),
        route: map['data']['route'].toString(),
        body: map['data']['body'].toString());
  }
}
