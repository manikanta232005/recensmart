
import 'package:flutter/material.dart';
import 'package:recensmart/categoryscreens/basicvegetablesscreen.dart';
import 'package:recensmart/categoryscreens/leafyvegetablesscreen.dart';
import 'package:recensmart/categoryscreens/seasonalitemsscreen.dart';
import 'package:provider/provider.dart';
import 'package:recensmart/favorite_model.dart';
import 'cart_model.dart';


/// Main CategoryCard widget
class CategoryCard extends StatelessWidget {
  final String image;
  final String text;

  const CategoryCard({
    super.key,
    required this.image,
    required this.text,
  });

  void _navigateToDetail(BuildContext context) {
    Widget destination;

    switch (text) {
      case 'Basic Vegetables':
        destination = const BasicVegetablesScreen();
        break;
      case 'Leafy Vegetables':
        destination = const LeafyVegetablesScreen();
        break;
      case 'Seasonal Items':
        destination = const SeasonalItemsScreen();
        break;
      default:
        destination = CategoryDetailScreen(categoryName: text);
    }

    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => destination),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _navigateToDetail(context),
      borderRadius: BorderRadius.circular(12),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(128, 128, 128, 0.3),

                  blurRadius: 6,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                image,
                height: 80,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

///  ProductCard widget


class ProductCard extends StatelessWidget {
  final String id;
  final String image;
  final String name;
  final String weight;
  final String price;
  final List<Map<String, String>>? variants;

  const ProductCard({
    super.key,
    required this.id,
    required this.image,
    required this.name,
    required this.weight,
    required this.price,
    this.variants,
  });

  String get displayWeight {
    if (weight.isNotEmpty) return weight;
    if (variants != null && variants!.isNotEmpty) {
      return variants![0]['weight'] ?? '';
    }
    return '';
  }

  String get displayPrice {
    if (price.isNotEmpty) return price;
    if (variants != null && variants!.isNotEmpty) {
      return variants![0]['price'] ?? '';
    }
    return '';
  }

  void _showVariantsBottomSheet(BuildContext context) {
    if (variants == null || variants!.isEmpty) return;

    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) {
        return DraggableScrollableSheet(
          expand: false,
          maxChildSize: 0.9,
          minChildSize: 0.3,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Center(
                    child: Text(
                      '$name Variants (${variants!.length})',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const Divider(),
                  ...variants!.map((variant) {
                    final variantWeight = variant['weight'] ?? '';
                    final variantPrice = variant['price'] ?? '';
                    final variantId = '$name-$variantWeight';

                    return ListTile(
                      leading: Image.asset(
                        image,
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                      title: Text(variantWeight),
                      subtitle: Text(
                        variantPrice,
                        style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: ElevatedButton(
                        onPressed: () {
                          Provider.of<CartModel>(context, listen: false).addItem(
                            CartItem(
                              id: variantId,
                              name: name,
                              image: image,
                              weight: variantWeight,
                              price: variantPrice,
                            ),
                          );
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Added $variantWeight of $name to cart'),
                            ),
                          );
                        },
                        child: const Text('ADD'),
                      ),
                    );
                  }),
                  const SizedBox(height: 16),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context);
    final quantity = cart.items
        .firstWhere(
          (i) => i.id == id,
          orElse: () => CartItem(
            id: '',
            name: '',
            image: '',
            weight: '',
            price: '',
            quantity: 0,
          ),
        )
        .quantity;

    return Container(
      width: 160,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color.fromRGBO(128, 128, 128, 0.3),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child: Image.asset(
                  image,
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
         Positioned(
  top: 8,
  right: 8,
  child: Consumer<FavoriteModel>(
    builder: (context, favoriteModel, _) {
      final isFav = favoriteModel.isFavorite(id);
      return CircleAvatar(
        backgroundColor: Colors.white,
        child: IconButton(
          icon: Icon(
            isFav ? Icons.favorite : Icons.favorite_border,
            color: Colors.red,
          ),
          onPressed: () {
            favoriteModel.toggleFavorite(id);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  isFav ? 'Removed from favorites' : 'Added to favorites',
                ),
              ),
            );
          },
        ),
      );
    },
  ),
),


            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              name,
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
              displayWeight,
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              displayPrice,
              style: const TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          if (variants != null && variants!.length > 1)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: OutlinedButton(
                onPressed: () => _showVariantsBottomSheet(context),
                child: Text('${variants!.length} Options'),
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: quantity > 0
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            cart.decreaseQuantity(id);
                          },
                          icon: const Icon(Icons.remove),
                        ),
                        Text(
                          quantity.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            cart.increaseQuantity(id);
                          },
                          icon: const Icon(Icons.add),
                        ),
                        IconButton(
                          onPressed: () {
                            cart.removeItem(id);
                          },
                          icon: const Icon(Icons.delete, color: Colors.red),
                        ),
                      ],
                    )
                  : ElevatedButton(
                      onPressed: () {
                        cart.addItem(
                          CartItem(
                            id: id,
                            name: name,
                            image: image,
                            weight: displayWeight,
                            price: displayPrice,
                          ),
                        );
                      },
                      child: const Text('ADD'),
                    ),
            ),
        ],
      ),
    );
  }
}


/// Fallback Category Detail Screen
class CategoryDetailScreen extends StatelessWidget {
  final String categoryName;

  const CategoryDetailScreen({
    super.key,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
      ),
      body: Center(
        child: Text(
          'Welcome to $categoryName!',
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

