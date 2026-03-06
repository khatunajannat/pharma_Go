import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
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
            ),
            SizedBox(height: 15),
            Text(
              'E-mail',
              style: TextStyle(
                color: Colors.indigo,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                      //fillColor: Colors.white,
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
              ],
            ),

            SizedBox(height: 20),
            Text(
              'Password',
              style: TextStyle(
                fontSize: 18,
                color: Colors.indigo,
                fontWeight: FontWeight.w600,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
              ],
            ),

            SizedBox(height: 50),

            TextButton(onPressed: (){

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
                    Text('Log-in', style: TextStyle(
                      fontSize:18,
                      color:Colors.white,
                      fontWeight: FontWeight.w600,

                    ),
                                ),

                                   ],
                ),
              ),
            ),
            SizedBox(height:50),
            TextButton( onPressed :(){

            } ,
              child: Text(
                'Forgot password ?',
                style: TextStyle(
                  fontSize:15,
                  color: Colors.blue,

                ),

              ),
            ),

          ],

        ),
      ),
    );
  }
}
