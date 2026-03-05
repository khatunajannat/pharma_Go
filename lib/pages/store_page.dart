import 'package:flutter/material.dart';
import '../model/store_model.dart';
import 'cart_page.dart';

class StorePage extends StatefulWidget {
  final String storeName;

  const StorePage({super.key, required this.storeName});

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  List<StoreItemModel> items = [];

  void _getStoreItems() {
    items = StoreItemModel.getStoreItems();
  }

  @override
  Widget build(BuildContext context) {
    _getStoreItems();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 20, left: 15, right: 15),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color(0xFFC5CAE9FF).withOpacity(0.25),
                blurRadius: 40,
                spreadRadius: 0.10,
              ),
            ],
          ),
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.indigo[50],
              hintText: 'Search medicines',
              hintStyle: TextStyle(fontSize: 18),
              contentPadding: EdgeInsets.all(15),
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        SizedBox(height: 25),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            widget.storeName,
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
            itemCount: items.length,
            separatorBuilder: (context, index) => SizedBox(height: 15),
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: items[index].boxColor.withOpacity(0.10),
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
                      child: items[index].image,
                    ),
                    SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(items[index].product, style: TextStyle(fontWeight: FontWeight.w600)),
                        SizedBox(height: 4),
                        Text(items[index].category, style: TextStyle(fontSize: 12, color: Colors.grey)),
                        SizedBox(height: 4),
                        Text(items[index].price, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                        SizedBox(height: 6),
                        TextButton(
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Scaffold(
                                  appBar: AppBar(
                                    title: Text('My Cart'),
                                    backgroundColor: Color(0xff364fab),
                                    foregroundColor: Colors.white,
                                  ),
                                  body: CartPage(),
                                ),
                              ),
                            );
                          },
                          child: Container(
                            height: 30,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.pink[400],
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Add to cart', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
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
      ],
    );
  }
}