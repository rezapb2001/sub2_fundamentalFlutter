import 'package:restaurant_app/data/model/restaurant.dart';

class SearchRest {
  SearchRest({
    required this.error,
    required this.founded,
    required this.restaurants,
  });

  bool error;
  int founded;
  List<RestaurantDesc> restaurants;

  factory SearchRest.fromJson(Map<String, dynamic> json) => SearchRest(
    error: json["error"],
    founded: json["founded"],
    restaurants: List<RestaurantDesc>.from(json["restaurants"].map((x) => RestaurantDesc.fromJson(x))),
  );
}

class RestaurantSearch {
  RestaurantSearch({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
  });

  String id;
  String name;
  String description;
  String pictureId;
  String city;
  double rating;

  factory RestaurantSearch.fromJson(Map<String, dynamic> json) => RestaurantSearch(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    pictureId: json["pictureId"],
    city: json["city"],
    rating: json["rating"].toDouble(),
  );
}
