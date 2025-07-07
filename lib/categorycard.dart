
import 'package:flutter/material.dart';

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
                  color: Colors.grey.withOpacity(0.3),
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

/// Dedicated Screen for Basic Vegetables
class BasicVegetablesScreen extends StatelessWidget {
  const BasicVegetablesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Vegetables'),
      ),
      body: const Center(
        child: Text(
          'This is the Basic Vegetables screen.',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

/// Dedicated Screen for Leafy Vegetables
class LeafyVegetablesScreen extends StatelessWidget {
  const LeafyVegetablesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leafy Vegetables'),
      ),
      body: const Center(
        child: Text(
          'This is the Leafy Vegetables screen.',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

/// Dedicated Screen for Seasonal Items
class SeasonalItemsScreen extends StatelessWidget {
  const SeasonalItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seasonal Items'),
      ),
      body: const Center(
        child: Text(
          'This is the Seasonal Items screen.',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
