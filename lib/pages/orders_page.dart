import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../model/order_model.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  List<OrderModel> orders = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchOrders();
  }

  Future<void> _fetchOrders() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;

    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('orders')
        .orderBy('orderedAt', descending: true)
        .get();

    setState(() {
      orders = snapshot.docs
          .map((doc) => OrderModel.fromFirestore(doc.id, doc.data()))
          .toList();
      _isLoading = false;
    });
  }

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
            'My Orders',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w500,
              color: Color(0xff364fab),
            ),
          ),
        ),
        SizedBox(height: 15),
        Expanded(
          child: orders.isEmpty
              ? Center(child: Text('No orders yet.'))
              : ListView.separated(
            padding:
            EdgeInsets.only(left: 15, right: 15, bottom: 20),
            itemCount: orders.length,
            separatorBuilder: (context, index) =>
                SizedBox(height: 15),
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color:
                  orders[index].boxColor.withOpacity(0.10),
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
                      child: orders[index].image,
                    ),
                    SizedBox(width: 12),
                    Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Text(orders[index].product,
                            style: TextStyle(
                                fontWeight: FontWeight.w600)),
                        SizedBox(height: 4),
                        Text(orders[index].details,
                            style: TextStyle(fontSize: 13)),
                        SizedBox(height: 4),
                        Text(orders[index].date,
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey)),
                        SizedBox(height: 6),
                        Container(
                          height: 30,
                          width: 90,
                          decoration: BoxDecoration(
                            color: orders[index].status ==
                                'Delivered'
                                ? Colors.green
                                : Colors.red,
                            borderRadius:
                            BorderRadius.circular(16),
                          ),
                          child: Column(
                            mainAxisAlignment:
                            MainAxisAlignment.center,
                            children: [
                              Text(orders[index].status,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight:
                                      FontWeight.w600,
                                      fontSize: 12)),
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
      ],
    );
  }
}