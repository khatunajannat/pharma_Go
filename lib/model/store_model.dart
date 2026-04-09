import 'package:flutter/material.dart';

class StoreItemModel {
  String id;
  String product;
  String price;
  double priceValue;
  String category;
  Image image;
  Color boxColor;

  StoreItemModel({
    required this.id,
    required this.product,
    required this.price,
    required this.priceValue,
    required this.category,
    required this.image,
    required this.boxColor,
  });

  factory StoreItemModel.fromFirestore(String docId, Map<String, dynamic> data) {
    final List<Color> colors = [Colors.blue, Colors.orange];
    final colorIndex = data['colorIndex'] ?? 0;
    final imageMap = {
      'napa': 'assets/images/napa.png',
      'cerelac': 'assets/images/cerelac.png',
      'snail': 'assets/images/snail.png',
      'whisper': 'assets/images/whisper.png',
    };
    final imageKey = data['imageKey'] ?? 'napa';

    return StoreItemModel(
      id: docId,
      product: data['product'] ?? '',
      price: data['price'] ?? '',
      priceValue: (data['priceValue'] ?? 0).toDouble(),
      category: data['category'] ?? '',
      image: Image.asset(imageMap[imageKey] ?? 'assets/images/napa.png'),
      boxColor: colors[colorIndex % colors.length],
    );
  }

  static List<Map<String, dynamic>> seedData() {
    return [
      {
        'product': 'Napa Extend',
        'price': 'Tk. 24.00',
        'priceValue': 24.0,
        'category': 'Medicine',
        'imageKey': 'napa',
        'colorIndex': 0,
      },
      {
        'product': 'Nestle Cerelac',
        'price': 'Tk. 370.00',
        'priceValue': 370.0,
        'category': 'Baby Care',
        'imageKey': 'cerelac',
        'colorIndex': 1,
      },
      {
        'product': 'COSRX Snail Cream',
        'price': 'Tk. 1550.00',
        'priceValue': 1550.0,
        'category': 'Skincare',
        'imageKey': 'snail',
        'colorIndex': 0,
      },
      {
        'product': 'Whisper Ultra XL',
        'price': 'Tk. 600.00',
        'priceValue': 600.0,
        'category': 'Feminine Hygiene',
        'imageKey': 'whisper',
        'colorIndex': 1,
      },
    ];
  }
}