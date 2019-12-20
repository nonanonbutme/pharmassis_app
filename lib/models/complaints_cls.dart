import 'package:flutter/material.dart';

class Complaints {
  final String id;
  final String title;
  final String description;
  /*final double price;
  final String image;
  final bool isFavorite;*/
  final String userEmail;
  final String userId;

  Complaints(
      {@required this.id,
        @required this.title,
        @required this.description,
       /* @required this.price,
        @required this.image,*/
        @required this.userEmail,
        @required this.userId,
        /*this.isFavorite = false*/});
}
