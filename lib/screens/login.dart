import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/components/my_actionicon.dart';
import 'package:flutter_auth/components/my_button.dart';
import 'package:flutter_auth/components/my_textfield.dart';

class MySignInPage extends StatefulWidget {
  const MySignInPage({super.key});

  @override
  State<MySignInPage> createState() => _MySignInPageState();
}

class _MySignInPageState extends State<MySignInPage> {
  // Sign in input values
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // Signs the user in
  void signUserIn() {
    if (kDebugMode) {
      print('Username: ${usernameController.text}');
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
                        controller: usernameController,
                        label: 'Username',
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
                    MyButton(text: 'Sign-In', onPressed: signUserIn),
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
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyActionIcon(imagePath: 'assets/images/Google.png'),
                          // Empty space
                          SizedBox(width: 24),
                          MyActionIcon(imagePath: 'assets/images/Apple.png'),
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
