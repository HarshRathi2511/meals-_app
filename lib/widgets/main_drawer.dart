import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  // const MainDrawer({ Key? key }) : super(key: key);

  Widget _buildListTile({IconData icon, String title, Function onTap}) {
    return ListTile(
        leading: Icon(icon, size: 26),
        title: Text(
          title,
          style: TextStyle(
              fontFamily: 'RobotoCondensed',
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        onTap: onTap);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text('Cooking Up',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                    color: Theme.of(context).primaryColor)),
          ),
          SizedBox(height: 20),

          _buildListTile(icon:Icons.restaurant, title:'Meals',onTap: () {
            Navigator.of(context).pushReplacementNamed('/');
          }), //to go to the tabs screen

          _buildListTile(icon:Icons.settings, title:'Filters',onTap: () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName); //deletes the
            // stack of pages and forms a new one 
          })
        ]),
      ),
    );
  }
}
