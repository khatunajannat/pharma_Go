import 'package:flutter/material.dart';

class OrderModel {
  String product;
  String details;
  String date;
  String status;
  Color boxColor;
  Image image;

  OrderModel({
    required this.product,
    required this.details,
    required this.date,
    required this.status,
    required this.boxColor,
    required this.image,
  });

  static List<OrderModel> getOrders() {
    List<OrderModel> orders = [];

    orders.add(OrderModel(
      product: 'Napa Extend',
      details: 'Qty: 1 strip  •  Tk. 24.00',
      date: 'June 10, 2025',
      status: 'Delivered',
      boxColor: Colors.blue,
      image: Image.asset('assets/images/napa.png'),
    ));

    orders.add(OrderModel(
      product: 'Nestle Cerelac',
      details: 'Qty: 2 packs  •  Tk. 740.00',
      date: 'June 5, 2025',
      status: 'Delivered',
      boxColor: Colors.orange,
      image: Image.asset('assets/images/cerelac.png'),
    ));

    orders.add(OrderModel(
      product: 'COSRX Snail Cream',
      details: 'Qty: 1 unit  •  Tk. 1550.00',
      date: 'May 28, 2025',
      status: 'Cancelled',
      boxColor: Colors.blue,
      image: Image.asset('assets/images/snail.png'),
    ));

    orders.add(OrderModel(
      product: 'Whisper Ultra XL',
      details: 'Qty: 1 pack  •  Tk. 600.00',
      date: 'May 20, 2025',
      status: 'Delivered',
      boxColor: Colors.orange,
      image: Image.asset('assets/images/whisper.png'),
    ));

    return orders;
  }
}
