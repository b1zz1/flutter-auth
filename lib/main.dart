import 'package:flutter/material.dart';
import 'package:flutter_auth/screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Auth',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MySignInPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
