import 'package:flutter/material.dart';

class SellerOrderModel {
  String orderId;
  String customerName;
  String customerPhone;
  String product;
  String quantity;
  String price;
  String status;
  Color boxColor;
  Image image;

  SellerOrderModel({
    required this.orderId,
    required this.customerName,
    required this.customerPhone,
    required this.product,
    required this.quantity,
    required this.price,
    required this.status,
    required this.boxColor,
    required this.image,
  });

  static List<SellerOrderModel> getOrders() {
    return [
      SellerOrderModel(
        orderId: '#ORD001',
        customerName: 'Rahim Uddin',
        customerPhone: '01712345678',
        product: 'Napa Extend',
        quantity: '1 strip',
        price: 'Tk. 24.00',
        status: 'Pending',
        boxColor: Colors.orange,
        image: Image.asset('assets/images/napa.png'),
      ),
      SellerOrderModel(
        orderId: '#ORD002',
        customerName: 'Karim Hossain',
        customerPhone: '01898765432',
        product: 'Nestle Cerelac',
        quantity: '2 packs',
        price: 'Tk. 740.00',
        status: 'Shipping',
        boxColor: Colors.blue,
        image: Image.asset('assets/images/cerelac.png'),
      ),
      SellerOrderModel(
        orderId: '#ORD003',
        customerName: 'Fatema Begum',
        customerPhone: '01611223344',
        product: 'COSRX Snail Cream',
        quantity: '1 unit',
        price: 'Tk. 1550.00',
        status: 'Delivered',
        boxColor: Colors.blue,
        image: Image.asset('assets/images/snail.png'),
      ),
      SellerOrderModel(
        orderId: '#ORD004',
        customerName: 'Sumaiya Akter',
        customerPhone: '01755667788',
        product: 'Whisper Ultra XL',
        quantity: '1 pack',
        price: 'Tk. 600.00',
        status: 'Cancelled',
        boxColor: Colors.orange,
        image: Image.asset('assets/images/whisper.png'),
      ),
    ];
  }
}