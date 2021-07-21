import 'package:flutter/material.dart';

import './screens/filters_screen.dart';
import './screens/tabs_screen.dart';
import './screens/meal_detail_screen.dart';
import 'screens/category_meals_screen.dart';
import 'screens/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          headline6: TextStyle(fontSize: 24,fontFamily: 'RobotoCondensed'),

        )
      ),
      // home: CategoriesScreen(),//entry widget point of the application

      // initialRoute: '/', //default is '/'

      routes: {  //{Map<String, Widget Function(BuildContext)> routes = const <String, WidgetBuilder>{}}

        '/': (ctx)=>TabsScreen(),  
        // '/category-meals': (ctx)=>CategoryMealsScreen(), //convention for paths having slash in the beginning 
        CategoryMealsScreen.routeName: (ctx)=>CategoryMealsScreen(), //to avoid mistakes 
        MealDetailScreen.routeName: (ctx)=> MealDetailScreen(),
        FiltersScreen.routeName:(ctx)=>FiltersScreen(),

      },
      // onGenerateRoute: (settings) { //dynamically assigned and used if routes are not named in the map
      //   print(settings.arguments);
      //   return MaterialPageRoute(builder: (ctx)=>CategoriesScreen());
      // },

      onUnknownRoute: (settings) {  //last resort to show something on the screen 
        return MaterialPageRoute(builder: (ctx)=> CategoriesScreen(),);
      },
    );
  }
}

