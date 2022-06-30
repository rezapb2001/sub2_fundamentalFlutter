import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/provider_search.dart';

class WidgetSearch extends StatefulWidget {
  const WidgetSearch({Key? key}) : super(key: key);

  @override
  State<WidgetSearch> createState() => _WidgetSearchState();
}

class _WidgetSearchState extends State<WidgetSearch> {
  String queries = '';
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderSearch>(
      builder: (context, state, _) {
        return Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: <Color>[Colors.green, Colors.blue],
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: ListTile(
                    leading: const Icon(
                      Icons.search,
                      size: 30,
                    ),
                    title: TextField(
                      controller: _controller,
                      onChanged: (String query) {
                        if (query.isNotEmpty) {
                          setState(() {
                            queries = query;
                          });
                          state.feacthSearchRestaurant(query);
                        }
                      },
                      cursorColor: Colors.black,
                      decoration: const InputDecoration(
                        hintText: 'Cari Restaurant',
                        border: InputBorder.none,
                      ),
                    ),
                    trailing: IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: () {
                        if (queries.isNotEmpty) {
                          _controller.clear();
                          setState(() {
                            queries = '';
                          });
                        }
                      },
                      icon: const Icon(
                        Icons.close,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
