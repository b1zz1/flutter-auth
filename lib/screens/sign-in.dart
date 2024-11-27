import 'package:flutter/material.dart';
import 'package:login_app/components/my_textfield.dart';

class MySignInPage extends StatefulWidget {
  MySignInPage({super.key});

  @override
  State<MySignInPage> createState() => _MySignInPageState();
}

class _MySignInPageState extends State<MySignInPage> {
  // Store input values
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Center(
            child: Column(children: <Widget>[
              // Empty space
              const SizedBox(
                height: 50,
              ),
              // Logo
              const Icon(
                Icons.account_circle,
                size: 100,
              ),
              // Empty space
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Welcome to this app!',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
              // Empty space
              const SizedBox(
                height: 25,
              ),
              // Username field
              MyTextField(
                  controller: usernameController,
                  label: 'Username',
                  obscure: false),
              // Password field
              MyTextField(
                  controller: passwordController,
                  label: 'Password',
                  obscure: true),
            ]),
          ),
        ));
  }
}
