import 'package:flutter/material.dart';
import 'package:restaurant_app/data/model/restaurant.dart';
import 'package:restaurant_app/ui/searchPage.dart';
import 'package:restaurant_app/widget/splashscreen.dart';
import 'ui/detailpage.dart';
import 'ui/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant',
      theme: ThemeData(),
      initialRoute: Splashscreenpage.routeName,
      routes: {
        Splashscreenpage.routeName: (context) => Splashscreenpage(),
        Login.routeName: (context) => Login(),
        RestaurantDetailPage.routeName: ((context) => RestaurantDetailPage(
          restaurant: ModalRoute.of(context)?.settings.arguments as RestaurantDesc,
        )),
        SearchPage.routeName: (context) => const SearchPage(),
      },
    );
  }
}