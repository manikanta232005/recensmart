import 'package:flutter/material.dart';
import 'package:recensmart/categorycard.dart';
class LeafyVegetablesScreen extends StatelessWidget {
  const LeafyVegetablesScreen({super.key});

  final List<Map<String, String>> products = const [
    {
      'image': 'assets/leafy_veg1.png',
      'name': 'Spinach',
      'weight': '250 g',
      'price': '₹15',
    },
    {
      'image': 'assets/leafy_veg2.png',
      'name': 'Fenugreek',
      'weight': '250 g',
      'price': '₹20',
    },
    {
      'image': 'assets/leafy_veg3.png',
      'name': 'Coriander',
      'weight': '100 g',
      'price': '₹10',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Leafy Vegetables')),
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
