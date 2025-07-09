// import 'package:flutter/material.dart';
// class CartScreen extends StatelessWidget {
//   const  CartScreen({super.key});
//   @override
//   Widget build(BuildContext context) => Scaffold(body: Column(
//     children: [
//       AppBar(title:
//        Center(
//          child: const Text('My Cart',
//          style: TextStyle(
//           fontSize: 20,
//           fontWeight: FontWeight.bold),
//           ),
//        ),
//         backgroundColor: Colors.white,
//             elevation: 0.5,
//             automaticallyImplyLeading: false,
//         ),
//        const Divider(
//             height: 1,
//             thickness: 1,
//             color: Color(0xFFE0E0E0), // light grey border
//           ),
//           Center(child: Text("Items"),)
//     ],
//   ),
//  );
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_model.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
        backgroundColor: Colors.white,
        elevation: 0.5,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          const Divider(
            height: 1,
            thickness: 1,
            color: Color(0xFFE0E0E0),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) {
                final item = cart.items[index];
                return ListTile(
                  leading: Image.asset(item.image, width: 40, height: 40),
                  title: Text(item.name),
                  subtitle: Text('${item.weight} - ${item.price}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove_circle_outline),
                        onPressed: () {
                          cart.decreaseQuantity(item.id);
                        },
                      ),
                      Text('${item.quantity}'),
                      IconButton(
                        icon: const Icon(Icons.add_circle_outline),
                        onPressed: () {
                          cart.increaseQuantity(item.id);
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete_outline),
                        onPressed: () {
                          cart.removeItem(item.id);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
