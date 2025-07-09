
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recensmart/favorite_model.dart';
import 'package:recensmart/categorycard.dart';
import 'package:recensmart/productsdata/products.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  /// --- Cache all products in a Map for O(1) lookup ---
  Map<String, Map<String, dynamic>> get allProductsMap {
    final allProducts = [
      ...BasicVegetablesProductsList.productsList,
      ...LeafyVegetablesProductList.productsList,
      ...SeasonalItemsProductList.productsList,
    ];

    final Map<String, Map<String, dynamic>> map = {};
    for (final product in allProducts) {
      final id = product['id'];
      if (id != null) {
        map[id] = product;
      }
    }
    return map;
  }

  @override
  Widget build(BuildContext context) {
    final productsMap = allProductsMap; // Build once when widget builds

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Wishlist',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.5,
        automaticallyImplyLeading: false,
      ),
      body: Consumer<FavoriteModel>(
        builder: (context, favoriteModel, child) {
          final favoriteIds = favoriteModel.favoriteIds.toList();

          if (favoriteIds.isEmpty) {
            return const Center(
              child: Text(
                'Your wishlist is empty',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            );
          }

          return GridView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: favoriteIds.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
              childAspectRatio: 0.6,
            ),
            itemBuilder: (context, index) {
              final productId = favoriteIds[index];
              final product = productsMap[productId];

              if (product == null) {
                return const SizedBox.shrink();
              }

              final variants = product['variants'] != null
                  ? List<Map<String, String>>.from(product['variants'])
                  : null;

              final firstVariant = (variants != null && variants.isNotEmpty)
                  ? variants[0]
                  : null;
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
          );
        },
      ),
    );
  }
}
