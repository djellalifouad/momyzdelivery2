class Comment {
  int id;
  String message;
  String image_url;
  String created_at;
  String sender;
  Comment(
      {required this.image_url,
      required this.sender, 
      required this.id,
      required this.message,
      required this.created_at});
  factory Comment.fromMap(Map<String, dynamic> map) {
    return Comment(
      sender: map['sender'],
        image_url: map['image_url'],
        id: map['id'],
        message: map['message'],
        created_at: map['created_at']);
  }
}
