import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User?> signInWithEmailAndPassword(
    String email,
    String password,
    String displayName,
  ) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // If the user doesn't exist, create a new user
      if (result.user == null) {
        result = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        // Update user profile with display name
        await result.user!.updateDisplayName(displayName);
      }

      // Create admin document in Firestore (assuming this is the intended behavior)
      await _createAdminDocument(result.user!.uid, displayName, email);

      return result.user;
    } on FirebaseAuthException catch (error) {
      // Handle specific auth errors gracefully
      switch (error.code) {
        case 'user-not-found':
          // User does not exist, attempt to create a new user
          try {
            UserCredential newUser = await _auth.createUserWithEmailAndPassword(
              email: email,
              password: password,
            );
            // Update user profile with display name
            await newUser.user!.updateDisplayName(displayName);

            // Create admin document in Firestore (assuming this is the intended behavior)
            await _createAdminDocument(newUser.user!.uid, displayName, email);

            return newUser.user;
          } catch (error) {
            print('Error creating new user: $error');
            return null;
          }
        case 'wrong-password':
          print('Incorrect password. Please try again.');
          break;
        default:
          print('An error occurred: ${error.message}');
      }
      return null;
    } catch (error) {
      print('An unknown error occurred: $error');
      return null;
    }
  }

  Future<User?> createAccount(
    String email,
    String password,
    String displayName,
  ) async {
    try {
      UserCredential newUser = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Update user profile with display name
      await newUser.user!.updateDisplayName(displayName);

      // Create admin document in Firestore (assuming this is the intended behavior)
      await _createAdminDocument(newUser.user!.uid, displayName, email);

      return newUser.user;
    } catch (error) {
      print('Error creating new user: $error');
      return null;
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (error) {
      print('Error signing out: $error');
    }
  }

  Future<void> _createAdminDocument(
    String uid,
    String displayName,
    String email,
  ) async {
    try {
      await _firestore.collection('users').doc(uid).set({
        'displayName': displayName,
        'email': email,
        // Add other fields as needed
      });
    } catch (error) {
      print('Error creating admin document: $error');
      rethrow; // Rethrow the error to handle it in the calling code
    }
  }

  // Other methods...
}
