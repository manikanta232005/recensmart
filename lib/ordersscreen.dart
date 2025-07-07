import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBar(
            title: const Center(
              child: Text(
                'Orders',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Dark black color
                ),
              ),
            ),
            backgroundColor: Colors.white,
            elevation: 0.5,
            automaticallyImplyLeading: false,
          ),
          const Divider(
            height: 1,
            thickness: 1,
            color: Color(0xFFE0E0E0), // light grey border
          ),
        ],
      ),
    );
  }
}
