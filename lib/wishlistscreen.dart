
// import 'package:flutter/material.dart';

// class WishlistScreen extends StatelessWidget {
//   const WishlistScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           AppBar(
//             title: const Center(
//               child: Text(
//                 'Wishlist',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black, // Dark black color
//                 ),
//               ),
//             ),
//             backgroundColor: Colors.white,
//             elevation: 0.5,
//             automaticallyImplyLeading: false,
//           ),
//           const Divider(
//             height: 1,
//             thickness: 1,
//             color: Color(0xFFE0E0E0), // light grey border
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recensmart/productsdata/products.dart';
import 'package:recensmart/favorite_model.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  // Helper to get all products from all categories
  List<Map<String, dynamic>> getAllProducts() {
    return [
      ...BasicVegetablesProductsList.productsList,
      ...LeafyVegetablesProductList.productsList,
      ...SeasonalItemsProductList.productsList,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<FavoriteModel>(
        builder: (context, favoriteModel, _) {
          final favoriteIds = favoriteModel.favoriteIds;

          // Get full product details for favorites
          final allProducts = getAllProducts();
          final favoriteProducts = allProducts.where((product) {
            final id = product['name'] ?? '';
            return favoriteIds.contains(id);
          }).toList();

          return Column(
            children: [
              AppBar(
                title: const Center(
                  child: Text(
                    'Wishlist',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
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
                color: Color(0xFFE0E0E0),
              ),
              Expanded(
                child: favoriteProducts.isEmpty
                    ? const Center(child: Text('No items in your wishlist.'))
                    : GridView.builder(
                        padding: const EdgeInsets.all(8),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: 0.7,
                        ),
                        itemCount: favoriteProducts.length,
                        itemBuilder: (context, index) {
                          final product = favoriteProducts[index];

                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                                    child: Image.asset(
                                      product['image'],
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    product['name'] ?? '',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Text(
                                    product['variants']?[0]?['weight'] ?? '',
                                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                                  child: Text(
                                    product['variants']?[0]?['price'] ?? '',
                                    style: const TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: IconButton(
                                    icon: const Icon(Icons.delete_outline),
                                    onPressed: () {
                                      favoriteModel.toggleFavorite(product['name'] ?? '');
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(content: Text('Removed from wishlist')),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}
