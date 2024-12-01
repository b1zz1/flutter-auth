import 'package:flutter/material.dart';

class MyActionIcon extends StatelessWidget {
  const MyActionIcon({super.key, required this.onTap, required this.imagePath});

  final void Function() onTap;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Image.asset(
          imagePath,
          height: 40,
        ),
      ),
    );
  }
}
