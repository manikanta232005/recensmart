

// import 'package:flutter/material.dart';
// import 'package:recensmart/categorycard.dart';
// import 'package:recensmart/productsdata/products.dart';

// class BasicVegetablesScreen extends StatelessWidget {
//   const BasicVegetablesScreen({super.key});

//   final List<Map<String, dynamic>> products = BasicVegetablesProductsList.productsList;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Basic Vegetables'),
//         elevation: 0,
//       ),
//       body: Column(
//         children: [
//           const Divider(
//             height: 1,
//             thickness: 1,
//             color: Colors.grey,
//           ),
//           Expanded(
//             child: GridView.builder(
//               padding: const EdgeInsets.all(8),
//               itemCount: products.length,
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 1,
//                 mainAxisSpacing: 1,
//                 childAspectRatio: 0.6,
//               ),
//               itemBuilder: (context, index) {
//                 final product = products[index];

//                 // Check if variants exist
//                 final variants = product['variants'] != null
//                     ? List<Map<String, String>>.from(product['variants'])
//                     : null;

//                return ProductCard(
//   id: '${product['name']}_${product['weight'] ?? ''}',
//   image: product['image'] ?? '',
//   name: product['name'] ?? '',
//   weight: product['weight'] ?? '',
//   price: product['price'] ?? '',
//   variants: variants,
// );

//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:recensmart/categorycard.dart';
import 'package:recensmart/productsdata/products.dart';

class BasicVegetablesScreen extends StatelessWidget {
  const BasicVegetablesScreen({super.key});

  final List<Map<String, dynamic>> products = BasicVegetablesProductsList.productsList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Vegetables'),
        elevation: 0,
      ),
      body: Column(
        children: [
          const Divider(
            height: 1,
            thickness: 1,
            color: Colors.grey,
          ),
          Expanded(
            child: GridView.builder(
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

                // Get variants safely
                final variants = product['variants'] != null
                    ? List<Map<String, String>>.from(product['variants'])
                    : null;

                // Use the first variant as fallback
                final firstVariant = (variants != null && variants.isNotEmpty) ? variants[0] : null;
                final weight = firstVariant != null ? firstVariant['weight'] ?? '' : '';
                final price = firstVariant != null ? firstVariant['price'] ?? '' : '';

                return ProductCard(
                  id: product['id'] ?? '',
                  image: product['image'] ?? '',
                  name: product['name'] ?? '',
                  weight: weight,
                  price: price,
                  variants: variants,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
