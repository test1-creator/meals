import 'package:flutter/material.dart';
import 'package:meals/constants/styles.dart';
import 'package:meals/data.dart';
import 'package:meals/models/meal.dart';
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

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if(_filters['gluten'] as bool && !meal.isGlutenFree)
            return false;
        if(_filters['lactose'] as bool && !meal.isLactoseFree)
          return false;
        if(_filters['vegan'] as bool && !meal.isVegan)
          return false;
        if(_filters['vegetarian'] as bool && !meal.isVegetarian)
          return false;
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex = _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if(existingIndex >= 0) {
     setState(() {
       _favoriteMeals.removeAt(existingIndex);
     });
    } else {
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }


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
        '/': (context) => TabsScreen(_favoriteMeals),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(_toggleFavorite, _isMealFavorite),
        FilterScreen.routeName: (ctx) => FilterScreen(_setFilters, _filters),
      },
    );
  }
}
