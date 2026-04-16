import 'package:flutter/material.dart';

class InventoryModel {
  String product;
  String stock;
  String price;
  String description;
  Color boxColor;
  Image image;

  InventoryModel({
    required this.product,
    required this.stock,
    required this.price,
    required this.description,
    required this.boxColor,
    required this.image,
  });

  static List<InventoryModel> getInventory() {
    return [
      InventoryModel(
        product: 'Napa Extend',
        stock: '120 strips',
        price: 'Tk. 24.00',
        description: 'Used for pain and fever relief.',
        boxColor: Colors.orange,
        image: Image.asset('assets/images/napa.png'),
      ),
      InventoryModel(
        product: 'Nestle Cerelac',
        stock: '40 packs',
        price: 'Tk. 370.00',
        description: 'Baby cereal with essential nutrients.',
        boxColor: Colors.blue,
        image: Image.asset('assets/images/cerelac.png'),
      ),
      InventoryModel(
        product: 'COSRX Snail Cream',
        stock: '15 units',
        price: 'Tk. 1550.00',
        description: 'Korean skincare moisturizing cream.',
        boxColor: Colors.blue,
        image: Image.asset('assets/images/snail.png'),
      ),
      InventoryModel(
        product: 'Whisper Ultra XL',
        stock: '60 packs',
        price: 'Tk. 600.00',
        description: 'Sanitary pads for hygiene.',
        boxColor: Colors.orange,
        image: Image.asset('assets/images/whisper.png'),
      ),
    ];
  }
}