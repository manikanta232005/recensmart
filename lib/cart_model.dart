import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String name;
  final String image;
  final String weight;
  final String price;
  int quantity;

  CartItem({
    required this.id,
    required this.name,
    required this.image,
    required this.weight,
    required this.price,
    this.quantity = 1,
  });
}

class CartModel extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);

  void addItem(CartItem item) {
    // Check if already in cart
    final existing = _items.indexWhere((i) => i.id == item.id);
    if (existing >= 0) {
      _items[existing].quantity += 1;
    } else {
      _items.add(item);
    }
    notifyListeners();
  }

  void increaseQuantity(String id) {
    final index = _items.indexWhere((i) => i.id == id);
    if (index >= 0) {
      _items[index].quantity += 1;
      notifyListeners();
    }
  }

  void decreaseQuantity(String id) {
    final index = _items.indexWhere((i) => i.id == id);
    if (index >= 0) {
      if (_items[index].quantity > 1) {
        _items[index].quantity -= 1;
      } else {
        _items.removeAt(index);
      }
      notifyListeners();
    }
  }

  void removeItem(String id) {
    _items.removeWhere((i) => i.id == id);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}
