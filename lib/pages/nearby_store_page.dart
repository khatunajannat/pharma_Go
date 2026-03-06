import 'package:flutter/material.dart';
import 'package:pharma_go/pages/store_page.dart';

import '../model/nearby_store_model.dart';

class NearbyStorePage extends StatefulWidget {
  const NearbyStorePage({super.key});

  @override
  State<NearbyStorePage> createState() => _NearbyStorePageState();
}

class _NearbyStorePageState extends State<NearbyStorePage> {
  List<NearbyStoreModel> stores = [];

  void _getNearbyStores() {
    stores = NearbyStoreModel.getNearbyStores();
  }

  @override
  Widget build(BuildContext context) {
    _getNearbyStores();

    return ListView.separated(
      padding: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
      itemCount: stores.length,
      separatorBuilder: (context, index) => SizedBox(height: 15),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: stores[index].boxColor.withOpacity(0.10),
            borderRadius: BorderRadius.circular(16),
          ),
          padding: EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(stores[index].storeName, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                  SizedBox(height: 4),
                  Text(stores[index].address, style: TextStyle(fontSize: 12, color: Colors.grey)),
                  SizedBox(height: 4),
                  Text(stores[index].distance, style: TextStyle(fontSize: 12, color: Color(0xff364fab))),
                ],
              ),

              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Scaffold(
                        appBar: AppBar(
                          title: Text(stores[index].storeName),
                          backgroundColor: Color(0xff364fab),
                          foregroundColor: Colors.white,
                        ),
                        body: StorePage(storeName: stores[index].storeName),
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