import 'package:flutter/material.dart';

class SellerPage extends StatelessWidget {
  const SellerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Text.rich(TextSpan(
              children: [
                TextSpan(text: 'Pharma',style: TextStyle(color: Color(0xff364fab), fontWeight: FontWeight.bold)),
                TextSpan(text: 'GO', style: TextStyle(color: Color(0xffff751f),fontWeight: FontWeight.bold)),
              ]
            )),
            Text.rich(TextSpan(
                children: [
                  TextSpan(text: 'Seller', style: TextStyle(color: Color(0xffff751f),fontWeight: FontWeight.bold, fontSize: 20)),

                ]
            )),
          ],
        ),
        
        leading:TextButton(child: Icon(Icons.arrow_back_ios), onPressed: (){},),
        actions:[Icon(Icons.qr_code_scanner),const SizedBox(width: 20)],
        ),
    );
  }
}

