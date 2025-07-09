// import 'package:flutter/material.dart';
// import 'package:recensmart/categorycard.dart';
// import 'package:recensmart/productsdata/products.dart';
// class LeafyVegetablesScreen extends StatelessWidget {
//   const LeafyVegetablesScreen({super.key});

//   final List<Map<String, dynamic>> products = LeafyVegetablesProductList.productsList;
  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Leafy Vegetables')),
//       body: GridView.builder(
//         padding: const EdgeInsets.all(8),
//         itemCount: products.length,
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 8,
//           mainAxisSpacing: 8,
//           childAspectRatio: 0.75,
//         ),
//         itemBuilder: (context, index) {
//           final product = products[index];
//           return ProductCard(
//             image: product['image']!,
//             name: product['name']!,
//             weight: product['weight']!,
//             price: product['price']!,
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:recensmart/categorycard.dart';
import 'package:recensmart/productsdata/products.dart';

class LeafyVegetablesScreen extends StatelessWidget {
  const LeafyVegetablesScreen({super.key});

  final List<Map<String, dynamic>> products = LeafyVegetablesProductList.productsList;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leafy Vegetables'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
          childAspectRatio: 0.6,
        ),
        itemBuilder: (context, index) {
          final product = products[index];

          // Check if variants exist
          final variants = product['variants'] != null
              ? List<Map<String, String>>.from(product['variants'])
              : null;

          return ProductCard(
  id: '${product['name']}_${product['weight'] ?? ''}',
  image: product['image'] ?? '',
  name: product['name'] ?? '',
  weight: product['weight'] ?? '',
  price: product['price'] ?? '',
  variants: variants,
);

        },
      ),
    );
  }
}
