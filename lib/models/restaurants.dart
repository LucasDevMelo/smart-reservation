import 'package:flutter/material.dart';

class Restaurant {
  String name;
  String imagePath;
  String rating;
  String category;
  String description;
  String location;
  String coments;

  Restaurant({
    required this.name,
    required this.imagePath,
    required this.rating,
    required this.category,
    required this.description,
    required this.location,
    required this.coments,
  });

  String get _name => name;
  String get _imagePath => imagePath;
  String get _rating => rating;
  String get _category => category;
  String get _description => description;
  String get _location => location;
  String get _coments => coments;
}