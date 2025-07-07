import 'package:flutter/material.dart';
import 'package:recensmart/categorycard.dart';
import 'package:recensmart/productsdata/products.dart';
class BasicVegetablesScreen extends StatelessWidget {
  const BasicVegetablesScreen({super.key});

  final List<Map<String, String>> products = BasicVegetablesProductsList.productsList;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Basic Vegetables')),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
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
