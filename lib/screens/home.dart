import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/my_avatar.dart';
import '../components/my_button.dart';
import '../components/my_header.dart';
import '../services/auth.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: Header(screenWidth: MediaQuery.of(context).size.width),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  MyAvatar(user: user?.photoURL), // User avatar
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Welcome,',
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        '${user?.displayName?.split(' ')[0]}',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${user?.email}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[700],
                    ),
                  ),
                ]),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MyButton(
                      text: 'Sign Out',
                      onPressed: () => AuthService().signOut(),
                    ),
                    const SizedBox(height: 48),
                    Text(
                      'Made by b1zz1 on Github',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
