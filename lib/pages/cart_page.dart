import 'package:flutter/material.dart';

import '../model/cart_model.dart';
class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<CartModel> cartItems = [];

  void _getCartItems() {
    cartItems = CartModel.getCartItems();
  }

  @override
  Widget build(BuildContext context) {
    _getCartItems();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'My Cart',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w500,
              color: Color(0xff364fab),
            ),
          ),
        ),
        SizedBox(height: 15),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.only(left: 15, right: 15, bottom: 20),
            itemCount: cartItems.length,
            separatorBuilder: (context, index) => SizedBox(height: 15),
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: cartItems[index].boxColor.withOpacity(0.10),
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: EdgeInsets.all(12),
                child: Row(
                  children: [
                    Container(
                      height: 75,
                      width: 75,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: cartItems[index].image,
                    ),
                    SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(cartItems[index].product, style: TextStyle(fontWeight: FontWeight.w600)),
                        SizedBox(height: 4),
                        Text(cartItems[index].quantity, style: TextStyle(fontSize: 12, color: Colors.grey)),
                        SizedBox(height: 4),
                        Text(cartItems[index].price, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                        SizedBox(height: 6),
                        Container(
                          height: 30,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.red[400],
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Remove', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),

        // Total card
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.10),
              borderRadius: BorderRadius.circular(16),
            ),
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                Text('Tk. 2544.00', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xff364fab))),
              ],
            ),
          ),
        ),

        // Checkout button
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
          child: Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xff364fab),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Checkout',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}