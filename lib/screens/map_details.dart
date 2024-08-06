import 'package:flutter/material.dart';
import 'package:healthcare/models/map.dart';
import 'package:healthcare/models/restaurants.dart';

class MapDetails extends StatelessWidget {
  Restaurant restaurant;
  MapDetails({Key? key, required this.restaurant, required Restaurant map}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final map = restaurant.maps.first;

    return Container(
      child: Wrap(
        children: [
          Image.network(map.foto,
              height: 250,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover),
          Padding(
            padding: EdgeInsets.only(top: 24, left: 24),
            child: Text(
              restaurant.name,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 60, left: 24),
            child: Text(
              restaurant.location,
            ),
          ),
        ],
      ),
    );
  }
}