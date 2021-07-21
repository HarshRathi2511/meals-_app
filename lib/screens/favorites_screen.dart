import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  // const FavoritesScreen({ Key? key }) : super(key: key);

  final List<Meal> favoriteMeals;
  

  FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if(favoriteMeals.isEmpty)
    {
      return Center(child: Text('Add some favorites',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                    color: Theme.of(context).accentColor)),);
    }
    else{
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(   //returns widget for every index number
              id: favoriteMeals[index].id,
              title: favoriteMeals[index].title,
              imageUrl: favoriteMeals[index].imageUrl,
              duration: favoriteMeals[index].duration,
              complexity: favoriteMeals[index].complexity,
              affordability: favoriteMeals[index].affordability,
              removeItem: null,
              );
                   
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}