import 'package:flutter/material.dart';
import '../data/api/api_service.dart';
import '../data/model/restaurant_reseach.dart';

enum RestaurantState { loading, noData, hasData, error }

class ProviderSearch extends ChangeNotifier {
  final ApiService searchApiService;

  ProviderSearch({required this.searchApiService}) {
    feacthSearchRestaurant(query);
  }

  SearchRest? _searchRest;
  RestaurantState? _restaurantState;
  String _message = '';
  String _query = '';

  String get message => _message;

  SearchRest? get searchRest => _searchRest;

  String get query => _query;

  RestaurantState? get restaurantState => _restaurantState;

  Future<dynamic> feacthSearchRestaurant(String query) async {
    try {
      if (query.isNotEmpty) {
        _restaurantState = RestaurantState.loading;
        _query = query;
        final searchRes = await searchApiService.searchRestaurant(query);
        if (searchRes.restaurants.isEmpty) {
          _restaurantState = RestaurantState.noData;
          notifyListeners();
          return _message = 'Empty Data';
        } else {
          _restaurantState = RestaurantState.hasData;
          notifyListeners();
          return _searchRest = searchRes;
        }
      }
    } catch (e) {
      _restaurantState = RestaurantState.error;
      notifyListeners();
      return _message = 'Not connected to the internet...';
    }
  }
}
