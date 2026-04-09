import 'package:flutter/material.dart';

class OrderModel {
  String docId;
  String product;
  String details;
  String date;
  String status;
  Color boxColor;
  Image image;

  OrderModel({
    required this.docId,
    required this.product,
    required this.details,
    required this.date,
    required this.status,
    required this.boxColor,
    required this.image,
  });

  factory OrderModel.fromFirestore(String docId, Map<String, dynamic> data) {
    final List<Color> colors = [Colors.blue, Colors.orange];
    final colorIndex = data['colorIndex'] ?? 0;
    final imageMap = {
      'napa': 'assets/images/napa.png',
      'cerelac': 'assets/images/cerelac.png',
      'snail': 'assets/images/snail.png',
      'whisper': 'assets/images/whisper.png',
    };
    final imageKey = data['imageKey'] ?? 'napa';

    return OrderModel(
      docId: docId,
      product: data['product'] ?? '',
      details: data['details'] ?? '',
      date: data['date'] ?? '',
      status: data['status'] ?? 'Pending',
      boxColor: colors[colorIndex % colors.length],
      image: Image.asset(imageMap[imageKey] ?? 'assets/images/napa.png'),
    );
  }
}