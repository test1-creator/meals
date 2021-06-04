import 'package:flutter/material.dart';
import 'package:meals/constants/styles.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/favorites_screen.dart';
import 'package:meals/widgets/main_drawer.dart';

import 'categories_screen.dart';

class TabsScreen extends StatefulWidget {

  final List<Meal> favoriteMeals;

  TabsScreen(this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages = [];
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': CategoriesScreen(),
        'title': 'Categories',
      },
      {
        'page': FavoritesScreen(widget.favoriteMeals),
        'title': 'Favorites'
      }
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: kBackgroundColor,
            title: Text(_pages[_selectedPageIndex]['title'].toString(), style: TextStyle(fontSize: 30),),
            centerTitle: true,
          ),
          drawer: MainDrawer(),
          body: (_pages[_selectedPageIndex]['page'] as Widget),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.category),
                label: "Categories",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.star),
                label: "Favorites",
              ),
            ],
            onTap: _selectPage,
            backgroundColor: kBackgroundColor,
            unselectedItemColor: kTextColor,
            selectedItemColor: kBtnColor,
            currentIndex: _selectedPageIndex,
          ),
        ),
    );
  }
}
