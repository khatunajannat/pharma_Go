import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../model/cart_model.dart';
import 'checkout_page.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<CartModel> cartItems = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchCart();
  }

  Future<void> _fetchCart() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;

    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('cart')
        .orderBy('addedAt')
        .get();

    setState(() {
      cartItems = snapshot.docs
          .map((doc) => CartModel.fromFirestore(doc.id, doc.data()))
          .toList();
      _isLoading = false;
    });
  }

  Future<void> _removeFromCart(String docId) async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;

    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('cart')
        .doc(docId)
        .delete();

    setState(() {
      cartItems.removeWhere((item) => item.docId == docId);
    });
  }

  double get _total =>
      cartItems.fold(0.0, (sum, item) => sum + item.priceValue);

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }

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
          child: cartItems.isEmpty
              ? Center(child: Text('Your cart is empty.'))
              : ListView.separated(
            padding:
            EdgeInsets.only(left: 15, right: 15, bottom: 20),
            itemCount: cartItems.length,
            separatorBuilder: (context, index) =>
                SizedBox(height: 15),
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
                        Text(cartItems[index].product,
                            style: TextStyle(
                                fontWeight: FontWeight.w600)),
                        SizedBox(height: 4),
                        Text(cartItems[index].quantity,
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey)),
                        SizedBox(height: 4),
                        Text(cartItems[index].price,
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500)),
                        SizedBox(height: 6),
                        GestureDetector(
                          onTap: () => _removeFromCart(
                              cartItems[index].docId),
                          child: Container(
                            height: 30,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.red[400],
                              borderRadius:
                              BorderRadius.circular(16),
                            ),
                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: [
                                Text('Remove',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight:
                                        FontWeight.w600)),
                              ],
                            ),
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
        Padding(
          padding:
          const EdgeInsets.only(left: 15, right: 15, bottom: 15),
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
                Text('Tk. ${_total.toStringAsFixed(2)}',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Color(0xff364fab))),
              ],
            ),
          ),
        ),
        Padding(
          padding:
          const EdgeInsets.only(left: 15, right: 15, bottom: 20),
          child: GestureDetector(
            onTap: cartItems.isEmpty
                ? null
                : () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CheckoutPage(
                    cartItems: cartItems,
                    total: _total,
                  ),
                ),
              ).then((_) => _fetchCart());
            },
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: cartItems.isEmpty
                    ? Colors.grey
                    : Color(0xff364fab),
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
        ),
      ],
    );
  }
}