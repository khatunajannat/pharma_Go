import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import '../model/cart_model.dart';

class CheckoutPage extends StatefulWidget {
  final List<CartModel> cartItems;
  final double total;

  const CheckoutPage({
    super.key,
    required this.cartItems,
    required this.total,
  });

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  bool _isPlacing = false;
  bool _orderPlaced = false;
  String _paymentMethod = 'Cash on Delivery';

  Future<void> _placeOrder() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;

    setState(() => _isPlacing = true);

    final userRef = FirebaseFirestore.instance.collection('users').doc(uid);
    final ordersRef = userRef.collection('orders');
    final cartRef = userRef.collection('cart');
    final now = DateTime.now();
    final dateStr = DateFormat('MMMM d, yyyy').format(now);

    final batch = FirebaseFirestore.instance.batch();

    for (final item in widget.cartItems) {
      final orderDoc = ordersRef.doc();
      batch.set(orderDoc, {
        'product': item.product,
        'details': 'Qty: 1 unit  •  ${item.price}',
        'date': dateStr,
        'status': 'Delivered',
        'paymentMethod': _paymentMethod,
        'imageKey': _imageKeyFromProduct(item.product),
        'colorIndex': item.boxColor == Colors.blue ? 0 : 1,
        'orderedAt': FieldValue.serverTimestamp(),
      });

      final cartDoc = cartRef.doc(item.docId);
      batch.delete(cartDoc);
    }

    await batch.commit();

    setState(() {
      _isPlacing = false;
      _orderPlaced = true;
    });
  }

  String _imageKeyFromProduct(String product) {
    if (product.contains('Napa')) return 'napa';
    if (product.contains('Cerelac')) return 'cerelac';
    if (product.contains('Snail') || product.contains('COSRX')) return 'snail';
    if (product.contains('Whisper')) return 'whisper';
    return 'napa';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
        backgroundColor: Color(0xff364fab),
        foregroundColor: Colors.white,
      ),
      body: _orderPlaced ? _successScreen() : _reviewScreen(),
    );
  }

  Widget _reviewScreen() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'Order Summary',
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
            itemCount: widget.cartItems.length,
            separatorBuilder: (context, index) => SizedBox(height: 15),
            itemBuilder: (context, index) {
              final item = widget.cartItems[index];
              return Container(
                decoration: BoxDecoration(
                  color: item.boxColor.withOpacity(0.10),
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
                      child: item.image,
                    ),
                    SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item.product,
                            style: TextStyle(fontWeight: FontWeight.w600)),
                        SizedBox(height: 4),
                        Text(item.quantity,
                            style:
                            TextStyle(fontSize: 12, color: Colors.grey)),
                        SizedBox(height: 4),
                        Text(item.price,
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),

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
                Text('Total',
                    style: TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 16)),
                Text('Tk. ${widget.total.toStringAsFixed(2)}',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Color(0xff364fab))),
              ],
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.indigo[50],
              borderRadius: BorderRadius.circular(16),
            ),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Payment Method',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: Color(0xff364fab),
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(
                                () => _paymentMethod = 'Cash on Delivery'),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: _paymentMethod == 'Cash on Delivery'
                                ? Color(0xff364fab)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Color(0xff364fab),
                              width: 1.5,
                            ),
                          ),
                          child: Column(
                            children: [
                              Icon(
                                Icons.money,
                                color: _paymentMethod == 'Cash on Delivery'
                                    ? Colors.white
                                    : Color(0xff364fab),
                                size: 26,
                              ),
                              SizedBox(height: 6),
                              Text(
                                'Cash on Delivery',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color:
                                  _paymentMethod == 'Cash on Delivery'
                                      ? Colors.white
                                      : Color(0xff364fab),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(
                                () => _paymentMethod = 'Online Payment'),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: _paymentMethod == 'Online Payment'
                                ? Color(0xff364fab)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Color(0xff364fab),
                              width: 1.5,
                            ),
                          ),
                          child: Column(
                            children: [
                              Icon(
                                Icons.credit_card,
                                color: _paymentMethod == 'Online Payment'
                                    ? Colors.white
                                    : Color(0xff364fab),
                                size: 26,
                              ),
                              SizedBox(height: 6),
                              Text(
                                'Online Payment',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: _paymentMethod == 'Online Payment'
                                      ? Colors.white
                                      : Color(0xff364fab),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
          child: GestureDetector(
            onTap: _isPlacing ? null : _placeOrder,
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: _isPlacing ? Colors.grey : Color(0xff364fab),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _isPlacing
                      ? SizedBox(
                    height: 22,
                    width: 22,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                  )
                      : Text(
                    'Place Order',
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
        ),
      ],
    );
  }

  Widget _successScreen() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.15),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.check_circle, color: Colors.green, size: 60),
          ),
          SizedBox(height: 24),
          Text(
            'Order Placed!',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Color(0xff364fab),
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Your order has been placed successfully.',
            style: TextStyle(fontSize: 15, color: Colors.grey),
          ),
          SizedBox(height: 6),
          Text(
            'Total: Tk. ${widget.total.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xff364fab),
            ),
          ),
          SizedBox(height: 6),
          Text(
            'Payment: $_paymentMethod',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          SizedBox(height: 40),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                color: Color(0xff364fab),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Back',
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
      ),
    );
  }
}