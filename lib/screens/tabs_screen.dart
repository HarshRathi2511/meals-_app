//for tabs we need a new screen=>Stateful Widget
import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';
import '../screens/favorites_screen.dart';
import '../screens/categories_screen.dart';

class TabsScreen extends StatefulWidget {
  // const TabsScreen({Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  final List<Map<String,Object>> _pages=[
    {'page':CategoriesScreen(),'title' :'Categories'},{'page':FavoritesScreen(),'title' :'Favorites'}
   ] ;

  int _selectedPageIndex=0;

  void _selectPage(int index)
  {
    setState(() {
      _selectedPageIndex=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_pages[_selectedPageIndex]['title'],textAlign: TextAlign.center,)),
      drawer:MainDrawer(), //automatically added to the leftmost section of the appBar 
      body: _pages[_selectedPageIndex]['page'],

      bottomNavigationBar: BottomNavigationBar(

        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        onTap:_selectPage, //{void Function(int) onTap} automatically passes index of the selected page to the function 
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: _selectedPageIndex, 
        // type: BottomNavigationBarType.shifting, //shift effect

        items: [
          BottomNavigationBarItem(backgroundColor: Theme.of(context).primaryColor,icon: Icon(Icons.category), label: 'Categories'),
          BottomNavigationBarItem(backgroundColor: Theme.of(context).primaryColor,icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
    );
  }
}

//for adding the tabs at the top
//  return DefaultTabController(
//     // for adding tavbs at the bootom of the app bar
//       initialIndex: 0, //it is set to default zero ,Index of the screen which is to be displayed initially

//       length: 2, //number of tabs
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Meals'),
//           bottom: TabBar(  //TabBar and DefaultTabController are connected behind the scenes automatically
//             tabs: [
//               Tab(  //Tab1
//                 icon: Icon(Icons.category),
//                 text: 'Categories',
//               ),
//               Tab(  //Tab2
//                 icon: Icon(Icons.star),
//                 text: 'Favorites',

//               )
//             ],
//           ),
//         ),
//         body: TabBarView(children: [

//           CategoriesScreen(), //Tab1
//           FavoritesScreen(), //Tab2

//         ],),
//       ),
//     );
