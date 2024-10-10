import 'package:cloud_firestore/cloud_firestore.dart';
import '../data/models/api_response.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<ApiResponse<String>> createUser(
      String uId, String email, String name) async {
    try {
      await _firestore
          .collection('users')
          .doc(uId)
          .set({'email': email, 'name': name});
      return ApiResponse<String>(
          data: "Account created Successfully", success: true);
    } catch (e) {
      return ApiResponse<String>(
          error: ErrorResponse(0, 'An error occurred: $e'), success: false);
    }
  }
}
