import 'package:flutter/material.dart';

class MyAvatar extends StatelessWidget {
  const MyAvatar({super.key, required this.user});

  final String? user;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: user != null
          ? ClipOval(
              child: Material(
                color: Colors.black.withOpacity(0.3),
                child: Image.network(
                  user ?? '',
                  fit: BoxFit.fitHeight,
                ),
              ),
            )
          : const ClipOval(
              child: Material(
                color: Colors.black,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Icon(
                    Icons.person,
                    size: 60,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
    );
  }
}
