import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import '../widget/searchRestaurant.dart';
import '../widget/widgetSearch.dart';

class SearchPage extends StatelessWidget {
  static const routeName = '/search';

  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: MediaQuery.of(context).padding,
          child: OfflineBuilder(
            connectivityBuilder: (
                BuildContext context,
                ConnectivityResult connectivity,
                Widget child,
                ) {
              final bool connected = connectivity != ConnectivityResult.none;
              return Stack(
                fit: StackFit.expand,
                children: [
                  Positioned(
                    height: 28.0,
                    left: 0.0,
                    right: 0.0,
                    child: connected
                        ? Visibility(
                      visible: true,
                      child: Container(),
                    )
                        : Container(
                      color: Colors.red,
                      child: const Center(
                        child: Text(
                          "Loss Connection",
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                        padding: MediaQuery.of(context).padding,
                        child: Column(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children:const [
                                  WidgetSearch(),
                                  SizedBox(height: 20),
                                  Flexible(
                                    child: RestaurantSearch(),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                  ),
                ],
              );
            },
            child: Container(),
          ),
        ),
      ),
    );
  }
}
