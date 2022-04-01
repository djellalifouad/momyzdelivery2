import 'package:flutter/material.dart';

class Images {
  int id;
  String image_url;
  Images({required this.image_url, required this.id});
  factory Images.fromMap(Map<String, dynamic> map) {
    return Images(id: map['id'], image_url: map['image_url']);
  }
}