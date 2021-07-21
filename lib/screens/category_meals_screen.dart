import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../dummy_data.dart';
import '../models/meal.dart';



class CategoryMealsScreen extends StatefulWidget {
  // const CategoryMealsScreen({ Key? key }) : super(key: key);

  // final String categoryId;
  // final String categoryTitle;

  // CategoryMealsScreen(this.categoryId,this.categoryTitle);
  static const routeName = '/category-meals';

  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {

  String categoryTitle;
  List<Meal> displayedMeals;
 var _loadedInitialData;

  @override
  void initState() {  //will run before build runs the first time 
     //...

    super.initState();
  }

  @override  
  void didChangeDependencies() {  //
   if(_loadedInitialData==false){
     
   }
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>; //recievs the arguments(map) passed in pushNamed
     categoryTitle = routeArgs['title'];
    final categoryId = routeArgs[ 'id']; //to get the id of the food type pressed by the user ->italian,quick easy etc

    //to filter the meals which have a particular category eg c1=> x,y,z
    displayedMeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(
          categoryId); // meal.categories.contains(categoryId) returns true if it contains categoryId we selected
    }).toList();
    _loadedInitialData=true;
    super.didChangeDependencies();
  }

 void removeMeal(String mealId){

  setState(() {
    displayedMeals.removeWhere((meal) => mealId==meal.id);
  });
 }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(   //returns widget for every index number
              id: displayedMeals[index].id,
              title: displayedMeals[index].title,
              imageUrl: displayedMeals[index].imageUrl,
              duration: displayedMeals[index].duration,
              complexity: displayedMeals[index].complexity,
              affordability: displayedMeals[index].affordability,
              removeItem: null,);
                   
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
