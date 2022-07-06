import 'package:flutter/cupertino.dart';
import '../data/model/restaurant.dart';
import 'package:flutter/material.dart';
import '../ui/restaurant_detailpage.dart';

class RestaurantCard extends StatelessWidget {
  final RestaurantDesc restaurants;

  const RestaurantCard({required this.restaurants});

  @override
  Widget build(BuildContext context) {
    return Material(
        child: ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      leading: Hero(
        tag: restaurants.id,
        child: Image.network(
          "https://restaurant-api.dicoding.dev/images/medium/${restaurants.pictureId}",
          width: 100,
        ),
      ),
      title: Text(restaurants.name),
      subtitle: Container(
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  const Icon(Icons.location_on, size: 15.0),
                  Text(
                    restaurants.city,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  const  Icon(Icons.star_rate, size: 15.0),
                  Text(restaurants.rating.toString()),
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, RestaurantDetailPage.routeName, arguments: restaurants);
      },
    ));
  }
}