import 'package:flutter/material.dart';
import 'package:healthcare/models/restaurants.dart';

class AllCommentsScreen extends StatefulWidget {
  final Restaurant restaurant;

  const AllCommentsScreen({super.key, required this.restaurant});

  @override
  State<AllCommentsScreen> createState() => _AllCommentsScreenState();
}

class _AllCommentsScreenState extends State<AllCommentsScreen> {
  @override
  Widget build(BuildContext context) {
    final allComments = widget.restaurant.coments;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Todos comentários",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color(0xFFFFB300),
      ),
      backgroundColor: Color(0xFFFFB300),
      body: Container(
        padding: const EdgeInsets.only(top: 5.0),
        child: SizedBox(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: allComments.length,
            itemBuilder: (context, index) {
              var comment = allComments[index];
              return GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        title: Text(comment.title),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 25,
                                  backgroundImage: AssetImage(comment.userImage),
                                  backgroundColor: Color.fromARGB(255, 250, 211, 120),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  comment.datetime,
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Text(
                              comment.comment,
                              style: TextStyle(color: Colors.black),
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  comment.rating,
                                  style: TextStyle(color: Colors.black54),
                                ),
                              ],
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("Fechar",
                            style: TextStyle(
                              color: Colors.amber
                            ),),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        spreadRadius: 6,
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
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
