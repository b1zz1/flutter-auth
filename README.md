# Flutter Auth

Created by [Eduardo Bizzi Martins](https://github.com/b1zz1) and [Júlia Letícia Hille](https://github.com/julialet).

This Flutter project was developed as a college assignment and serves as a template application for implementing a simple authentication system using Google, email, and password login.

---

## Getting Started

This section will guide you through the steps to set up and use the project.

---

### **1. Prerequisites**

Before running the project, ensure you have the following tools and versions installed:

#### **Environment Versions**
- **Flutter:** 3.24.3
- **Dart:** 3.5.3
- **SDK:** ^3.5.3

#### **Dependencies**
Add the following dependencies to your `pubspec.yaml` file:

```yaml
dependencies:
  firebase_core: ^3.8.0
  firebase_auth: ^5.3.3
  google_sign_in: ^5.2.1
```

Then, run the following command to add the necessary packages:

```bash
flutter pub get
```

## Set Up Firebase
Follow the [official Firebase setup guide for Flutter](https://firebase.google.com/docs/flutter/setup?hl=en&platform=android) to configure Firebase in your app.

# Methods

## `handleSignIn`

The `handleSignIn` method simplifies the process of handling user sign-in actions by providing a loading overlay during execution and displaying success or error messages afterward.

---

### Method Signature

```dart
void handleSignIn(Future<dynamic> Function() action)
```

## AuthService Methods

The `AuthService` class provides authentication functionalities for a Flutter application, including email/password login, Google login, Apple login (not implemented), and sign-out.

### Methods

### `signInWithEmail(String email, String password)`

**Description:**  
Signs a user in using their email and password.

**Parameters:**  
- `email` (String): The user's email address.  
- `password` (String): The user's password.

**Returns:**  
- `null` on success.  
- A descriptive error message on failure.

**Possible Errors:**  
- `'invalid-credential'`: Incorrect email or password.  
- `'invalid-email'`: Invalid email format.  
- `'channel-error'`: One or more fields are empty.  
- `'An unexpected error occurred.'`: Any unhandled exception.  
- `'An error occurred. Please check your connection and try again.'`: Network or other unexpected error.

---

### `signInWithGoogle()`

**Description:**  
Signs a user in using their Google account.

**Parameters:**  
None.

**Returns:**  
- `User` on success (the authenticated user object).  
- A descriptive error message on failure.

**Possible Errors:**  
- `'account-exists-with-different-credential'`: Email already assigned to another account.  
- `'invalid-credential'`: Invalid credentials.  
- `'An unexpected error occurred.'`: Any unhandled exception.  
- `'An error occurred. Please check your connection and try again.'`: Network or other unexpected error.

---

### `signInWithApple()`

**Description:**  
Intended to sign in a user using their Apple account. **Not yet implemented.**

**Parameters:**  
None.

**Returns:**  
- `'Apple login not yet implemented.'`

---

### `signOut()`

**Description:**  
Signs the user out of their current session.

**Parameters:**  
None.

**Returns:**  
- `null` on success.  
- `'Error signing out, please try again.'` on failure (only shown in debug mode).

**Possible Errors:**  
- Network or other unexpected error (debug logs printed in `kDebugMode`).

---

## Notes

1. All methods handle exceptions and provide meaningful error messages for common scenarios.
2. Debug logs are printed for unhandled exceptions when `kDebugMode` is enabled.
3. Apple login is a placeholder and not functional at this stage.

## Example Usage

```dart
final AuthService authService = AuthService();

// Email Sign-In
final emailSignInResult = await authService.signInWithEmail('user@example.com', 'password123');
if (emailSignInResult != null) {
  print('Error: $emailSignInResult');
} else {
  print('Signed in successfully.');
}

// Google Sign-In
final googleSignInResult = await authService.signInWithGoogle();
if (googleSignInResult is String) {
  print('Error: $googleSignInResult');
} else {
  print('Signed in as: ${googleSignInResult.email}');
}

// Sign Out
final signOutResult = await authService.signOut();
if (signOutResult != null) {
  print('Error: $signOutResult');
} else {
  print('Signed out successfully.');
}
