import 'package:flutter/material.dart';

class StoreItemModel {
  String product;
  String price;
  String category;
  Image image;
  Color boxColor;

  StoreItemModel({
    required this.product,
    required this.price,
    required this.category,
    required this.image,
    required this.boxColor,
  });

  static List<StoreItemModel> getStoreItems() {
    List<StoreItemModel> items = [];

    items.add(StoreItemModel(
      product: 'Napa Extend',
      price: 'Tk. 24.00',
      category: 'Medicine',
      image: Image.asset('assets/images/napa.png'),
      boxColor: Colors.blue,
    ));

    items.add(StoreItemModel(
      product: 'Nestle Cerelac',
      price: 'Tk. 370.00',
      category: 'Baby Care',
      image: Image.asset('assets/images/cerelac.png'),
      boxColor: Colors.orange,
    ));

    items.add(StoreItemModel(
      product: 'COSRX Snail Cream',
      price: 'Tk. 1550.00',
      category: 'Skincare',
      image: Image.asset('assets/images/snail.png'),
      boxColor: Colors.blue,
    ));

    items.add(StoreItemModel(
      product: 'Whisper Ultra XL',
      price: 'Tk. 600.00',
      category: 'Feminine Hygiene',
      image: Image.asset('assets/images/whisper.png'),
      boxColor: Colors.orange,
    ));

    items.add(StoreItemModel(
      product: 'Napa Extend',
      price: 'Tk. 24.00',
      category: 'Medicine',
      image: Image.asset('assets/images/napa.png'),
      boxColor: Colors.blue,
    ));

    items.add(StoreItemModel(
      product: 'Nestle Cerelac',
      price: 'Tk. 370.00',
      category: 'Baby Care',
      image: Image.asset('assets/images/cerelac.png'),
      boxColor: Colors.orange,
    ));

    return items;
  }
}
