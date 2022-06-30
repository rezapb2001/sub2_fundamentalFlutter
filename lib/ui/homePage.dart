import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/ui/restaurant_listpage.dart';
import 'package:restaurant_app/ui/searchPage.dart';
import 'package:restaurant_app/ui/settingPage.dart';
import '../data/api/api_service.dart';
import '../provider/provider_search.dart';
import '../provider/restaurantProvider.dart';


class HomePage extends StatefulWidget {
  static const routeName = '/home_page';

  const HomePage({ Key? key, title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _bottomNavIndex = 0;

  final List<Widget> _listWidget = [
    ChangeNotifierProvider<RestaurantProvider>(
      create: (_) => RestaurantProvider(apiservice: ApiService()),
      child: const RestaurantListPage(),
    ),
    ChangeNotifierProvider<ProviderSearch>(
        create: (_) => ProviderSearch(searchApiService: ApiService()),
        child: const SearchPage()),
    const Settings(),
  ];

  final List<BottomNavigationBarItem> _bottomNavbarItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      activeIcon: Icon(Icons.home),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.search_outlined),
      activeIcon: Icon(Icons.search),
      label: 'Search',
    ),
    const BottomNavigationBarItem(
        icon: Icon(Icons.settings_outlined),
        activeIcon: Icon(Icons.settings),
        label: 'Settings'),
  ];

  void _onBottomNavTapped(int index) {
    setState(() {
      _bottomNavIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant App'),
        elevation: 0,
        toolbarHeight: 60,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Colors.green, Colors.blue])),
        ),
      ),
      body: _listWidget[_bottomNavIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomNavIndex,
        items: _bottomNavbarItems,
        onTap: _onBottomNavTapped,
      ),
    );
  }
}
