import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals/constants/styles.dart';
import 'package:meals/data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';
  final ScrollController _scrollControllerOne = ScrollController();
  final ScrollController _scrollControllerTwo = ScrollController();
  final Function toggleFavorite;
  final Function isFavorite;

  MealDetailScreen(this.toggleFavorite, this.isFavorite);

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => (meal.id == mealId));
    var _width = MediaQuery.of(context).size.width;
    var _height = MediaQuery.of(context).size.height;

    Widget buildSectionTitle(String title) {
      return Container(
        decoration: BoxDecoration(
            border: Border.all(color: kTextColor)
        ),
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Text(
          title,
          style: TextStyle(color: kTextColor, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    }


    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: Text("${selectedMeal.title}"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _height * 0.3,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),

            buildSectionTitle("Ingredients"),

            Container(
              decoration: BoxDecoration(
                color: kBackgroundColor,
              ),
              height: _height * 0.2,
              width: _width * 0.9,
              child: Scrollbar(
                controller: _scrollControllerOne,
                isAlwaysShown: true,
                child: ListView.builder(
                  controller: _scrollControllerOne,
                  itemBuilder: (ctx, index) {
                    return Card(
                      color: kBackgroundColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(selectedMeal.ingredients[index], style: TextStyle(color: kTextColor, fontSize: 20),),
                        ],
                      ),
                    );
                  },
                  itemCount: selectedMeal.ingredients.length,
                ),
              ),
            ),

            buildSectionTitle("Steps"),

            Container(
              decoration: BoxDecoration(
                color: kBackgroundColor,
              ),
              height: _height * 0.3,
              width: _width * 0.9,
              child: Scrollbar(
                controller: _scrollControllerTwo,
                isAlwaysShown: true,
                child: ListView.builder(
                  controller: _scrollControllerTwo,
                  itemBuilder: (ctx, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: kBtnColor,
                        child: Text('# ${(index + 1)}', style: TextStyle(color: kTextColor),),
                      ),
                      title: Text(selectedMeal.steps[index], style: TextStyle(color: kTextColor),),
                    );
                  },
                  itemCount: selectedMeal.steps.length,
                ),
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: kBtnColor,
        child: Icon(isFavorite(mealId) ? Icons.star : Icons.star_border, color: kTextColor,),
        onPressed: () => toggleFavorite(mealId),
      ),
    );
  }
}
