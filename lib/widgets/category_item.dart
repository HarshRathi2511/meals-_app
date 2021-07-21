//widget for each grid tile on the homescreen
import 'package:flutter/material.dart';

import '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  // const CategoryItem({ Key? key }) : super(key: key);
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id,this.title, this.color);

  // void selectCategory(BuildContext ctx)
  // {
  //   Navigator.of(ctx).push(MaterialPageRoute(
  //     builder: (_){  //defines which widget must be built with the help of MaterialPageRoute
  //      return CategoryMealsScreen(id,title);
  //     }, 
      
  //    ));
  // }
  void selectCategory(BuildContext ctx)
  {
    Navigator.of(ctx).pushNamed(//takes the path
      // '/category-meals',arguments: {'id':id,'title':title}    
      CategoryMealsScreen.routeName,arguments: {'id':id,'title':title}    
     );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell( //Gesture Detector which fires of a ripple effect

       onTap: ()=>selectCategory(context),
       splashColor: Theme.of(context).primaryColor,  //color of the waves 
       borderRadius: BorderRadius.circular(15), 
      
          child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(title, style: Theme.of(context).textTheme.headline6,),
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            color.withOpacity(0.7), //transparent 
            color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
