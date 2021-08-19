import 'package:flutter/material.dart';

class categories {
  final String id;
  final String title;
  final Color color;

 const categories({
    @required this.id,
   @required this.title,
    @required this.color = Colors.redAccent,
  });
}
