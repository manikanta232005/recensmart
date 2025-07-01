import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  //  image paths
  final List<String> promoImages = const [
    'assets/images/promobanner.jpg',
    'assets/images/promobanner.jpg',
    'assets/images/promobanner.jpg',
  ];

  final List<Map<String, String>> categories = const [
    {
      'image': 'assets/images/basicvegetablescategory.jpg',
      'text': 'Basic Vegetables',
    },
    {
      'image': 'assets/images/leafyvegetables.jpg',
      'text': 'Leafy Vegetables',
    },
    {
      'image': 'assets/images/cat3.png',
      'text': 'Seasional Items',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // 1. Horizontal image scroll
            SizedBox(
              height: 160,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: promoImages.length,
                separatorBuilder: (context, index) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      promoImages[index],
                      width: 280,
                      height: 180,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),

            // 2. SizedBox space below
            const SizedBox(height: 24),

            // 3. Categories Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: categories.map((category) {
                return Expanded(
                  child: Container(
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
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                          ),
                          child: Image.asset(
                            category['image']!,
                            height: 80,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            category['text']!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),

          ],
        ),
      ),
    );
  }
}





