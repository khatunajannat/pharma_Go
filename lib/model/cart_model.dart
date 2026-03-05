import 'package:flutter/material.dart';

class CartModel {
  String product;
  String price;
  String quantity;
  Image image;
  Color boxColor;

  CartModel({
    required this.product,
    required this.price,
    required this.quantity,
    required this.image,
    required this.boxColor,
  });

  static List<CartModel> getCartItems() {
    List<CartModel> cartItems = [];

    cartItems.add(CartModel(
      product: 'Napa Extend',
      price: 'Tk. 24.00',
      quantity: '1 strip',
      image: Image.asset('assets/images/napa.png'),
      boxColor: Colors.blue,
    ));

    cartItems.add(CartModel(
      product: 'Nestle Cerelac',
      price: 'Tk. 370.00',
      quantity: '2 packs',
      image: Image.asset('assets/images/cerelac.png'),
      boxColor: Colors.orange,
    ));

    cartItems.add(CartModel(
      product: 'COSRX Snail Cream',
      price: 'Tk. 1550.00',
      quantity: '1 unit',
      image: Image.asset('assets/images/snail.png'),
      boxColor: Colors.blue,
    ));

    cartItems.add(CartModel(
      product: 'Whisper Ultra XL',
      price: 'Tk. 600.00',
      quantity: '1 pack',
      image: Image.asset('assets/images/whisper.png'),
      boxColor: Colors.orange,
    ));

    return cartItems;
  }
}