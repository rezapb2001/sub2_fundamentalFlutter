import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/api/api_service.dart';
import '../data/model/restaurant.dart';
import '../provider/restaurantDetailProvider.dart';

class RestaurantDetailPage extends StatelessWidget {
  static const routeName = '/restaurant_detail';

  final String restaurant;

  const RestaurantDetailPage({required this.restaurant});

  Widget _buildconsumer() {
    return Consumer<RestaurantDetailProvider>(builder: (context, state, _) {
      if (state.state == ResultState.Loading) {
        return const Center(
            child: CircularProgressIndicator(
          color: Colors.cyan,
        ));
      } else if (state.state == ResultState.HasData) {
        return Scaffold(
          appBar: AppBar(
            title: Text(state.result.restaurant.name),
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: <Color>[Colors.green, Colors.blue])),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Hero(
                  tag:
                      'https://restaurant-api.dicoding.dev/images/large/${state.result.restaurant.pictureId}',
                  child: Image.network(
                      'https://restaurant-api.dicoding.dev/images/large/${state.result.restaurant.pictureId}'),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.result.restaurant.name,
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
                                    state.result.restaurant.city,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  const Icon(Icons.star_rate, size: 15.0),
                                  Text(state.result.restaurant.rating
                                      .toString()),
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
                          'About The Restaurant',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                      ),
                      Text(state.result.restaurant.description),
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
                          itemCount: state.result.restaurant.menus.foods.length,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
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
                                    state.result.restaurant.menus.foods[index]
                                        .name,
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
                          itemCount:
                              state.result.restaurant.menus.drinks.length,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
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
                                    state.result.restaurant.menus.drinks[index]
                                        .name,
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
      } else if (state.state == ResultState.NoData) {
        return Center(child: Text(state.message));
      } else if (state.state == ResultState.Error) {
        return Center(child: Text(state.message));
      } else {
        return const Center(child: Text(''));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MultiProvider(
      providers: [
        ChangeNotifierProvider<RestaurantDetailProvider>(
          create: (_) => RestaurantDetailProvider(
            apiservice: ApiService(),
            id: restaurant,
          ),
        ),
      ],
      child: _buildconsumer(),
    ));
  }
}
