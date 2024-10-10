import 'package:firebase_auth/firebase_auth.dart';
import 'package:shop/data/models/api_response.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<ApiResponse<User>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      // Attempt to sign in with email and password
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null && userCredential.user!.emailVerified) {
        // Return successful response with the user data
        return ApiResponse<User>(data: userCredential.user, success: true);
      } else {
        return ApiResponse<User>(
            error: ErrorResponse(0, 'Account not found'), success: false);
      }
    } on FirebaseAuthException catch (e) {
      // Handle specific FirebaseAuth errors
      String errorMessage;
      switch (e.code) {
        case 'user-not-found':
          errorMessage = 'No user found for that email.';
          break;
        case 'wrong-password':
          errorMessage = 'Incorrect password provided.';
          break;
        case 'invalid-email':
          errorMessage = 'The email address is not valid.';
          break;
        case 'user-disabled':
          errorMessage = 'This user account has been disabled.';
          break;
        default:
          errorMessage = 'An unknown error occurred: ${e.message}';
      }

      return ApiResponse<User>(
        error: ErrorResponse(0, errorMessage),
        success: false,
      );
    } catch (e) {
      return ApiResponse<User>(
        error: ErrorResponse(0, 'An unexpected error occurred: $e'),
        success: false,
      );
    }
  }

  Future<ApiResponse<User>> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      if (userCredential.user != null) {
        userCredential.user!.sendEmailVerification();
        return ApiResponse<User>(data: userCredential.user, success: true);
      } else {
        return ApiResponse<User>(
            error: ErrorResponse(0, 'Account not found'), success: false);
      }
    } on FirebaseAuthException catch (e) {
      // Handle specific FirebaseAuth errors using error codes
      String errorMessage;
      switch (e.code) {
        case 'email-already-in-use':
          errorMessage = 'This email address is already in use.';
          break;
        case 'invalid-email':
          errorMessage = 'The email address is not valid.';
          break;
        case 'operation-not-allowed':
          errorMessage = 'Email/password accounts are not enabled.';
          break;
        case 'weak-password':
          errorMessage = 'The password is too weak.';
          break;
        default:
          errorMessage = 'An unknown error occurred: ${e.message}';
      }

      return ApiResponse<User>(
          error: ErrorResponse(0, errorMessage), success: false);
    } catch (e) {
      // Catch any other unexpected errors
      return ApiResponse<User>(
          error: ErrorResponse(0, 'An unexpected error occurred: $e'),
          success: false);
    }
  }

  Future<ApiResponse<String>> deleteAccount() async {
    try {
      User? user = _auth.currentUser;

      if (user != null) {
        await user.delete();
        return ApiResponse<String>(
            data: "Account deleted Successfully", success: true);
      }
      return ApiResponse<String>(
          error: ErrorResponse(0, 'Account not found'), success: false);
    } catch (e) {
      return ApiResponse<String>(
          error: ErrorResponse(0, 'An error occurred: $e'), success: false);
    }
  }

  Future<ApiResponse<String>> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return ApiResponse<String>(
          data: "reset password email send", success: true);
    } catch (e) {
      return ApiResponse<String>(
          error: ErrorResponse(0, 'An error occurred: $e'), success: false);
    }
  }

  Future<void> signOutFromEmail() async {
    await _auth.signOut();
  }

  User? getCurrentUser() {
    return FirebaseAuth.instance.currentUser;
  }

  Stream<User?> get user => _auth.authStateChanges();
}
