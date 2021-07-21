import 'package:flutter/material.dart';

import '../widgets/category_item.dart';
import '../dummy_data.dart';


class CategoriesScreen extends StatelessWidget {
  // const CategoriesScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView( //GridView builder also exists   
                     //this grid view is now a part of the Tab Screen and hence we do not need a Scaffold 
         padding: const EdgeInsets.all(25),
        children: 
            DUMMY_CATEGORIES.map((catData){
            return CategoryItem(catData.id,catData.title ,catData.color);
          }).toList(),
        
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,//The maximum extent of tiles in the cross axis.
          childAspectRatio: 3/2,//The ratio of the cross-axis to the main-axis extent of each child.
          crossAxisSpacing: 20,//The number of logical pixels between each child along the cross axis.
          mainAxisSpacing: 20, //The number of logical pixels between each child along the main axis.
        ), //Sliver->Scrollable areas on the screen
        
      );
    
  }
}