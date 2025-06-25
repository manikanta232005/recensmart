import 'package:flutter/material.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(body: Column(
    children: [
      AppBar(title: const Text('Profile')),
       const Divider(
            height: 1,
            thickness: 1,
            color: Color(0xFFE0E0E0), // light grey border
          ),
    ],
  ));
}
