import 'package:flutter/material.dart';
import 'package:meals/constants/styles.dart';
import 'package:meals/screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;

  CategoryItem(this.id, this.title);
  
  void selectCategory(BuildContext ctx) {
     Navigator.of(ctx).pushNamed(CategoryMealsScreen.routeName, arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: kTextColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(title, style: TextStyle(color: kTextColor, fontWeight: FontWeight.bold, fontSize: 25),),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: kCardColor,
        ),
      ),
    );
  }
}
