import 'dart:convert';
import '../model/restaurant.dart';
import 'package:http/http.dart' as http;
import '../model/restaurant_detail.dart';
import '../model/restaurant_reseach.dart';

class ApiService {
  static const String _urlBase = 'https://restaurant-api.dicoding.dev';

  Future<Restaurant> apiRestaurant() async {
    final response = await http.get(Uri.parse(_urlBase + '/list'));
    if (response.statusCode == 200) {
      return Restaurant.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Restaurant List');
    }
  }

  Future<RestaurantDetail> restaurantDetailApi(String id) async {
    final response = await http.get(Uri.parse(_urlBase + '/detail/$id'));
    if (response.statusCode == 200) {
      return ResponResto.fromJson(json.decode(response.body)).restaurant;
    } else {
      throw Exception('Failed to load Restaurant List');
    }
  }

  Future<SearchRest> searchRestaurant(String query) async {
    final response = await http.get(Uri.parse(_urlBase + "/search?q=" + query));
    if (response.statusCode == 200) {
      return SearchRest.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to Search');
    }
  }
}
