import 'package:flutter/material.dart';
import 'package:pharma_go/pages/signup_user.dart';
import 'login_page.dart';
import 'login_s.dart';
import 'login_seller.dart';

class SelectionPage extends StatefulWidget {
  const SelectionPage({super.key});

  @override
  State<SelectionPage> createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text.rich(
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
              ],
            ),

            SizedBox(height: 15),
            Text(
              'Welcome to pharmaGo, continue as....',
              style: TextStyle(color: Colors.indigo, fontSize: 18),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 40),

            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 15),
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff364fab),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.10),
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.person_outline, color: Color(0xff364fab), size: 40),
                        SizedBox(height: 8),
                        Text('User', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Color(0xff364fab))),
                        SizedBox(height: 4),
                        Text('Buy medicines and\nhealthcare products', style: TextStyle(fontSize: 13, color: Colors.grey)),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
                      },
                      child: Container(
                        height: 40,
                        width: 120,
                        decoration: BoxDecoration(
                          color: Colors.indigo[900],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Login as User', style: TextStyle(fontSize: 13, color: Colors.white, fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.10),
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.store_outlined, color: Color(0xffff751f), size: 40),
                        SizedBox(height: 8),
                        Text('Seller', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Color(0xffff751f))),
                        SizedBox(height: 4),
                        Text('Manage your pharmacy\nand sell products', style: TextStyle(fontSize: 13, color: Colors.grey)),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPageS(),
                          ),
                        );
                      },
                      child: Container(
                        height: 40,
                        width: 120,
                        decoration: BoxDecoration(
                          color: Color(0xffff751f),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Login as Seller', style: TextStyle(fontSize: 13, color: Colors.white, fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 15),
              child: Text(
                'New here? Sign up',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff364fab),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.10),
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.person_add_outlined, color: Color(0xff364fab), size: 40),
                        SizedBox(height: 8),
                        Text('User', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Color(0xff364fab))),
                        SizedBox(height: 4),
                        Text('Create a new\nuser account', style: TextStyle(fontSize: 13, color: Colors.grey)),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignupUserPage(),
                          ),
                        );
                      },
                      child: Container(
                        height: 40,
                        width: 120,
                        decoration: BoxDecoration(
                          color: Colors.indigo[900],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Sign up as User', style: TextStyle(fontSize: 13, color: Colors.white, fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 30),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.10),
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.store_mall_directory_outlined, color: Color(0xffff751f), size: 40),
                        SizedBox(height: 8),
                        Text('Seller', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Color(0xffff751f))),
                        SizedBox(height: 4),
                        Text('Register your\npharmacy store', style: TextStyle(fontSize: 13, color: Colors.grey)),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SellerLoginPage(),
                          ),
                        );
                      },
                      child: Container(
                        height: 40,
                        width: 120,
                        decoration: BoxDecoration(
                          color: Color(0xffff751f),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Sign up as Seller', style: TextStyle(fontSize: 13, color: Colors.white, fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}