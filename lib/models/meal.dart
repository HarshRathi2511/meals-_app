import 'package:flutter/cupertino.dart';

import 'package:meta/meta.dart';

enum Complexity {
  //choice
  Simple, //behind the scenes dart maps these strings to 0,1,2
  Challenging,
  Hard,
}

enum Affordability {
  Affordable,
  Pricey,
  Luxurious,
}

class Meal {
  final String title;
  final String id;
  final List<String> categories; //Every meal part of one or more categories
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration; //how long to prepare
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;  //for applying filters
  final bool isVegan;//for applying filters
  final bool isVegetarian;//for applying filters
  final bool isLactoseFree;

  const Meal( //to create immutable values 
      {@required this.title,
      @required this.id,
      @required this.categories,
      @required this.imageUrl,
      @required this.ingredients,
      @required this.steps,
      @required this.duration,
      @required this.complexity,
      @required this.affordability,
      @required this.isGlutenFree,
      @required this.isVegan,
      @required this.isVegetarian,
      @required this.isLactoseFree}); //{}=>named args

}
