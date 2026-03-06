import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
//import 'package:pharma_go/pages/nearby_store_page.dart';
//import 'account_page.dart';
//import 'cart_page.dart';
import 'homepage.dart';
//import 'orders_page.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    Homepage(),
   // NearbyStorePage(),
   // OrdersPage(),
   // AccountPage(),
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
            ],
          ),
        ),

        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        leading: TextButton(
          onPressed: () {
            SystemNavigator.pop();
          },
          child: Container(
            margin: EdgeInsets.all(1.2),
            alignment: Alignment.center,

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),

            child: SvgPicture.asset(
              'assets/icons/arrownormal.svg',
              height: 40,
              width: 40,
            ),
          ),
        ),
      ),


      body: _pages[_currentIndex],
      backgroundColor: Colors.white,

      floatingActionButton: FloatingActionButton(
        onPressed: (
            ) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Scaffold(
                appBar: AppBar(
                  title: Text('My Cart'),
                  backgroundColor: Color(0xff364fab),
                  foregroundColor: Colors.white,
                ),
                body: //CartPage(),

              ),
            ),
          );
        },

        backgroundColor: Colors.pink[400],
        child: Icon(Icons.shopping_cart, color: Colors.white),
      ),

      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (value){
          setState(() {
            _currentIndex = value;
          });
        },
        selectedIndex: _currentIndex,
        backgroundColor: Colors.white,
        indicatorColor: Color(0xff364fab).withValues(alpha: .15),
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home_outlined, color: Color(0xff364fab)),
            selectedIcon:  Icon(Icons.home, color: Color(0xff364fab)),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.storefront, color: Color(0xff364fab)),
            selectedIcon:  Icon(Icons.storefront_rounded, color: Color(0xff364fab)),
            label: 'Stores',
          ),
          NavigationDestination(
            icon: Icon(Icons.delivery_dining_outlined, color: Color(0xff364fab)),
            selectedIcon:  Icon(Icons.delivery_dining_rounded, color: Color(0xff364fab)),
            label: 'Orders',
          ),
          NavigationDestination(
            icon: Icon(Icons.account_box_outlined, color: Color(0xff364fab)),
            selectedIcon:  Icon(Icons.account_box, color: Color(0xff364fab)),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
