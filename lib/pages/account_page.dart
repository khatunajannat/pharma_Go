import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'My Account',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w500,
              color: Color(0xff364fab),
            ),
          ),
        ),
        SizedBox(height: 20),

        // Profile pic and name
        Center(
          child: Column(
            children: [
              Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                  color: Colors.indigo[100],
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.person, size: 55, color: Color(0xff364fab)),
              ),
              SizedBox(height: 10),
              Text(
                'Khatuna Jannat',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff364fab),
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 25),

        // Name card
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.10),
              borderRadius: BorderRadius.circular(16),
            ),
            padding: EdgeInsets.all(15),
            child: Row(
              children: [
                Icon(Icons.person_outline, color: Color(0xff364fab)),
                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Full Name', style: TextStyle(fontSize: 12, color: Colors.grey)),
                    SizedBox(height: 4),
                    Text('Khatuna Jannat', style: TextStyle(fontWeight: FontWeight.w600)),
                  ],
                ),
              ],
            ),
          ),
        ),

        // Mobile number card
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.orange.withOpacity(0.10),
              borderRadius: BorderRadius.circular(16),
            ),
            padding: EdgeInsets.all(15),
            child: Row(
              children: [
                Icon(Icons.phone_outlined, color: Color(0xff364fab)),
                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Mobile Number', style: TextStyle(fontSize: 12, color: Colors.grey)),
                    SizedBox(height: 4),
                    Text('+880 1234 567890', style: TextStyle(fontWeight: FontWeight.w600)),
                  ],
                ),
              ],
            ),
          ),
        ),

        // Email card
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.10),
              borderRadius: BorderRadius.circular(16),
            ),
            padding: EdgeInsets.all(15),
            child: Row(
              children: [
                Icon(Icons.email_outlined, color: Color(0xff364fab)),
                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Email', style: TextStyle(fontSize: 12, color: Colors.grey)),
                    SizedBox(height: 4),
                    Text('khatuna@email.com', style: TextStyle(fontWeight: FontWeight.w600)),
                  ],
                ),
              ],
            ),
          ),
        ),

        // Address card
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.orange.withOpacity(0.10),
              borderRadius: BorderRadius.circular(16),
            ),
            padding: EdgeInsets.all(15),
            child: Row(
              children: [
                Icon(Icons.location_on_outlined, color: Color(0xff364fab)),
                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Address', style: TextStyle(fontSize: 12, color: Colors.grey)),
                    SizedBox(height: 4),
                    Text('House 12, Road 4, Mohammedpur, Dhaka', style: TextStyle(fontWeight: FontWeight.w600)),
                  ],
                ),
              ],
            ),
          ),
        ),

        // Gender card
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.10),
              borderRadius: BorderRadius.circular(16),
            ),
            padding: EdgeInsets.all(15),
            child: Row(
              children: [
                Icon(Icons.person_2_outlined, color: Color(0xff364fab)),
                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Gender', style: TextStyle(fontSize: 12, color: Colors.grey)),
                    SizedBox(height: 4),
                    Text('Male', style: TextStyle(fontWeight: FontWeight.w600)),
                  ],
                ),
              ],
            ),
          ),
        ),

        // Logout button
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
          child: Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xff364fab),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Log Out',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),

        SizedBox(height: 20),
      ],
    );
  }
}