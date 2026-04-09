import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pharma_go/model/category_model.dart';
import 'package:pharma_go/model/for_you_model.dart';
import 'cart_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<CategoryModel> categories = [];
  List<ForYouModel> forYou = [];

  @override
  void initState() {
    super.initState();
    categories = CategoryModel.getCategories();
    forYou = ForYouModel.getForYou();
  }

  Future<void> _addToCart(ForYouModel item) async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;

    final cartRef = FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('cart');

    final existing = await cartRef
        .where('product', isEqualTo: item.product)
        .get();

    if (existing.docs.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${item.product} is already in cart')),
      );
      return;
    }

    await cartRef.add({
      'product': item.product,
      'price': item.text.contains('strip')
          ? _extractStripPrice(item.text)
          : _extractUnitPrice(item.text),
      'priceValue': _extractPriceValue(item.text),
      'quantity': '1 unit',
      'imageKey': _imageKeyFromProduct(item.product),
      'colorIndex': item.boxColor == Colors.blue ? 0 : 1,
      'addedAt': FieldValue.serverTimestamp(),
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${item.product} added to cart')),
    );
  }

  String _extractUnitPrice(String text) {
    final match = RegExp(r'Tk[\.\s]*([\d\.]+)').firstMatch(text);
    if (match != null) return 'Tk. ${match.group(1)}';
    return 'Tk. 0.00';
  }

  String _extractStripPrice(String text) {
    final match = RegExp(r'strip price[:\s]*Tk[\.\s]*([\d\.]+)', caseSensitive: false).firstMatch(text);
    if (match != null) return 'Tk. ${match.group(1)}';
    return _extractUnitPrice(text);
  }

  double _extractPriceValue(String text) {
    final match = RegExp(r'Tk[\.\s]*([\d\.]+)').firstMatch(text);
    if (match != null) return double.tryParse(match.group(1) ?? '0') ?? 0.0;
    return 0.0;
  }

  String _imageKeyFromProduct(String product) {
    if (product.contains('Napa')) return 'napa';
    if (product.contains('Cerelac') || product.contains('cerelac')) return 'cerelac';
    if (product.contains('Snail') || product.contains('COSRX')) return 'snail';
    if (product.contains('Whisper')) return 'whisper';
    return 'napa';
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          margin: EdgeInsets.only(top: 20, left: 15, right: 15),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color(0xFFC5CAE9FF).withOpacity(0.25),
                blurRadius: 40,
                spreadRadius: 0.10,
              ),
            ],
          ),
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.indigo[50],
              hintText: 'Search  medicines',
              hintStyle: TextStyle(fontSize: 18),
              contentPadding: EdgeInsets.all(15),
              prefixIcon: Icon(Icons.search),
              suffixIcon: Container(
                width: 100,
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      VerticalDivider(
                        color: Colors.deepPurple[600],
                        indent: 10,
                        endIndent: 10,
                        thickness: 2,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Icon(Icons.qr_code_scanner_rounded, size: 40),
                      ),
                    ],
                  ),
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        SizedBox(height: 30),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Category',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff364fab),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 120,
              child: ListView.separated(
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 15, right: 15),
                separatorBuilder: (context, index) => SizedBox(width: 25),
                itemBuilder: (context, index) {
                  return Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      color: categories[index].boxColor.withOpacity(.10),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 65,
                          width: 65,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: SvgPicture.asset(categories[index].icon),
                        ),
                        Text(
                          categories[index].name,
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        SizedBox(height: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Recomendation\n'
                    'For you',
                style: TextStyle(
                  fontSize: 23,
                  color: Color(0xff364fab),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                height: 330,
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Container(
                      width: 210,
                      decoration: BoxDecoration(
                        color: forYou[index].boxColor.withOpacity(0.10),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          forYou[index].image,
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Text(
                              forYou[index].product,
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: Text(forYou[index].text),
                          ),
                          SizedBox(height: 5),
                          TextButton(
                            onPressed: () => _addToCart(forYou[index]),
                            child: Container(
                              height: 30,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.pink[400],
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Add to cart',
                                    style: TextStyle(
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
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(width: 25),
                  scrollDirection: Axis.horizontal,
                  itemCount: forYou.length,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}