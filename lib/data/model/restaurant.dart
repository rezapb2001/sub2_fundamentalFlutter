
class Restaurant {
  Restaurant({
    required this.error,
    required this.message,
    required this.count,
    required this.restaurants,
  });

  bool error;
  String message;
  int count;
  List<RestaurantDesc> restaurants;

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
        error: json["error"],
        message: json["message"],
        count: json["count"],
        restaurants: List<RestaurantDesc>.from((json["restaurants"] as List)
            .map((x) => RestaurantDesc.fromJson(x))
            .where((restaurants) =>
                restaurants.id != null &&
                restaurants.name != null &&
                restaurants.description != null &&
                restaurants.pictureId != null &&
                restaurants.city != null &&
                restaurants.rating != null)));
  }
}

class RestaurantDesc {
  RestaurantDesc({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
    required this.menus,
  });

  String id;
  String name;
  String description;
  String pictureId;
  String city;
  double rating;
  Menus menus;

  factory RestaurantDesc.fromJson(Map<String, dynamic> json) {
    return RestaurantDesc(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      pictureId: json["pictureId"],
      city: json["city"],
      rating: json["rating"].toDouble(),
      menus: Menus.fromJson(json["menus"]),
    );
  }

  factory RestaurantDesc.detailFromJson(Map<String, dynamic> json) =>
      RestaurantDesc(
          id: json["id"],
          name: json["name"],
          description: json["description"],
          pictureId: json["pictureId "],
          city: json["city"],
          rating: json["rating"].toDouble(),
          menus: Menus.fromJson(json["menus"]));
}

class ResponResto {
  ResponResto(
      {required this.error, required this.message, required this.restaurant});

  final bool error;
  final String message;
  final RestaurantDesc restaurant;

  factory ResponResto.fromJson(Map<String, dynamic> json) =>
      ResponResto(
          error: json["error"],
          message: json["message"],
          restaurant: RestaurantDesc.detailFromJson(json["restaurant"]));
}

class Menus {
  Menus({required this.foods, required this.drinks});

  List<Food> foods;
  List<Drink> drinks;

  factory Menus.fromJson(Map<String, dynamic> json) => Menus(
        foods: List<Food>.from(json["foods"].map((x) => Food.fromJson(x))),
        drinks: List<Drink>.from(json["drinks"].map((x) => Drink.fromJson(x))),
      );
}

class Food {
  Food({required this.name});

  final String name;

  factory Food.fromJson(Map<String, dynamic> json) => Food(name: json["name"]);
}

class Drink {
  Drink({required this.name});

  final String name;

  factory Drink.fromJson(Map<String, dynamic> json) =>
      Drink(name: json["name"]);
}

class SearchRest {
  SearchRest({
    required this.error,
    required this.founded,
    required this.restaurants,
  });

  final bool error;
  final int founded;
  final List<RestaurantDesc> restaurants;

  factory SearchRest.fromJson(Map<String, dynamic> json) => SearchRest(
        error: json["error"],
        founded: json["founded"],
        restaurants: List<RestaurantDesc>.from(
            json["restaurants"].map((x) => RestaurantDesc.fromJson(x))),
      );
}

