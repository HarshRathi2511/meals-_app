import 'package:flutter/material.dart';
import './dummy_data.dart';

import './screens/filters_screen.dart';
import './screens/tabs_screen.dart';
import './screens/meal_detail_screen.dart';
import 'screens/category_meals_screen.dart';
import 'screens/categories_screen.dart';
import './models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  //to store the filters the user has set 
  Map <String,bool> _filters={
    'gluten':false,
    'lactose':false,
    'vegan':false,
    'vegetarian':false,
  };
  
  List<Meal>  _availableMeals=DUMMY_MEALS;

  List <Meal> _favoriteMeals=[];

  void _setFilters (Map <String,bool> filterBoolData){//should be called inside a button and the user passes values in it 
    setState(() {
      _filters=filterBoolData;

      _availableMeals=DUMMY_MEALS.where((meal) {
        //to filter dummy meals on the basis of filters added by the user 
        if(_filters['gluten']==true && ! meal.isGlutenFree){
          return false;
        }

        if(_filters['lactose']==true && !meal.isLactoseFree){
          return false;
        }

        if(_filters['vegan']==true && !meal.isVegan){
          return false;
        }

        if(_filters['vegetarian']==true  && !meal.isVegetarian){
          return false;
        }

        return true;
      }).toList();
    });
  }

  //function to add favoriets 
  void _toggleFavorite(String mealId) //id of the meal which will turn into favorite or unfavorite 
  {
    final existingIndex=_favoriteMeals.indexWhere((meal)=>mealId==meal.id);  
    //if the test returns true then the meal is already in the favorites list so we need to remove it .
    if(existingIndex>=0){
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    }
    else{
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => mealId==meal.id)); //first meal with that id is added in that
      });
    }
  }

  bool _isMealFavorite(String id)
  {
    return _favoriteMeals.any((meal) =>id==meal.id); //stops after first element it found 
    //true if it finds any element in that list 
  }


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

        '/': (ctx)=>TabsScreen(_favoriteMeals),  
        // '/category-meals': (ctx)=>CategoryMealsScreen(), //convention for paths having slash in the beginning 
        CategoryMealsScreen.routeName: (ctx)=>CategoryMealsScreen(_availableMeals), //to avoid mistakes 
        MealDetailScreen.routeName: (ctx)=> MealDetailScreen(_toggleFavorite,_isMealFavorite),
        FiltersScreen.routeName:(ctx)=>FiltersScreen(_filters,_setFilters),


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

