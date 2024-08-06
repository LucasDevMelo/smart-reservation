import 'package:flutter/material.dart';
import 'package:healthcare/models/restaurants.dart';

class MapDetails extends StatelessWidget {
  Restaurant restaurant;
  MapDetails({Key? key, required this.restaurant, required Restaurant map}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final map = restaurant.maps.first;

    return SingleChildScrollView(
      child: Column(
        children: [
          Image.asset(map.foto,
              height: 250,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover),
          Padding(
            padding: EdgeInsets.only(top: 24, left: 24, right: 24),
            child: Text(
              restaurant.name,
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 30, left: 24, right: 24),
            child: Text(
              restaurant.category,
              style: TextStyle(
                color: Colors.black26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  restaurant.description,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      "Avaliações",
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.star, color: Colors.amber),
                    Text(
                      restaurant.rating,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      "(5)",
                      style: TextStyle(color: Colors.black54),
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Ver todas",
                        style: TextStyle(
                          color: Color(0xFFFFB300),
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 160,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: restaurant.coments.length,
                    itemBuilder: (context, index) {
                      var comment = restaurant.coments[index];
                      return Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        width: MediaQuery.of(context).size.width / 1.4,
                        child: Column(
                          children: [
                            ListTile(
                              leading: CircleAvatar(
                                radius: 25,
                                backgroundImage: AssetImage(comment.userImage),
                                backgroundColor: Color.fromARGB(255, 250, 211, 120),
                              ),
                              title: Text(
                                comment.title,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(comment.datetime),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  Text(
                                    comment.rating,
                                    style: TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 5),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                comment.comment,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Localização",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                ListTile(
                  leading: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color(0xFFF0EEFA),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.location_on,
                      color: Color(0xFFFFB300),
                      size: 30,
                    ),
                  ),
                  title: Text(
                    restaurant.location,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text("Brasília-DF"),
                ),
                SizedBox(height: 150),
              ],
            ),
          ),
        ],
      ),
    );
  }
}