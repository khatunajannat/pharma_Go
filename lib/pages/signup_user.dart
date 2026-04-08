import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'home_page_body.dart';

class SignupUserPage extends StatefulWidget {
  const SignupUserPage({super.key});

  @override
  State<SignupUserPage> createState() => _SignupUserPageState();
}

class _SignupUserPageState extends State<SignupUserPage> {

  final nameController     = TextEditingController();
  final emailController    = TextEditingController();
  final phoneController    = TextEditingController();
  final addressController  = TextEditingController();
  final ageController      = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController  = TextEditingController();

  bool isEmailValid = true;
  bool isPasswordMatch = true;

  // Email validation regex pattern
  bool validateEmail(String email) {
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegex.hasMatch(email);
  }

  Future<void> signUp() async {
    // Validate email format
    if (!validateEmail(emailController.text.trim())) {
      setState(() {
        isEmailValid = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid email format')),
      );
      return;
    }

    // Validate password match
    if (passwordController.text != confirmController.text) {
      setState(() {
        isPasswordMatch = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Passwords do not match')),
      );
      return;
    }

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'name':    nameController.text.trim(),
        'email':   emailController.text.trim(),
        'phone':   phoneController.text.trim(),
        'address': addressController.text.trim(),
        'age':     ageController.text.trim(),
      });

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePageBody()),
      );

    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? 'Signup failed')),
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
                controller: nameController,
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
                controller: emailController,
                onChanged: (value) {
                  setState(() {
                    if (value.isEmpty) {
                      isEmailValid = true;
                    } else {
                      isEmailValid = validateEmail(value);
                    }
                  });
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: isEmailValid ? Colors.indigo[50] : Colors.red[50],
                  hintText: 'Enter your e-mail here',
                  hintStyle: TextStyle(fontSize: 18),
                  contentPadding: EdgeInsets.all(15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: isEmailValid ? Colors.transparent : Colors.red,
                      width: isEmailValid ? 0 : 2,
                    ),
                  ),
                ),
              ),
            ),
            if (!isEmailValid)
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 8),
                child: Text(
                  'Invalid email format',
                  style: TextStyle(color: Colors.red, fontSize: 12),
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
                controller: phoneController,
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
                controller: addressController,
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
                controller: ageController,
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
                controller: passwordController,
                onChanged: (value) {
                  setState(() {
                    if (confirmController.text.isEmpty) {
                      isPasswordMatch = true;
                    } else {
                      isPasswordMatch = value == confirmController.text;
                    }
                  });
                },
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
                controller: confirmController,
                onChanged: (value) {
                  setState(() {
                    if (passwordController.text.isEmpty) {
                      isPasswordMatch = true;
                    } else {
                      isPasswordMatch = value == passwordController.text;
                    }
                  });
                },
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: isPasswordMatch ? Colors.indigo[50] : Colors.red[50],
                  hintText: 'Confirm your password',
                  hintStyle: TextStyle(fontSize: 18),
                  contentPadding: EdgeInsets.all(15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: isPasswordMatch ? Colors.transparent : Colors.red,
                      width: isPasswordMatch ? 0 : 2,
                    ),
                  ),
                ),
              ),
            ),
            if (!isPasswordMatch)
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 8),
                child: Text(
                  'Passwords do not match',
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),

            SizedBox(height: 50),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: signUp,
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