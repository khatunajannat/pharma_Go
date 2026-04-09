import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pharma_go/pages/store_page.dart';
import '../model/nearby_store_model.dart';

class NearbyStorePage extends StatefulWidget {
  const NearbyStorePage({super.key});

  @override
  State<NearbyStorePage> createState() => _NearbyStorePageState();
}

class _NearbyStorePageState extends State<NearbyStorePage> {
  List<NearbyStoreModel> stores = [];
  bool _isLoading = true;

  final List<Color> _cardColors = [
    Colors.blue,
    Colors.orange,
  ];

  @override
  void initState() {
    super.initState();
    _fetchStores();
  }

  Future<void> _fetchStores() async {
    try {
      final snapshot =
      await FirebaseFirestore.instance.collection('sellers').get();

      final docs = snapshot.docs;
      setState(() {
        stores = List.generate(docs.length, (index) {
          final color = _cardColors[index % _cardColors.length];
          return NearbyStoreModel.fromFirestore(docs[index].data(), color);
        });
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load stores: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    if (stores.isEmpty) {
      return Center(child: Text('No stores found.'));
    }

    return ListView.separated(
      padding: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
      itemCount: stores.length,
      separatorBuilder: (context, index) => SizedBox(height: 15),
      itemBuilder: (context, index) {
        final store = stores[index];

        return Container(
          decoration: BoxDecoration(
            color: store.boxColor.withOpacity(0.10),
            borderRadius: BorderRadius.circular(16),
          ),
          padding: EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    store.storeName,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    store.address,
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  SizedBox(height: 4),
                  Text(
                    store.distance,
                    style: TextStyle(fontSize: 12, color: Color(0xff364fab)),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Scaffold(
                        appBar: AppBar(
                          title: Text(store.storeName),
                          backgroundColor: Color(0xff364fab),
                          foregroundColor: Colors.white,
                        ),
                        body: StorePage(storeName: store.storeName),
                      ),
                    ),
                  );
                },
                child: Text('Visit Store'),
              ),
            ],
          ),
        );
      },
    );
  }
}