import 'package:flutter/material.dart';
import 'package:meals/constants/styles.dart';
import 'package:meals/data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/category_meals_screen.dart';
import 'package:meals/screens/filters_screen.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'package:meals/screens/tabs_screen.dart';

void main() {
  runApp(Meals());
}

class Meals extends StatefulWidget {

  @override
  _MealsState createState() => _MealsState();
}

class _MealsState extends State<Meals> {
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Meals",
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        canvasColor: kBtnColor,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => TabsScreen(),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
        FilterScreen.routeName: (ctx) => FilterScreen(),
      },
    );
  }
}
