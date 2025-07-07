import 'package:flutter/material.dart';
import 'package:recensmart/categorycard.dart';
import 'package:recensmart/productsdata/products.dart';
class SeasonalItemsScreen extends StatelessWidget {
  const SeasonalItemsScreen({super.key});

  final List<Map<String, String>> products = SeasonalItemsProductList.productsList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Seasonal Items')),
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
