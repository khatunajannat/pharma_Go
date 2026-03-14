import 'package:flutter/material.dart';
import 'addto.dart';
import 'dashboard.dart';
import 'inventory.dart';
import 'notification.dart';
import 'seller_orders.dart';

class SellerHomePageBody extends StatefulWidget {
  const SellerHomePageBody({super.key});

  @override
  State<SellerHomePageBody> createState() => _SellerHomePageBodyState();
}

class _SellerHomePageBodyState extends State<SellerHomePageBody> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    DashBoard(),
    Inventory(),
    orders(),
    Notifications(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'pharma',
                style: TextStyle(
                  color: Color(0xff364fab),
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              TextSpan(
                text: 'Go',
                style: TextStyle(
                  color: Color(0xffff751f),
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              TextSpan(
                text: ' Seller',
                style: TextStyle(
                  color: Color(0xff364fab),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
      ),
      body: _pages[_currentIndex],
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Scaffold(
                appBar: AppBar(
                  title: Text('Add Medicine'),
                  backgroundColor: Color(0xff364fab),
                  foregroundColor: Colors.white,
                ),
                body: addto(),
              ),
            ),
          );
        },
        backgroundColor: Color(0xff364fab),
        child: Icon(Icons.add, color: Colors.white),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        selectedIndex: _currentIndex,
        backgroundColor: Colors.white,
        indicatorColor: Color(0xff364fab).withOpacity(0.15),
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.dashboard_outlined, color: Color(0xff364fab)),
            selectedIcon: Icon(Icons.dashboard, color: Color(0xff364fab)),
            label: 'Dashboard',
          ),
          NavigationDestination(
            icon: Icon(Icons.inventory_2_outlined, color: Color(0xff364fab)),
            selectedIcon: Icon(Icons.inventory_2, color: Color(0xff364fab)),
            label: 'Inventory',
          ),
          NavigationDestination(
            icon: Icon(Icons.receipt_long_outlined, color: Color(0xff364fab)),
            selectedIcon: Icon(Icons.receipt_long, color: Color(0xff364fab)),
            label: 'Orders',
          ),
          NavigationDestination(
            icon: Icon(Icons.notifications_outlined, color: Color(0xff364fab)),
            selectedIcon: Icon(Icons.notifications, color: Color(0xff364fab)),
            label: 'Notifications',
          ),
        ],
      ),
    );
  }
}