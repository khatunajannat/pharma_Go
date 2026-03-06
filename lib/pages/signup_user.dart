import 'package:flutter/material.dart';
import 'home_page_body.dart';

class SignupUserPage extends StatelessWidget {
  const SignupUserPage({super.key});

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
              'Create your pharmaGo account....',
              style: TextStyle(color: Colors.indigo, fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),

            Text(
              'Full Name',
              style: TextStyle(
                color: Colors.indigo,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
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
                  hintText: 'Enter your full name',
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

            Text(
              'E-mail',
              style: TextStyle(
                color: Colors.indigo,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
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

            Text(
              'Phone Number',
              style: TextStyle(
                color: Colors.indigo,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
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

            // Address
            Text(
              'Address',
              style: TextStyle(
                color: Colors.indigo,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
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
                  hintText: 'Enter your address',
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

            Text(
              'Age',
              style: TextStyle(
                color: Colors.indigo,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
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
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.indigo[50],
                  hintText: 'Enter your age',
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

            Text(
              'Password',
              style: TextStyle(
                color: Colors.indigo,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
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

            Text(
              'Confirm Password',
              style: TextStyle(
                color: Colors.indigo,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
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

            SizedBox(height: 50),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePageBody(),
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Sign up',
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