import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  //to manage which filters the user set to uodate the valuw o the swutches ont he fiter c=screen
  // const FiltersScreen({ Key? key }) : super(key: key);

  static const String routeName = '/filters';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _lactoseFree=false;
  var _vegetarian = false;
  var _vegan = false;

  Widget _buildSwitchListTile(
      {String title,
      String subTitle,
      bool currentValue,
      Function updateValue}) {
    return SwitchListTile(
      value: currentValue,
      onChanged: updateValue,
      title: Text(title),
      subtitle: Text(subTitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      drawer: MainDrawer(),
      body: Column(children: [
        Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headline6,
            )),
        Expanded(
            child: ListView(
          children: [

            _buildSwitchListTile(
              title: 'GlutenFree',
              subTitle: 'Only Include Gluten Free Meals',
              currentValue: _glutenFree,
              updateValue: (val) {
                setState(() {
                  _glutenFree = val;
                });
              },
            ),

              _buildSwitchListTile(
              title: 'LactoseFree',
              subTitle: 'Only Include Lactose Free Meals',
              currentValue: _lactoseFree,
              updateValue: (val) {
                setState(() {
                  _lactoseFree = val;
                });
              },
            ),

              _buildSwitchListTile(
              title: 'Vegetarian',
              subTitle: 'Only Include Vegetarian Meals',
              currentValue: _vegetarian,
              updateValue: (val) {
                setState(() {
                  _vegetarian= val;
                });
              },
            ),
              _buildSwitchListTile(
              title: 'Vegan',
              subTitle: 'Only Include vegan Meals',
              currentValue: _vegan,
              updateValue: (val) {
                setState(() {
                  _vegan = val;
                });
              },
            ),
          ],
        )),
      ]),
    );
  }
}
