import 'package:flutter/material.dart';
import 'package:meals/data.dart';
import 'package:meals/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(25),
      children: DUMMY_CATEGORIES.map((categories) => CategoryItem(categories.id, categories.title)).toList(),
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      crossAxisCount: 2,
    );
  }
}
