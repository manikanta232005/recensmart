import 'dart:async';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:recensmart/categorycard.dart';

final bool isProduction = bool.fromEnvironment('dart.vm.product');

final Logger logger = Logger(
  level: isProduction ? Level.off : Level.debug,
  printer: PrettyPrinter(),
);

/// -------------------------
/// HomeScreen (main widget)
/// -------------------------
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> promoImages = [
    'assets/images/morningslotbanner.png',
    'assets/images/promobanner.jpg',
    'assets/images/promobanner.jpg',
  ];

  final List<Map<String, String>> categories = [
    {
      'image': 'assets/images/basicvegetablescategory.jpg',
      'text': 'Basic Vegetables',
    },
    {
      'image': 'assets/images/leafyvegetables.jpg',
      'text': 'Leafy Vegetables',
    },
    {
      'image': 'assets/images/seasonalcategory.png',
      'text': 'Seasonal Items',
    },
  ];

  int _currentPage = 0;
  late final PageController _pageController;
  Timer? _timer;
  bool _isDisposed = false;

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (_isDisposed || !_pageController.hasClients) return;

      _currentPage = (_currentPage + 1) % promoImages.length;

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      ).catchError((_) {});
    });
  }

  void _stopAutoScroll() {
    _timer?.cancel();
    _timer = null;
  }

  @override
  void dispose() {
    _isDisposed = true;
    _timer?.cancel();
    _pageController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SearchBarWidget(controller: _searchController),

            const SizedBox(height: 16),

            PromoCarousel(
              images: promoImages,
              pageController: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              onScrollStart: _stopAutoScroll,
              onScrollEnd: () {
                Future.delayed(const Duration(seconds: 2), () {
                  if (!_isDisposed) _startAutoScroll();
                });
              },
            ),

            const SizedBox(height: 12),

            PageIndicator(
              itemCount: promoImages.length,
              currentPage: _currentPage,
            ),

            const SizedBox(height: 24),

            const Text(
              "Categories",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 24),

            CategoryRow(categories: categories),
          ],
        ),
      ),
    );
  }
}

/// -------------------------
/// Search Bar Widget
/// -------------------------
class SearchBarWidget extends StatelessWidget {
  final TextEditingController controller;

  const SearchBarWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
         BoxShadow(
                     color: Colors.grey.shade300,
                      blurRadius: 6,
                     offset: const Offset(0, 4),
                  ),

        ],
      ),
      child: TextField(
        controller: controller,
        decoration: const InputDecoration(
          hintText: 'Search...',
          border: InputBorder.none,
          icon: Icon(Icons.search),
        ),
        onSubmitted: (query) {
          logger.i('Search: $query');
        },
      ),
    );
  }
}

/// -------------------------
/// Promo Carousel Widget
/// -------------------------
class PromoCarousel extends StatelessWidget {
  final List<String> images;
  final PageController pageController;
  final ValueChanged<int> onPageChanged;
  final VoidCallback onScrollStart;
  final VoidCallback onScrollEnd;

  const PromoCarousel({
    super.key,
    required this.images,
    required this.pageController,
    required this.onPageChanged,
    required this.onScrollStart,
    required this.onScrollEnd,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification is ScrollStartNotification) {
            onScrollStart();
          } else if (notification is ScrollEndNotification) {
            onScrollEnd();
          }
          return false;
        },
        child: PageView.builder(
          controller: pageController,
          itemCount: images.length,
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                images[index],
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            );
          },
          onPageChanged: onPageChanged,
        ),
      ),
    );
  }
}

/// -------------------------
/// Page Indicator Widget
/// -------------------------
class PageIndicator extends StatelessWidget {
  final int itemCount;
  final int currentPage;

  const PageIndicator({
    super.key,
    required this.itemCount,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(itemCount, (index) {
        bool isActive = index == currentPage;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          height: 8.0,
          width: isActive ? 20.0 : 8.0,
          decoration: BoxDecoration(
            color: isActive ? Colors.green : Colors.grey.shade400,
            borderRadius: BorderRadius.circular(12),
          ),
        );
      }),
    );
  }
}

/// -------------------------
/// Category Row Widget
/// -------------------------
class CategoryRow extends StatelessWidget {
  final List<Map<String, String>> categories;

  const CategoryRow({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: categories.map((category) {
        return Expanded(
          child: CategoryCard(
            image: category['image']!,
            text: category['text']!,
          ),
        );
      }).toList(), 
    );
  }
}
