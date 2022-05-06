import 'package:flutter/material.dart';

import 'favorites_screen.dart';
import 'categories_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  Widget buildTab(IconData icon, String text) => Tab(
        icon: Icon(icon),
        text: text,
      );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Meals'),
          bottom: TabBar(
            tabs: [
              buildTab(Icons.category, 'Categories'),
              buildTab(Icons.star, 'Favorites')
            ],
          ),
        ),
        body: TabBarView(children: [CategoriesScreen(), FavoritesScreen()]),
      ),
    );
  }
}
