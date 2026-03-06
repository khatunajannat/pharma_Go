import 'package:flutter/material.dart';

class SellerLoginPage extends StatefulWidget {
  const SellerLoginPage({super.key});

  @override
  State<SellerLoginPage> createState() => _SellerLoginPageState();
}

class _SellerLoginPageState extends State<SellerLoginPage> {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome to pharmaGo, Log-in as Seller....',
                  style: TextStyle(color: Colors.indigo, fontSize: 18),
                ),
              ],
            ),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Store Name',
                  style: TextStyle(
                    color: Colors.indigo,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 15, right: 15),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFC5CAE9FF).withOpacity(0.25),
                    blurRadius: 30,
                    spreadRadius: 20,
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.indigo[50],
                  hintText: 'Enter your store name',
                  hintStyle: TextStyle(fontSize: 18),
                  contentPadding: EdgeInsets.all(15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Phone Number',
                  style: TextStyle(
                    color: Colors.indigo,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 15, right: 15),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFC5CAE9FF).withOpacity(0.25),
                    blurRadius: 30,
                    spreadRadius: 20,
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.indigo[50],
                  hintText: 'Enter your phone number',
                  hintStyle: TextStyle(fontSize: 18),
                  contentPadding: EdgeInsets.all(15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),


            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'License Number',
                  style: TextStyle(
                    color: Colors.indigo,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 15, right: 15),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFC5CAE9FF).withOpacity(0.25),
                    blurRadius: 30,
                    spreadRadius: 20,
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.indigo[50],
                  hintText: 'Enter your license number',
                  hintStyle: TextStyle(fontSize: 18),
                  contentPadding: EdgeInsets.all(15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'E-mail',
                  style: TextStyle(
                    color: Colors.indigo,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 15, right: 15),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFC5CAE9FF).withOpacity(0.25),
                    blurRadius: 30,
                    spreadRadius: 20,
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.indigo[50],
                  hintText: 'Enter your e-mail here',
                  hintStyle: TextStyle(fontSize: 18),
                  contentPadding: EdgeInsets.all(15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Password',
                  style: TextStyle(
                    color: Colors.indigo,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 15, right: 15),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFC5CAE9FF).withOpacity(0.25),
                    blurRadius: 30,
                    spreadRadius: 20,
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.indigo[50],
                  hintText: 'Enter the password',
                  hintStyle: TextStyle(fontSize: 18),
                  contentPadding: EdgeInsets.all(15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Confirm Password',
                  style: TextStyle(
                    color: Colors.indigo,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 15, right: 15),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFC5CAE9FF).withOpacity(0.25),
                    blurRadius: 30,
                    spreadRadius: 20,
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.indigo[50],
                  hintText: 'Confirm your password',
                  hintStyle: TextStyle(fontSize: 18),
                  contentPadding: EdgeInsets.all(15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            SizedBox(height: 40),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Container(
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Color(0xffff751f),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

          ],
        ),
      ),
    );
  }
}