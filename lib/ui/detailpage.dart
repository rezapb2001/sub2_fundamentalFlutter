import 'package:flutter/material.dart';
import '../data/model/restaurant_detail.dart';

class RestaurantDetailPage extends StatelessWidget {
  static const routeName = '/restaurant_detail';

  final RestaurantDetail restaurant;

  const RestaurantDetailPage({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.name),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft, end: Alignment.bottomRight, colors: <Color>[Colors.green, Colors.blue])),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: 'https://restaurant-api.dicoding.dev/images/large/${restaurant.pictureId}',
              child: Image.network('https://restaurant-api.dicoding.dev/images/large/${restaurant.pictureId}'),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurant.name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(5.0),
                          child: Row(
                            children: [
                              const Icon(Icons.location_on, size: 15.0),
                              Text(
                                restaurant.city,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(5.0),
                          child: Row(
                            children: [
                              const Icon(Icons.star_rate, size: 15.0),
                              Text(restaurant.rating.toString()),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(color: Colors.grey),
                  Container(
                    margin: const EdgeInsets.all(5.0),
                    child: const Text(
                      'About The Restourant',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  Text(restaurant.description),
                  const Divider(color: Colors.grey),
                  Container(
                    margin: const EdgeInsets.all(5.0),
                    child: const Text(
                      'Daftar Menu',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 15.0),
                    child: Text(
                      'Makanan',
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 15),
                  ),
                  SizedBox(
                    height: 150,
                    child: ListView.builder(
                      itemCount: restaurant.menus.foods.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: 100.0,
                                width: 100.0,
                                decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: <Color>[
                                      Colors.green,
                                      Colors.blue
                                    ])),
                              ),
                              SizedBox.fromSize(
                                size: const Size(10, 10),
                              ),
                              Text(
                                restaurant.menus.foods[index].name,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              const Text(
                                'Rp.10.000',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 15.0),
                    child: Text(
                      'minuman',
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 15),
                  ),
                  SizedBox(
                    height: 150,
                    child: ListView.builder(
                      itemCount: restaurant.menus.drinks.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: 100.0,
                                width: 100.0,
                                decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: <Color>[
                                      Colors.green,
                                      Colors.blue
                                    ])),
                              ),
                              SizedBox.fromSize(
                                size: const Size(10, 10),
                              ),
                              Text(
                                restaurant.menus.drinks[index].name,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              const Text(
                                'Rp.10.000',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const Divider(color: Colors.grey),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
