import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/widget/restaurant_card.dart';
import '../provider/provider_search.dart';

class RestaurantSearch extends StatelessWidget {
  final String queries = '';

  const RestaurantSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderSearch>(
      builder: (context, state, _) {
        if (state.restaurantState == RestaurantState.loading) {
          return const CircularProgressIndicator(
            color: Colors.blue,
          );
        } else if (state.restaurantState == RestaurantState.hasData) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.searchRest!.restaurants.length,
            itemBuilder: (context, index) {
              var restaurants = state.searchRest!.restaurants[index];
              return RestaurantCard(restaurants: restaurants);
            },
          );
        } else if (state.restaurantState == RestaurantState.noData) {
          return Center(
            child: Text(state.message),
          );
        } else if (state.restaurantState == RestaurantState.error) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return const Center(
            child: Text(''),
          );
        }
      },
    );
  }
}
