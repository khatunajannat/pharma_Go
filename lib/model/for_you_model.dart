import 'package:flutter/material.dart';

class ForYouModel {

  String product ;
  String text;
  Image image;
   Color boxColor;



  ForYouModel({
    required this.product,
    required this.text,
    required this.image,
    required this.boxColor,

});


static List<ForYouModel>  getForYou() {

  List<ForYouModel> forYou = [];
forYou.add(
ForYouModel(product: 'Napa Extend',
    text: 'unit price : Tk.2.00\n'
        'strip price: Tk. 24.00',
    image: Image.asset('assets/images/napa.png'),

  boxColor: Colors.blue,
));


  forYou.add(
      ForYouModel(product: 'Nestle cerelac - wheat-rice-mixed fruit ',
        text: 'unit price : Tk.370',
        image: Image.asset('assets/images/cerelac.png'),

        boxColor: Colors.orange,
      ));

  forYou.add(
      ForYouModel(product: 'COSRX Advanced Snail 92 All in one Cream 100g',
        text: 'unit price : Tk.1550,',
        image: Image.asset('assets/images/snail.png'),

        boxColor: Colors.blue,
      ));


  forYou.add(
      ForYouModel(product: 'Whisper ultra skin love soft-XL',
        text: 'unit price : Tk.600,',
        image: Image.asset('assets/images/whisper.png'),

        boxColor: Colors.orange,
      ));


  return forYou;
}

}