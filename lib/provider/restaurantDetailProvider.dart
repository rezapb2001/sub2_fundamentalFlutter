import 'package:flutter/cupertino.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import '../data/model/restaurant_detail.dart';

enum ResultState { Loading, NoData, HasData, Error }

class RestaurantDetailProvider extends ChangeNotifier {
  final ApiService apiservice;
  final String id;

  RestaurantDetailProvider({required this.apiservice, required this.id}) {
    _fetchAllRestaurant();
  }

  late ResponResto _restaurant;
  late ResultState _state;
  String _message = '';

  String get message => _message;

  ResponResto get result => _restaurant;

  ResultState get state => _state;

  Future<dynamic> _fetchAllRestaurant() async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final restaurant = await apiservice.restaurantDetailApi(id);
      if (restaurant.message.isEmpty) {
        _state = ResultState.NoData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        return _restaurant = restaurant;
      }
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      print(e);
      return _message = 'Immediately Connect to the Internet';
    }
  }
}
