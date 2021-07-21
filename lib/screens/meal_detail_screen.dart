import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/meal.dart';

import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  // const MealDetailScreen({ Key? key }) : super(key: key);

  static const routeName = '/meal-detail';

  final Function toggleFavorite;
  final Function isFavorite;

  MealDetailScreen(this.toggleFavorite,this.isFavorite);

  Widget buildSectionTitle(String text, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(text, style: Theme.of(context).textTheme.headline6),
    );
  }

  Widget buildContainer({Widget child, double height}) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      height: height,
      width: 350,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) =>mealId == meal.id); 
    //just looks for the first element having the required conditions

    return Scaffold(
        appBar: AppBar(
          title: Text(selectedMeal.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              buildSectionTitle('Ingredients', context),
              buildContainer(
                  child: ListView.builder(
                    itemCount: selectedMeal.ingredients.length,
                    itemBuilder: (ctx, index) => Card(
                      color: Theme.of(context).accentColor,
                      child: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          child: Center(
                              child: Text(selectedMeal.ingredients[index]))),
                    ),
                  ),
                  height: 150),
              buildSectionTitle('Steps', context),
              buildContainer(
                child: ListView.builder(
                    itemCount: selectedMeal.steps.length,
                    itemBuilder: (ctx, index) => Column(
                          children: [
                            ListTile(
                              leading: CircleAvatar(
                                child: Text((index + 1).toString()),
                              ),
                              title: Text(selectedMeal.steps[index]),
                            ),
                            Divider(), //creates a dividing line
                          ],
                        )),
                height: 300,
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(isFavorite(mealId)? Icons.star: Icons.star_border),
          onPressed: ()=>toggleFavorite(mealId),
        ));
  }
}
