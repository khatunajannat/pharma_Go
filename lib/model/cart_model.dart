import 'package:flutter/material.dart';

class CartModel {
  String docId;
  String product;
  String price;
  double priceValue;
  String quantity;
  Image image;
  Color boxColor;

  CartModel({
    required this.docId,
    required this.product,
    required this.price,
    required this.priceValue,
    required this.quantity,
    required this.image,
    required this.boxColor,
  });

  factory CartModel.fromFirestore(String docId, Map<String, dynamic> data) {
    final List<Color> colors = [Colors.blue, Colors.orange];
    final colorIndex = data['colorIndex'] ?? 0;
    final imageMap = {
      'napa': 'assets/images/napa.png',
      'cerelac': 'assets/images/cerelac.png',
      'snail': 'assets/images/snail.png',
      'whisper': 'assets/images/whisper.png',
    };
    final imageKey = data['imageKey'] ?? 'napa';

    return CartModel(
      docId: docId,
      product: data['product'] ?? '',
      price: data['price'] ?? '',
      priceValue: (data['priceValue'] ?? 0).toDouble(),
      quantity: data['quantity'] ?? '1 unit',
      image: Image.asset(imageMap[imageKey] ?? 'assets/images/napa.png'),
      boxColor: colors[colorIndex % colors.length],
    );
  }
}