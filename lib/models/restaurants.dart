class Comment {
  String title;
  String userImage;
  String rating;
  String datetime;
  String comment;

  Comment({required this.title, required this.userImage, required this.rating, required this.datetime, required this.comment});
}

class Map {
  String foto;
  double latitude;
  double longitude;

  Map({ required this.foto, required this.latitude, required this.longitude,});
}

class Restaurant {
  String name;
  String imagePath;
  String rating;
  String category;
  String description;
  String location;
  List<Comment> coments;
  List<Map> maps;

  Restaurant({required this.name, required this.imagePath, required this.rating, required this.category, required this.description, required this.location, required this.coments, required this.maps});
}

