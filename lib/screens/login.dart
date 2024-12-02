import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/components/my_actionicon.dart';
import 'package:flutter_auth/components/my_button.dart';
import 'package:flutter_auth/components/my_textfield.dart';

import '../components/my_flashmessage.dart';
import '../services/auth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _MySignInPageState();
}

class _MySignInPageState extends State<Login> {
  // Sign in input values
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  /// Wraps a function to provide loading overlay and error display
  void handleSignIn(Future<dynamic> Function() action) async {
    // Displays a loading overlay
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) =>
          const Center(child: CircularProgressIndicator(color: Colors.black)),
    );

    // Executes the passed function
    final result = await action();

    // Checks if the widget is still mounted
    if (mounted) {
      // Display appropriate message based on the result
      if (result == null || result is User) {
        showFlashMessage(context, 'success', 'Login successful!');
      } else {
        showFlashMessage(context, 'error', result);
      }

      // Closes the loading overlay
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 48),
                    // Empty space
                    const Icon(Icons.lock, size: 100, color: Colors.black),
                    // Logo
                    const SizedBox(height: 48),
                    // Empty space
                    Text(
                      'Welcome back, please sign in',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[700]),
                    ),
                    const SizedBox(height: 12),
                    // Empty space
                    MyTextField(
                        controller: emailController,
                        label: 'Email',
                        obscure: false),
                    const SizedBox(height: 16),
                    // Empty space
                    MyTextField(
                        controller: passwordController,
                        label: 'Password',
                        obscure: true),
                    const SizedBox(height: 8),
                    // Empty space
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Forgot password?',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[600])),
                      ],
                    ),
                    const SizedBox(height: 24),
                    // Empty space
                    MyButton(
                      text: 'Sign In',
                      onPressed: () => handleSignIn(() async {
                        return await AuthService().signInWithEmail(
                          emailController.text,
                          passwordController.text,
                        );
                      }),
                    ),
                    const SizedBox(height: 24),
                    // Empty space
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child:
                                Divider(color: Colors.grey[400], thickness: 2)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            "Or continue with",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[700]),
                          ),
                        ),
                        Expanded(
                          child: Divider(color: Colors.grey[400], thickness: 2),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyActionIcon(
                              onTap: () => handleSignIn(() async {
                                    return await AuthService()
                                        .signInWithGoogle();
                                  }),
                              imagePath: 'assets/images/Google.png'),
                          const SizedBox(width: 24), // Empty space
                          MyActionIcon(
                              onTap: () => handleSignIn(() async {
                                    return await AuthService()
                                        .signInWithApple();
                                  }),
                              imagePath: 'assets/images/Apple.png'),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Not a member?',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[700]),
                        ),
                        const SizedBox(width: 4), // Empty space
                        const Text(
                          'Register now',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
