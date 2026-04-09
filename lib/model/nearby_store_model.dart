import 'package:flutter/material.dart';
import 'dart:math';

class NearbyStoreModel {
  String storeName;
  String address;
  String distance;
  Color boxColor;

  NearbyStoreModel({
    required this.storeName,
    required this.address,
    required this.distance,
    required this.boxColor,
  });

  factory NearbyStoreModel.fromFirestore(Map<String, dynamic> data, Color color) {
    final random = Random();
    final dist = (random.nextDouble() * 5).toStringAsFixed(1);

    return NearbyStoreModel(
      storeName: data['storeName'] ?? 'Unknown Store',
      address:   data['address']   ?? 'Address not available',
      distance:  '${dist} km away',
      boxColor:  color,
    );
  }
}