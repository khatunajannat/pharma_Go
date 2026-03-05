import 'package:flutter/material.dart';

class NearbyStoreModel {
  String storeName;
  String address;
  String distance;
  Color boxColor;

  NearbyStoreModel({
    required this.storeName,
    required this.address,
    required this.distance,
    required this.boxColor,
  });

  static List<NearbyStoreModel> getNearbyStores() {
    List<NearbyStoreModel> stores = [];

    stores.add(NearbyStoreModel(
      storeName: 'MediFast Pharmacy',
      address: 'House 12, Road 4, Kafrul, Dhaka',
      distance: '0.3 km away',
      boxColor: Colors.blue,
    ));

    stores.add(NearbyStoreModel(
      storeName: 'HealthPlus Pharmacy',
      address: 'House 45, Road 7, Mirpur, Dhaka',
      distance: '0.7 km away',
      boxColor: Colors.orange,
    ));

    stores.add(NearbyStoreModel(
      storeName: 'CareWell Pharmacy',
      address: 'Shop 3, Block B, Agargaon, Dhaka',
      distance: '1.1 km away',
      boxColor: Colors.blue,
    ));

    stores.add(NearbyStoreModel(
      storeName: 'MediCare Plus',
      address: 'House 8, Road 2, Shyamoli, Dhaka',
      distance: '1.5 km away',
      boxColor: Colors.orange,
    ));

    stores.add(NearbyStoreModel(
      storeName: 'PharmaZone',
      address: 'House 21, Road 9, Mohammadpur, Dhaka',
      distance: '2.0 km away',
      boxColor: Colors.blue,
    ));

    return stores;
  }
}
