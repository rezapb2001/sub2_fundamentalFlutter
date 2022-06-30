import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/widget/restaurant_card.dart';
import '../provider/restaurantProvider.dart';

class RestaurantListPage extends StatelessWidget {
  const RestaurantListPage({Key? key}) : super(key: key);

  Widget _buildList() {
    return Consumer<RestaurantProvider>(builder: (context, state, _) {
      // ignore: unrelated_type_equality_checks
      if (state == ResultState.Loading) {
        return const Center(
            child: CircularProgressIndicator(
              color: Colors.green,
            ));
      } else {
        if (state.state == ResultState.HasData) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.result.restaurants.length,
            itemBuilder: (context, index) {
              var restaurants = state.result.restaurants[index];
              return RestaurantCard(restaurants: restaurants);
            },
          );
        } else if (state.state == ResultState.NoData) {
          return Center(child: Text(state.message));
        } else if (state.state == ResultState.Error) {
          return Center(child: Text(state.message));
        } else {
          return Center(child: Text(''));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return _buildList();
  }
}
