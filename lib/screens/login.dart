import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/components/my_actionicon.dart';
import 'package:flutter_auth/components/my_button.dart';
import 'package:flutter_auth/components/my_textfield.dart';

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

  // Signs the user in with email and password
  void emailSignIn() async {
    // Displays a loading overlay
    showDialog(
      context: context,
      builder: (context) =>
          const Center(child: CircularProgressIndicator(color: Colors.black)),
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (error) {
      if (error.code == 'user-not-found' || error.code == 'wrong-password') {
        kDebugMode ? print('Incorrect email or password.') : null;
      }
    }

    // Closes the loading overlay
    Navigator.pop(context);
  }

  // Signs the user in with Google
  void googleSignIn() async {
    if (kDebugMode) {
      print('Username: ${emailController.text}');
    }
    if (kDebugMode) {
      print('Password: ${passwordController.text}');
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
                    const SizedBox(height: 48), // Empty space
                    const Icon(Icons.lock, size: 100), // Logo
                    const SizedBox(height: 50), // Empty space
                    Text(
                      'Welcome back, please sign in',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[700]),
                    ),
                    const SizedBox(height: 12), // Empty space
                    MyTextField(
                        controller: emailController,
                        label: 'Email',
                        obscure: false),
                    const SizedBox(height: 16), // Empty space
                    MyTextField(
                        controller: passwordController,
                        label: 'Password',
                        obscure: true),
                    const SizedBox(height: 8), // Empty space
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
                    const SizedBox(height: 24), // Empty space
                    MyButton(
                      text: 'Sign In',
                      onPressed: () => AuthService().signInWithEmail(
                          emailController.text, passwordController.text),
                    ),
                    const SizedBox(height: 24), // Empty space
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child:
                                Divider(color: Colors.grey[400], thickness: 2)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text("Or continue with",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[700])),
                        ),
                        Expanded(
                            child:
                                Divider(color: Colors.grey[400], thickness: 2)),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyActionIcon(
                              onTap: () => AuthService().signInWithGoogle(),
                              imagePath: 'assets/images/Google.png'),
                          // Empty space
                          const SizedBox(width: 24),
                          MyActionIcon(
                              onTap: () {},
                              imagePath: 'assets/images/Apple.png'),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Not a member?',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[700])),
                        const SizedBox(width: 4),
                        const Text('Register now',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue)),
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
