import 'package:flutter/material.dart';
import '../model/inventory_model.dart';
import '../model/inventory_store.dart';

class addto extends StatefulWidget {
  addto({super.key});

  @override
  State<addto> createState() => addtoState();
}

class addtoState extends State<addto> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController stockController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text("Enter the name of the Medicine",
                style: TextStyle(
                    color: Color(0xff364fab),
                    fontSize: 18,
                    fontWeight: FontWeight.w600)),
            SizedBox(height: 20),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.indigo[50],
                hintText: 'Name',
                hintStyle: TextStyle(fontSize: 18),
                contentPadding: EdgeInsets.all(15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text("Add Description",
                style: TextStyle(
                    color: Color(0xff364fab),
                    fontSize: 18,
                    fontWeight: FontWeight.w600)),
            SizedBox(height: 20),
            TextField(
              controller: descController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.indigo[50],
                hintText: 'Description',
                hintStyle: TextStyle(fontSize: 18),
                contentPadding: EdgeInsets.all(15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text("Enter the Price",
                style: TextStyle(
                    color: Color(0xff364fab),
                    fontSize: 18,
                    fontWeight: FontWeight.w600)),
            SizedBox(height: 20),
            TextField(
              controller: priceController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.indigo[50],
                hintText: 'Price',
                hintStyle: TextStyle(fontSize: 18),
                contentPadding: EdgeInsets.all(15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text("Enter Stock Amount",
                style: TextStyle(
                    color: Color(0xff364fab),
                    fontSize: 18,
                    fontWeight: FontWeight.w600)),
            SizedBox(height: 20),
            TextField(
              controller: stockController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.indigo[50],
                hintText: 'e.g. 100 units',
                hintStyle: TextStyle(fontSize: 18),
                contentPadding: EdgeInsets.all(15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    if (nameController.text.isEmpty ||
                        priceController.text.isEmpty ||
                        stockController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please fill all fields')),
                      );
                      return;
                    }

                    final newItem = InventoryModel(
                      product: nameController.text,
                      description: descController.text,
                      price: 'Tk. ${priceController.text}',
                      stock: stockController.text,
                      boxColor: Colors.blue,
                      image: Image.asset('assets/images/napa.png'),
                    );

                    inventorystore.instance.addItem(newItem);
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Color(0xff364fab),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text('Add',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}