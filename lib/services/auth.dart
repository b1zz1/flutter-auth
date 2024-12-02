import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  /// User sign in with email and password
  signInWithEmail(String email, String password) async {
    // Signs user in with provided email and password
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        return 'Incorrect email or password.';
      } else if (e.code == 'invalid-email') {
        return 'Invalid email format.';
      } else if (e.code == 'channel-error') {
        return 'One or more fields are empty.';
      } else {
        return 'An unexpected error occurred.';
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
      return 'An error occurred. Please check your connection and try again.';
    }
  }

  /// User sign in with Google
  signInWithGoogle() async {
    // Triggers the Google Sign In process
    final GoogleSignInAccount? googleSignInAccount =
        await GoogleSignIn().signIn();

    // Stores auth tokens after sign in
    final GoogleSignInAuthentication authentication =
        await googleSignInAccount!.authentication;

    // Creates a new credential for user
    final credential = GoogleAuthProvider.credential(
      accessToken: authentication.accessToken,
      idToken: authentication.idToken,
    );

    // Signs user in with credentials
    try {
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {
        return 'Email already assigned to another account.';
      } else if (e.code == 'invalid-credential') {
        return 'Invalid credentials.';
      } else {
        return 'An unexpected error occurred.';
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
      return 'An error occurred. Please check your connection and try again.';
    }
  }

  /// User sign in with Apple
  signInWithApple() {
    return 'Apple login not yet implemented.';
  }

  /// Signs the user out
  signOut() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      await googleSignIn.signOut();
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
        return 'Error signing out, please try again.';
      }
    }
  }
}
