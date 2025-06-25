import 'package:flutter/material.dart';
class CartScreen extends StatelessWidget {
  const  CartScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(body: Column(
    children: [
      AppBar(title:
       Center(
         child: const Text('MY Cart',
         style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold),
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
