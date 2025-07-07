import 'package:flutter/material.dart';
import 'package:recensmart/categorycard.dart';
class BasicVegetablesScreen extends StatelessWidget {
  const BasicVegetablesScreen({super.key});

  final List<Map<String, String>> products = const [
    {
      'image': 'assets/basic_veg1.png',
      'name': 'Potato',
      'weight': '1 kg',
      'price': '₹30',
    },
    {
      'image': 'assets/basic_veg2.png',
      'name': 'Onion',
      'weight': '1 kg',
      'price': '₹40',
    },
    {
      'image': 'assets/basic_veg3.png',
      'name': 'Tomato',
      'weight': '1 kg',
      'price': '₹35',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Basic Vegetables')),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 0.75,
        ),
        itemBuilder: (context, index) {
          final product = products[index];
          return ProductCard(
            image: product['image']!,
            name: product['name']!,
            weight: product['weight']!,
            price: product['price']!,
          );
        },
      ),
    );
  }
}