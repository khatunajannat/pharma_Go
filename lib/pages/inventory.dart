import 'package:flutter/material.dart';
import '../model/inventory_model.dart';
import '../model/inventory_store.dart';

class Inventory extends StatefulWidget {
  const Inventory({super.key});

  @override
  State<Inventory> createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> {
  List<InventoryModel> items = [];

  @override
  void initState() {
    super.initState();
    items = inventorystore.instance.items;
  }

  void _showDetails(InventoryModel item) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(item.product),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(height: 80, width: 80, child: item.image),
            ),
            SizedBox(height: 12),
            Text('Stock: ${item.stock}', style: TextStyle(fontSize: 15)),
            SizedBox(height: 8),
            Text('Price: ${item.price}', style: TextStyle(fontSize: 15)),
            SizedBox(height: 8),
            Text('Description:', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text(item.description,
                style: TextStyle(fontSize: 14, color: Colors.grey[700])),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(top: 10, left: 15, right: 15),
        child: items.isEmpty
            ? Center(child: Text('No items in inventory.'))
            : ListView.separated(
          itemCount: items.length,
          separatorBuilder: (_, __) => SizedBox(height: 15),
          itemBuilder: (context, index) {
            final item = items[index];
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
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: item.image,
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item.product,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15)),
                        SizedBox(height: 4),
                        Text('Left in inventory: ${item.stock}',
                            style: TextStyle(fontSize: 13)),
                        SizedBox(height: 4),
                        Text(item.price,
                            style: TextStyle(fontSize: 13)),
                        SizedBox(height: 8),
                        GestureDetector(
                          onTap: () => _showDetails(item),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 6),
                            decoration: BoxDecoration(
                              color: item.boxColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color:
                                  item.boxColor.withOpacity(0.3)),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.info_outline,
                                    size: 15, color: item.boxColor),
                                SizedBox(width: 4),
                                Text('Details',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: item.boxColor,
                                        fontWeight: FontWeight.w600)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}