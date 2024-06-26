class Comment {
  String title;
  String userImage;
  String rating;
  String datetime;
  String comment;

  Comment({required this.title, required this.userImage, required this.rating, required this.datetime, required this.comment});
}

class Restaurant {
  String name;
  String imagePath;
  String rating;
  String category;
  String description;
  String location;
  List<Comment> coments;

  Restaurant({required this.name, required this.imagePath, required this.rating, required this.category, required this.description, required this.location, required this.coments});
}

