import 'package:flutter/material.dart';

class MyActionIcon extends StatelessWidget {
  const MyActionIcon({super.key, required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Image.asset(
        imagePath,
        height: 40,
      ),
    );
  }
}
