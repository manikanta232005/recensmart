// import 'package:flutter/material.dart';
// import 'package:recensmart/categoryscreens/basicvegetablesscreen.dart';
// import 'package:recensmart/categoryscreens/leafyvegetablesscreen.dart';
// import 'package:recensmart/categoryscreens/seasonalitemsscreen.dart';
// /// Main CategoryCard widget
// class CategoryCard extends StatelessWidget {
//   final String image;
//   final String text;

//   const CategoryCard({
//     super.key,
//     required this.image,
//     required this.text,
//   });

//   void _navigateToDetail(BuildContext context) {
//     Widget destination;

//     switch (text) {
//       case 'Basic Vegetables':
//         destination = const BasicVegetablesScreen();
//         break;
//       case 'Leafy Vegetables':
//         destination = const LeafyVegetablesScreen();
//         break;
//       case 'Seasonal Items':
//         destination = const SeasonalItemsScreen();
//         break;
//       default:
//         destination = CategoryDetailScreen(categoryName: text);
//     }

//     Navigator.of(context).push(
//       MaterialPageRoute(builder: (_) => destination),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () => _navigateToDetail(context),
//       borderRadius: BorderRadius.circular(12),
//       child: Column(
//         children: [
//           Container(
//             margin: const EdgeInsets.symmetric(horizontal: 4),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(12),
//               boxShadow: [
//                 BoxShadow(
//                   color: const Color.fromARGB(77, 128, 128, 128), // ~30% opacity
//                   blurRadius: 6,
//                   offset: const Offset(0, 4),
//                 ),
//               ],
//             ),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(12),
//               child: Image.asset(
//                 image,
//                 height: 80,
//                 width: double.infinity,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             text,
//             style: const TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 14,
//             ),
//             textAlign: TextAlign.center,
//           ),
//         ],
//       ),
//     );
//   }
// }

// /// Generic ProductCard widget


// class ProductCard extends StatelessWidget {
//   final String image;
//   final String name;
//   final String weight;
//   final String price;
//   final List<Map<String, String>>? variants;

//   const ProductCard({
//     super.key,
//     required this.image,
//     required this.name,
//     required this.weight,
//     required this.price,
//     this.variants,
//   });

//   /// Fallback to first variant if weight is missing
//   String get displayWeight {
//     if (weight.isNotEmpty) return weight;
//     if (variants != null && variants!.isNotEmpty) {
//       return variants![0]['weight'] ?? '';
//     }
//     return '';
//   }

//   /// Fallback to first variant if price is missing
//   String get displayPrice {
//     if (price.isNotEmpty) return price;
//     if (variants != null && variants!.isNotEmpty) {
//       return variants![0]['price'] ?? '';
//     }
//     return '';
//   }

//   /// Show variants in a bottom sheet
//   void _showVariantsBottomSheet(BuildContext context) {
//     if (variants == null || variants!.isEmpty) return;

//     showModalBottomSheet(
//       context: context,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
//       ),
//       builder: (_) {
//   return SingleChildScrollView(
//     child: Padding(
//       padding: const EdgeInsets.symmetric(vertical: 16),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Text(
//             '$name Variants (${variants!.length})',
//             style: const TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 18,
//             ),
//           ),
//           const Divider(),
//           ...variants!.map((variant) {
//             final variantWeight = variant['weight'] ?? '';
//             final variantPrice = variant['price'] ?? '';
//             return ListTile(
//               leading: Image.asset(
//                 image,
//                 width: 40,
//                 height: 40,
//                 fit: BoxFit.cover,
//               ),
//               title: Text(variantWeight),
//               subtitle: Text(
//                 variantPrice,
//                 style: const TextStyle(
//                   color: Colors.green,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               trailing: ElevatedButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(
//                       content: Text('Added $variantWeight of $name to cart'),
//                     ),
//                   );
//                 },
//                 child: const Text('ADD'),
//               ),
//             );
//           }),
//         ],
//       ),
//     ),
//   );
// }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 160,
//       margin: const EdgeInsets.all(8),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: const Color.fromARGB(77, 128, 128, 128),
//             blurRadius: 6,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Stack(
//             children: [
//               ClipRRect(
//                 borderRadius: const BorderRadius.only(
//                   topLeft: Radius.circular(12),
//                   topRight: Radius.circular(12),
//                 ),
//                 child: Image.asset(
//                   image,
//                   height: 120,
//                   width: double.infinity,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               Positioned(
//                 top: 8,
//                 right: 8,
//                 child: CircleAvatar(
//                   backgroundColor: Colors.white,
//                   child: IconButton(
//                     icon: const Icon(Icons.favorite_border),
//                     color: Colors.red,
//                     onPressed: () {
//                       // Add favorite logic here
//                     },
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               name,
//               style: const TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 16,
//               ),
//               maxLines: 1,
//               overflow: TextOverflow.ellipsis,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8.0),
//             child: Text(
//               displayWeight,
//               style: const TextStyle(color: Colors.grey, fontSize: 14),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               displayPrice,
//               style: const TextStyle(
//                 color: Colors.green,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 16,
//               ),
//             ),
//           ),
//           if (variants != null && variants!.length > 1)
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 8.0),
//               child: OutlinedButton(
//                 onPressed: () => _showVariantsBottomSheet(context),
//                 child: Text('${variants!.length} Options'),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }


// /// Fallback Category Detail Screen
// class CategoryDetailScreen extends StatelessWidget {
//   final String categoryName;

//   const CategoryDetailScreen({
//     super.key,
//     required this.categoryName,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(categoryName),
//       ),
//       body: Center(
//         child: Text(
//           'Welcome to $categoryName!',
//           style: const TextStyle(fontSize: 20),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:recensmart/categoryscreens/basicvegetablesscreen.dart';
import 'package:recensmart/categoryscreens/leafyvegetablesscreen.dart';
import 'package:recensmart/categoryscreens/seasonalitemsscreen.dart';

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

/// Generic ProductCard widget
class ProductCard extends StatelessWidget {
  final String image;
  final String name;
  final String weight;
  final String price;
  final List<Map<String, String>>? variants;

  const ProductCard({
    super.key,
    required this.image,
    required this.name,
    required this.weight,
    required this.price,
    this.variants,
  });

  /// Fallback to first variant if weight is missing
  String get displayWeight {
    if (weight.isNotEmpty) return weight;
    if (variants != null && variants!.isNotEmpty) {
      return variants![0]['weight'] ?? '';
    }
    return '';
  }

  /// Fallback to first variant if price is missing
  String get displayPrice {
    if (price.isNotEmpty) return price;
    if (variants != null && variants!.isNotEmpty) {
      return variants![0]['price'] ?? '';
    }
    return '';
  }

  /// Show variants in a bottom sheet
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
    return Container(
      width: 160,
      margin: const EdgeInsets.all(8),
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
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: const Icon(Icons.favorite_border),
                    color: Colors.red,
                    onPressed: () {
                      // Add favorite logic here
                    },
                  ),
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

