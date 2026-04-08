import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pharma_go/pages/home_page_body.dart';
import 'package:pharma_go/pages/homepage.dart';
import 'package:pharma_go/pages/selection_page.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
       debugShowCheckedModeBanner: false,

     home: SelectionPage(),


    );
  }
}