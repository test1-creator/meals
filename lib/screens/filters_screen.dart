import 'package:flutter/material.dart';
import 'package:meals/constants/styles.dart';
import 'package:meals/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';


  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;


  // Widget buildSwitchListTile(String title, String description, bool currentValue, Function updateValue) {
  //   return SwitchListTile(
  //     title: Text(title),
  //       value: currentValue,
  //       subtitle: Text(description),
  //       onChanged: updateValue,
  //   );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters", style: TextStyle(fontSize: 30),),
        backgroundColor: kBackgroundColor,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.save))
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text('Adjust your meal selection', style: TextStyle(color: kTextColor),),
          ),

          Expanded(
            child: ListView(
              children: <Widget>[
                SwitchListTile(
                  title: Text("Gluten-free", style: TextStyle(color: kTextColor),),
                  subtitle: Text('Only include gluten-free meals.', style: TextStyle(color: kTextColor),),
                  value: _glutenFree,
                  onChanged: (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                  activeTrackColor: kTextColor,
                  activeColor: kTextColor,
                ),

                SwitchListTile(
                  title: Text("Lactose-free", style: TextStyle(color: kTextColor),),
                  subtitle: Text('Only include lactose-free meals.', style: TextStyle(color: kTextColor),),
                  value: _lactoseFree,
                  onChanged: (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text("Vegetarian", style: TextStyle(color: kTextColor),),
                  subtitle: Text('Only include vegetarian meals.', style: TextStyle(color: kTextColor),),
                  value: _vegetarian,
                  onChanged: (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text("Vegan", style: TextStyle(color: kTextColor),),
                  subtitle: Text('Only include vegan meals.', style: TextStyle(color: kTextColor),),
                  value: _vegan,
                  onChanged: (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                ),

                // buildSwitchListTile(
                //   'Gluten-free',
                //   'Only include gluten-free meals.',
                //   _glutenFree,
                //       (newValue) {
                //     setState(
                //           () {
                //         _glutenFree = newValue;
                //       },
                //     );
                //   },
                // ),
                // buildSwitchListTile(
                //   'Lactose-free',
                //   'Only include lactose-free meals.',
                //   _lactoseFree,
                //       (newValue) {
                //     setState(
                //           () {
                //         _lactoseFree = newValue;
                //       },
                //     );
                //   },
                // ),
                // buildSwitchListTile(
                //   'Vegetarian',
                //   'Only include vegetarian meals.',
                //   _vegetarian,
                //       (newValue) {
                //     setState(
                //           () {
                //         _vegetarian = newValue;
                //       },
                //     );
                //   },
                // ),
                // buildSwitchListTile(
                //   'Vegan',
                //   'Only include vegan meals.',
                //   _vegan,
                //       (newValue) {
                //     setState(
                //           () {
                //         _vegan = newValue;
                //       },
                //     );
                //   },
                // )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
