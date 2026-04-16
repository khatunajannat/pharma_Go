import 'package:flutter/material.dart';
import '../model/seller_order_model.dart';

class SellerOrdersPage extends StatefulWidget {
  const SellerOrdersPage({super.key});

  @override
  State<SellerOrdersPage> createState() => _SellerOrdersPageState();
}

class _SellerOrdersPageState extends State<SellerOrdersPage> {
  List<SellerOrderModel> orders = [];

  final List<String> statuses = ['Pending', 'Shipping', 'Delivered', 'Cancelled'];

  Color _statusColor(String status) {
    switch (status) {
      case 'Delivered':
        return Colors.blue;
      case 'Shipping':
        return Colors.orange;
      case 'Pending':
        return Colors.orange;
      case 'Cancelled':
        return Colors.orange;
      default:
        return Colors.blue;
    }
  }

  @override
  void initState() {
    super.initState();
    orders = SellerOrderModel.getOrders();
  }

  void _showChangeStatusDialog(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Change Status'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: statuses.map((status) {
              return ListTile(
                title: Text(status),
                leading: CircleAvatar(
                  radius: 8,
                  backgroundColor: _statusColor(status),
                ),
                onTap: () {
                  setState(() {
                    orders[index].status = status;
                  });
                  Navigator.pop(context);
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }

  void _showCustomerInfo(SellerOrderModel order) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Customer Info'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name: ${order.customerName}', style: TextStyle(fontSize: 15)),
              SizedBox(height: 8),
              Text('Phone: ${order.customerPhone}', style: TextStyle(fontSize: 15)),
              SizedBox(height: 8),
              Text('Order ID: ${order.orderId}', style: TextStyle(fontSize: 15)),
              SizedBox(height: 8),
              Text('Product: ${order.product}', style: TextStyle(fontSize: 15)),
              SizedBox(height: 8),
              Text('Qty: ${order.quantity}', style: TextStyle(fontSize: 15)),
              SizedBox(height: 8),
              Text('Price: ${order.price}', style: TextStyle(fontSize: 15)),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _deleteOrder(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete Order'),
          content: Text('Are you sure you want to delete ${orders[index].orderId}?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  orders.removeAt(index);
                });
                Navigator.pop(context);
              },
              child: Text('Delete', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'Seller Orders',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w600,
              color: Color(0xff364fab),
            ),
          ),
        ),
        SizedBox(height: 15),
        Expanded(
          child: orders.isEmpty
              ? Center(child: Text('No orders yet.'))
              : ListView.separated(
            padding: EdgeInsets.only(left: 15, right: 15, bottom: 20),
            itemCount: orders.length,
            separatorBuilder: (_, __) => SizedBox(height: 15),
            itemBuilder: (context, index) {
              final order = orders[index];
              return Container(
                decoration: BoxDecoration(
                  color: order.boxColor.withOpacity(0.10),
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
                        child: order.image,
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(order.product,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15)),
                          SizedBox(height: 4),
                          Text('${order.quantity}  •  ${order.price}',
                              style: TextStyle(fontSize: 13)),
                          SizedBox(height: 6),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 14, vertical: 5),
                            decoration: BoxDecoration(
                              color: _statusColor(order.status),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              order.status,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              _actionButton(
                                icon: Icons.person_outline,
                                label: 'Customer',
                                color: Color(0xff364fab),
                                onTap: () => _showCustomerInfo(order),
                              ),
                              SizedBox(width: 8),
                              _actionButton(
                                icon: Icons.swap_horiz,
                                label: 'Status',
                                color: Colors.orange,
                                onTap: () => _showChangeStatusDialog(index),
                              ),
                              SizedBox(width: 8),
                              _actionButton(
                                icon: Icons.delete_outline,
                                label: 'Delete',
                                color: Colors.red,
                                onTap: () => _deleteOrder(index),
                              ),
                            ],
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
      ],
    );
  }

  Widget _actionButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Row(
          children: [
            Icon(icon, size: 15, color: color),
            SizedBox(width: 4),
            Text(label,
                style: TextStyle(
                    fontSize: 12,
                    color: color,
                    fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}