import 'package:flutter/material.dart';

class CategoryModel {

String name;
String icon;
Color boxColor;


CategoryModel({
  required this.name ,
  required this.icon,
  required this.boxColor,

}
);

 static List<CategoryModel> getCategories(){

List<CategoryModel> categories = [];
categories.add(
  CategoryModel(name:'BabyCare', icon: 'assets/icons/babycare.svg', boxColor:Colors.orange,


),

);


categories.add(

  CategoryModel(name: 'suppliments',
      icon: 'assets/icons/supplement.svg',
      boxColor: Colors.blue)
);



categories.add(

    CategoryModel(name: 'Skincare',
        icon: 'assets/icons/skincare.svg',
        boxColor: Colors.orange)
);


categories.add(

    CategoryModel(name: 'Feminine\n hygiene',
        icon: 'assets/icons/woman.svg',
        boxColor: Colors.blue)
);


return categories;
}


}