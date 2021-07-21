//after selecting the category c1(italian)=>this file contains Card of eg spaghetti (single card)
import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  // const MealItem({ Key? key }) : super(key: key);
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final Function removeItem;

  MealItem(
      {@required this.id,
      @required this.title,
      @required this.imageUrl,
      @required this.duration,
      @required this.complexity,
      @required this.affordability,
      @required this.removeItem});

  //  String get complexityText{
  //    if(complexity == Complexity.Simple){
  //      return 'Simple';
  //    }
  //     if(complexity == Complexity.Simple){
  //      return 'Simple';
  //    }
  //     if(complexity == Complexity.Simple){
  //      return 'Simple';
  //    }
  //  }

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;

      case Complexity.Challenging:
        return 'Challenging';
        break;

      case Complexity.Hard:
        return 'Hard';
        break;

      default:
        return 'Unknown';
        break;
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;

      case Affordability.Luxurious:
        return 'Luxurious';
        break;

      case Affordability.Pricey:
        return 'Pricey';
        break;

      default:
        return 'Unknown';
        break;
    }
  }

  void selectMeal(BuildContext context) {
    //shows us the detail page for the selected meal
        //pushNamed returns a Future argument 
    //Future<T> pushNamed<T extends Object>(String routeName, {Object arguments})

    Navigator.of(context).pushNamed(
      MealDetailScreen.routeName,
      arguments: id).then((result)  {
        if(result!=null)
        {
          removeItem(result);
        }}); //result contains the Value passed by the page we are coming from i.e mealId
    //once the user goes back from meal detail screen then the pushNamed action is completed fully 

  }
  

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5,
        margin: EdgeInsets.all(10),
        child: Column(children: [
          Stack(
            //defined by biggest child
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                child: Image.network(imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover), //to fetch image from the net
              ), //to Create a rounded-rectangular clip.
              Positioned(
                bottom: 20,
                right: 10,
                child: Container(
                  width: 300,
                  color: Colors.black54,
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 24, color: Colors.white),
                    softWrap: true,
                    overflow: TextOverflow
                        .fade, //to fade the overflow text to transaparent
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Icon(Icons.schedule),
                    SizedBox(width: 6),
                    Text(duration.toString() + 'min'),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.work),
                    SizedBox(width: 6),
                    Text(complexityText),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.money_sharp),
                    SizedBox(width: 6),
                    Text(affordabilityText),
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
