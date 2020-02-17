import 'package:flutter/material.dart';
import './categories_screen.dart';
import 'favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Meals App"),
          elevation: 4,
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                child: Row(
                  children: <Widget>[
                    Icon(Icons.category),
                    SizedBox(
                      width: 5,
                    ),
                    Text("All Categories")
                  ],
                ),
              ),
              Tab(
                child: Row(
                  children: <Widget>[
                    Icon(Icons.favorite),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Favorites")
                  ],
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            CategoriesScreen(),
            FavoritesScreen(),
          ],
        ),
      ),
    );
  }
}
