import 'package:flutter/material.dart';
import 'package:meals/constants/styles.dart';
import 'package:meals/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function() tapHandler) {
    return ListTile(
      leading: Icon(icon, size: 26, color: kTextColor,),
      title: Text(
        title,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: kTextColor),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: kBtnColor,
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 25, color: kTextColor),
            ),
          ),

          SizedBox(
            height: 20,
          ),

          //Drawer items
          buildListTile("Meals", Icons.restaurant, () {
            Navigator.pushReplacementNamed(context, '/');
          }),

          buildListTile("Filters", Icons.settings, () {
            Navigator.pushReplacementNamed(context, FilterScreen.routeName);
          }),
        ],
      ),
    );
  }
}
