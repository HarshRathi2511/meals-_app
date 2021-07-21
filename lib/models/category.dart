import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Color color; //for the background color of each Card

  const Category({
    @required this.id,
    @required this.title,
    this.color=Colors.orange
    });
}