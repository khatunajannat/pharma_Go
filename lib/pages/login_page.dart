import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home_page_body.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();


  Future<void> _login() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePageBody()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login failed: ${e.toString()}')),
      );
    }
  }

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
              'Welcome to pharmaGo ,Log-in to continue.... \n',
              style: TextStyle(color: Colors.indigo, fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 15),

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
                controller: _emailController,
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

              'Password',
              style: TextStyle(
                fontSize: 18,
                color: Colors.indigo,
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

                controller: _passwordController,
                obscureText: true,

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

            SizedBox(height: 50),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: _login,
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
                          'Log-in',
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

            SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(

                  onPressed: () {},

                  child: Text(
                    'Forgot password ?',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.blue,
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