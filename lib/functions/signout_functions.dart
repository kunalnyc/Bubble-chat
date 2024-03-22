import 'package:bubble_chat/interface/interface.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthSignOut {
  Future<void> signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      // Navigate to Welcome Screen
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) =>
                WelcomeScreen()), // Replace WelcomeScreen() with your actual Welcome Screen widget
        (route) => false, // This will remove all routes from the stack
      );
    } catch (e) {
      // Handle sign-out errors
      print('Failed to sign out: $e');
      // Show a dialog to inform the user about the error
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Failed to sign out. Please try again later.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}
